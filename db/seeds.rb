# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Manufacturers (Fabricantes Default)

volkswagem = Manufacturer.create!(name: 'Volkswagen')
mercedes = Manufacturer.create!(name: 'Mercedes')

# Car Category (Categorias de Carro Default)
car_category_a = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 100)
car_category_b = CarCategory.create!(name: 'B', daily_rate: 80, car_insurance: 70, third_part_insurance: 150)

# Customers (Clientes Default)
Customer.create!(name: 'Lucas', document: '508.218.249.15', email: 'lucas@gmail.com')
Customer.create!(name: 'Diana', document: '408.018.249.90', email: 'diana@gmail.com')

# Car models (Modelos de Carro Default)
CarModel.create!(name: 'Ferrari', year: 1955, manufacturer: volkswagem,
					motorization: '5.0', fuel_type: 'Flex', car_category: car_category_a)

CarModel.create!(name: 'Porchi', year: 2000, manufacturer: mercedes,
					motorization: '1.0', fuel_type: 'Flex', car_category: car_category_b)
