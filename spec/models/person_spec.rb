require 'rails_helper'

RSpec.describe Person, type: :model do
  before(:all) do
    @person = Person.create(
      name: Faker::Name.name,
      gender: Faker::Demographic.sex,
      date_of_birth: Faker::Date.birthday.to_s,
      address: Faker::Address.full_address,
      phone: Faker::PhoneNumber.cell_phone
    )
  end

  example 'create with Ehr ID on ethercis' do
    expect(@person.ehr_id).not_to be_empty
  end


  example'delete with ehr' do
    expect{ @person.destroy }.to change { Person.count }.by(-1)
  end
end
