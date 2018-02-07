class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :gender
      t.date :date_of_birth
      t.string :address
      t.string :phone
      t.string :ehr_id

      t.timestamps
    end
  end
end
