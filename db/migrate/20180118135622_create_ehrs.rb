class CreateEhrs < ActiveRecord::Migration[5.1]
  def change
    create_table :ehrs do |t|

      t.timestamps
    end
  end
end
