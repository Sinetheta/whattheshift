FactoryBot.define do
  factory :comparison do
    association :from_revision, factory: :revision
    association :to_revision, factory: :revision
    scenario
  end
end
