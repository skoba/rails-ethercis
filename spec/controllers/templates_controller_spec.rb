require 'rails_helper'

RSpec.describe TemplatesController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe '#index' do
    it "returns a success response" do
      person = Template.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end
end
