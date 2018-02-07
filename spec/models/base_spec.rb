require 'rails_helper'

RSpec.describe Base, type: :model do
  describe 'Settings from configuration file under initializer' do
    it 'site_url is defined in configuration'  do
      expect(Base.site_url).to eq Ethercis['site']
    end

    example 'port' do
      expect(Base.port).to eq Ethercis['port']
    end

    example 'path_prefix' do
      expect(Base.path_prefex).to eq Ethercis['path_prefix']
    end
  end

  describe 'session management' do
    
    example 'set ehr_session' do
      expect{ Base.send(:set_ehr_session) }.not_to raise_error
    end
  end
end
