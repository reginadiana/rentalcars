FactoryBot.define do
  factory :subsidiary do
    sequence(:name) { |n| "ACCENTURE#{n}" }
    sequence(:cnpj) { CNPJ.generate(formated: true) }
    address { 'Rua: Masp' }
  end
end
