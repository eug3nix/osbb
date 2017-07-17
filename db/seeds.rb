# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
EstateType.find_or_create_by(name: 'Квартира')
EstateType.find_or_create_by(name: 'Паркоместо')
EstateType.find_or_create_by(name: 'Коммерческая недвиижимость')
PersonEstateStatus.find_or_create_by(name:'Собственник')
PersonEstateStatus.find_or_create_by(name:'Арендатор')
PersonEstateStatus.find_or_create_by(name:'Житель')
ContactType.find_or_create_by(name: 'Telephone')
ContactType.find_or_create_by(name: 'Email')
ContactType.find_or_create_by(name: 'Social')
ContactType.find_or_create_by(name: 'Messenger')