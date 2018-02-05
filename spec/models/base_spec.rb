require 'rails_helper'

RSpec.describe Base, type: :model do
  describe 'Settings from configuration file under initializer' do
    it 'site_url is defined in configuration'  do
      expect(Base.site_url).to eq Ethercis['site']
    end
  end
end
