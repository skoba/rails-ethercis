require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        :name => "Name",
        :gender => "Gender",
        :address => "Address",
        :phone => "Phone",
        :ehr_id => "uuid"
      ),
      Person.create!(
        :name => "Name",
        :gender => "Gender",
        :address => "Address",
        :phone => "Phone",
        :ehr_id => "uuid"
      )
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "uuid".to_s, :count => 2
  end
end
