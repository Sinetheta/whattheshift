FactoryBot.define do
  factory :user do
    email { generate(:email) }
    password { 'secret' }
    password_confirmation { password }
  end
end
