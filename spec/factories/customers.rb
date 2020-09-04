FactoryBot.define do
  factory :customer do
    name { 'Giovana Avila' }
    document { CPF.generate(formated: true) }
    sequence(:email) { |n| "customer#{n}@test.com.br" }
  end
end
