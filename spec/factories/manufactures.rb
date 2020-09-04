FactoryBot.define do
  factory :manufacturer do
    # Nome do fabricante deve ser unico
    sequence(:name) { |n| "Fabricante#{n}" }
  end
end
