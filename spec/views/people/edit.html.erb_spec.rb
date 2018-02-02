require 'rails_helper'

RSpec.describe "people/edit", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :name => "MyString",
      :gender => "MyString",
      :address => "MyString",
      :phone => "MyString",
      :ehr_id => ""
    ))
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(@person), "post" do

      assert_select "input[name=?]", "person[name]"

      assert_select "input[name=?]", "person[gender]"

      assert_select "input[name=?]", "person[address]"

      assert_select "input[name=?]", "person[phone]"

      assert_select "input[name=?]", "person[ehr_id]"
    end
  end
end
