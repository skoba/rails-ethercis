require 'rails_helper'

RSpec.describe Ehr, type: :model do
  before(:all) do
    @person = create :person
    @ehr = Ehr.create(subject_id: @person.id)
  end

  describe 'create EHR with EtherCIS' do
    example 'create EHR' do
      expect(@ehr).not_to be_nil
    end

    example 'ehrId should not nil' do
      expect(@ehr.id).not_to be_empty
    end
  end

  describe 'get EHR from EtherCIS' do
    example 'EHR can retrieve by ID' do
      ehr = Ehr.find(@ehr.id) #, session_id: @session_id)
      expect(ehr).not_to be_nil
    end
  end

  describe 'delete EHR from EthrcCIS' do
    xexample 'EHR can delete EHR instance by ID' do
      Ehr.destroy(ehr_id: @ehr['ehrId'], session_id: @session_id)
    end
  end

  describe 'associations' do
    example 'collect compositions by association' do
      expect(@ehr.compositions).not_to be_nil
    end

    example 'person information from association' do
      expect(@ehr.person).not_to be_nil
    end
  end
end
