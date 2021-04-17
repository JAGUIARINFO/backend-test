FactoryBot.define do
  factory :complain do
    title { FFaker::Lorem.sentence }
    description { FFaker::Lorem.paragraph }
    city { FFaker::Address.city }
    state { FFaker::Lorem.word }
    country { FFaker::Address.country }
    company { FFaker::Company.name }
  end
end
