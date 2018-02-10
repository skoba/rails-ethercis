# coding: utf-8
require 'rails_helper'

JSON_DATA = <<'END'
{
        "/language": "ja",
        "/category": "openehr::433|event|",
        "/territory": "JP",
        "/composer|name": "Shinji Kobayashi",
        "/composer|identifier": "123456789",
        "/content[openEHR-EHR-OBSERVATION.blood_pressure.v1]/data[at0001]/events[at0006]/data[at0003]/items[at0004]": "120,mmHg",
        "/content[openEHR-EHR-OBSERVATION.blood_pressure.v1]/data[at0001]/events[at0006]/data[at0003]/items[at0005]": "80,mmHg",
        "/content[openEHR-EHR-OBSERVATION.pulse.v1]/data[at0002]/events[at0003]/data[at0001]/items[at0005]": "72,/min"
}
END

RSpec.describe Composition, type: :model do
  before(:all) do
    @ehr = Ehr.create(subject_id: SecureRandom.uuid)
    @composition = Composition.create(ehr_id: @ehr.id, template_id: 'VitalSignDemo', attributes: JSON_DATA)
  end

  example 'make composition' do
    expect(@composition.status).to eq 200
  end

  example 'domain part should be removed from id' do
    expect(@composition.id).to match /(\h)+-(\h)+-(\h)+-(\h)+-(\h)+/
  end

  example 'retrieve composition list form ehr_id' do
    expect(Composition.find_by_ehr_id(@ehr.id)).not_to be_empty
  end

  describe 'composition data' do
    let(:composition) { Composition.find(@composition.id) }
    
    example 'retrieve a composition by id' do
      expect(Composition.find(composition.id).id).to eq @composition.id
    end

    it 'systolic blood pressure is 120' do
      systolic_bp_path = 'encounter/血圧:0/任意のイベント:0/収縮期|magnitude'
      expect(composition.attributes[systolic_bp_path]).to eq 120.0
    end
  end
end
