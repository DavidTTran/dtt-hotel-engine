FactoryBot.define do
  factory :party do
    name { Faker::Team.unique.name }
  end
end
