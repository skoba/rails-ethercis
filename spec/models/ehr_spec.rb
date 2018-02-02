require 'rails_helper'

RSpec.describe Ehr, type: :model do
#  it { should  have_many(:compositions) }

  before(:all) do
    @ehr = Ehr.create(subject_id: SecureRandom.uuid)
  end

  describe 'create EHR with EtherCIS' do
    example 'create EHR' do
      expect(@ehr['action']).to eq 'CREATE'
    end

    example 'ehrId should not nil' do
      expect(@ehr['ehrId']).not_to be_empty
    end
  end

  describe 'get EHR from EtherCIS' do
    example 'EHR can retrieve by ID' do
      ehr = Ehr.find(@ehr['ehrId'])
      expect(ehr).not_to be_nil
    end
  end

  describe 'delete EHR from EthrcCIS' do
    xexample 'EHR can delete EHR instance by ID' do
      Ehr.destroy(ehr_id: @ehr['ehrId'])
    end
  end
end
