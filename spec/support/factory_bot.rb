RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do
  sequence(:email) { |n| "email#{n}@example.com" }
end
