require 'rails_helper'

RSpec.describe Composition, type: :model do
  example 'retrieve composition list form ehr_id' do
    ehr_id = 'ehrcd8abecd-9925-4313-86af-93aab4930eae'
    expect(Composition.find_by_ehr_id(ehr_id)).not_to be_empty
  end

  example 'retrieve a composition by id' do
    composition_id = '001081d0-9ced-4ce6-bc1d-431895cad08c'
    expect(Composition.find(composition_id)).not_to be_empty
  end
end
