FactoryBot.define do
  factory :character do
    name { Faker::Name.unique.name }
    character_class { ["rogue", "cleric", "druid"].sample }
    level { (1..20).to_a.sample }
  end
end
