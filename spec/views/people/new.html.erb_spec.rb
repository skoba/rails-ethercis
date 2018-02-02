require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, Person.new(
      :name => "MyString",
      :gender => "MyString",
      :address => "MyString",
      :phone => "MyString",
      :ehr_id => ""
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input[name=?]", "person[name]"

      assert_select "input[name=?]", "person[gender]"

      assert_select "input[name=?]", "person[address]"

      assert_select "input[name=?]", "person[phone]"

      assert_select "input[name=?]", "person[ehr_id]"
    end
  end
end
