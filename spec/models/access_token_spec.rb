require Rails.root.join('lib/client_credential')

RSpec.describe AccessToken do
  before(:all) { @session_id = AccessToken.get }

  example 'get session id' do
    expect(@session_id).not_to be_nil
  end

  example 'drop session by session id' do
    expect(AccessToken.drop(@session_id)).not_to be_nil
  end
end
