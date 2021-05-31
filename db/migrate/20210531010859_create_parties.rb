class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.string :name
      t.float :average_level

      t.timestamps
    end
  end
end
