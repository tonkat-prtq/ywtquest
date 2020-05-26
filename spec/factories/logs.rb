FactoryBot.define do
  factory :log do
    user { user }
    started_on { Time.now }
    ended_on { Time.now + 1.days }
  end

  factory :done, class: Done do
    title { 'やったこと' }
  end

  factory :knowledge, class: Knowledge do
    title { 'わかったこと' }
  end

  factory :todo, class: Todo do
    title { '次やること' }
    when_to_do { Time.now + 3.days }
  end
end