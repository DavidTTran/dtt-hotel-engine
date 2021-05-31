class Character < ApplicationRecord
  validates :name, presence: true
  validates :character_class, inclusion: { in: [
    "barbarian",
    "bard",
    "cleric",
    "druid",
    "fighter",
    "monk",
    "monster",
    "paladin",
    "ranger",
    "rogue",
    "sorcerer",
    "warlock",
    "wizard"],
    message: "%{value} is not a valid class."
  }
  validates :level, numericality: { only_integer: true, greater_than: 0, less_than: 20, message: "Level must be between 1 and 21." }
  belongs_to :party, optional: true
end
