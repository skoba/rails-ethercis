json.extract! person, :id, :name, :gender, :date_of_birth, :address, :phone, :ehr_id, :created_at, :updated_at
json.url person_url(person, format: :json)
