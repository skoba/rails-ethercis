class Person < ApplicationRecord
  def self.create(params)
    person = super
    person.ehr_id = Ehr.create(subject_id: person.id).id
    person.save
    person
  end

  def ehr
    Ehr.find(self.ehr_id)
  end
  # def destroy
  #   Ehr.destroy(ehr_id: self.ehr_id)
  #   super
  # end
end
