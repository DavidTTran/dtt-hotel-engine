class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :level, default: 1
      t.string :class

      t.timestamps
    end
  end
end
