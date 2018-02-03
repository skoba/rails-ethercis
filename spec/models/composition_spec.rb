require 'rails_helper'


RSpec.describe Composition, type: :model do
  JSON_DATA = <<END
{ 
        "/language":"ja",
        "/category":"openehr::433|event|",
        "/territory":"JP",
        "/content[openEHR-EHR-OBSERVATION.blood_pressure.v1]/data[at0001]/events[at0006]/data[at0003]/items[at0004]": "120,mmHg",
        "/content[openEHR-EHR-OBSERVATION.blood_pressure.v1]/data[at0001]/events[at0006]/data[at0003]/items[at0005]": "80,mmHg",
        "/content[openEHR-EHR-OBSERVATION.pulse.v1]/data[at0002]/events[at0003]/data[at0001]/items[at1005]": "72,mmHg"
}
END

  before(:all) do
    @ehr = Ehr.create(subject_id: SecureRandom.uuid)
    @composition = Composition.create(ehr_id: @ehr['ehrId'], template_id: 'VitalSignDemo', data: JSON_DATA)
  end

  example 'make composition' do
    expect(@composition.status).to eq 200
  end

  example 'domain part should be removed from id' do
    expect(@composition.id).to match /(\h)+-(\h)+-(\h)+-(\h)+-(\h)+/
  end

  xexample 'retrieve composition list form ehr_id' do
    ehr_id = 'ehrcd8abecd-9925-4313-86af-93aab4930eae'
    expect(Composition.find_by_ehr_id(ehr_id)).not_to be_empty
  end

  xexample 'retrieve a composition by id' do
    composition_id = '001081d0-9ced-4ce6-bc1d-431895cad08c'
    expect(Composition.find(composition_id)).not_to be_empty
  end

end

