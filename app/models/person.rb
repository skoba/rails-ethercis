class Person < ApplicationRecord
  has_one :ehr

  def self.create(params)
    person = super
    person.ehr_id = Ehr.create(subject_id: person.id)
    person.save
    person
  end

  # def destroy
  #   Ehr.destroy(ehr_id: self.ehr_id)
  #   super
  # end
end
