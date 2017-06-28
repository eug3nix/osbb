# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
EstateType.create!(name: 'Квартира')
EstateType.create!(name: 'Паркоместо')
EstateType.create!(name: 'Коммерческая недвиижимость')
PersonEstateStatus.create!(name:'Собственник')
PersonEstateStatus.create!(name:'Арендатор')
PersonEstateStatus.create!(name:'Житель')