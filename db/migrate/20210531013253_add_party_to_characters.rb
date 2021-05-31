class AddPartyToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_reference :characters, :party, null: true, foreign_key: true
  end
end
