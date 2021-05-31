class Party < ApplicationRecord
  validates_uniqueness_of :name, message: "A party by the name %{value} already exists."
  has_many :characters
end
