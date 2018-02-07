class CreateCompositions < ActiveRecord::Migration[5.1]
  def change
    create_table :compositions do |t|

      t.timestamps
    end
  end
end
