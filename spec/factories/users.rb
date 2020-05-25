FactoryBot.define do
  factory :user do
    name { 'testUser' }
    email { 'test@test.com' }
    password { 'password' }
    confirmed_at { Date.today }
  end
end
