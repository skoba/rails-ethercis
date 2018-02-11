FactoryBot.define do
  factory :person do
    Faker::Config.locale = :ja
    name { Faker::Name.name }
    gender { Faker::Demographic.sex }
    date_of_birth { Faker::Date.birthday.to_s }
    address { Faker::Address.full_address }
    phone { Faker::PhoneNumber.cell_phone }
#    ehr_id ""
  end
end
