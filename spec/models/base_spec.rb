require 'rails_helper'

RSpec.describe Base, type: :model do
  describe 'Settings from configuration file under initializer' do
    it 'site_url is defined in configuration'  do
      expect(Base.host).to eq Ethercis['host']
    end

    example 'port' do
      expect(Base.port).to eq Ethercis['port']
    end

    example 'path_prefix' do
      expect(Base.path_prefix).to eq Ethercis['path_prefix']
    end

    example 'username' do
      expect(Base.username).to eq Ethercis['username']
    end

    example 'password' do
      expect(Base.password).to eq Ethercis['password']
    end

    example 'full_uri' do
      expect(Base.full_uri).to eq "#{Ethercis['host']}:#{Ethercis['port']}/#{Ethercis['path_prefix']}"
    end

    example 'subject namespace' do
      expect(Base.subject_namespace).to eq Ethercis['subject_namespace']
    end
  end

  describe 'session management' do
    example 'set ehr_session' do
      expect{ Base.send(:set_ehr_session) }.not_to raise_error
    end

    example 'remobe ehr_session' do
      expect{ Base.send(:close_ehr_session) }.not_to raise_error
    end
  end
end
