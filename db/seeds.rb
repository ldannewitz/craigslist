# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Article.destroy_all
Category.destroy_all

Category.create!(name: 'cars')
Category.create!(name: 'housing')
Category.create!(name: 'gigs')

30.times do
  Article.create!(
    title: Faker::Commerce.product_name,
    description: Faker::Hipster.paragraph,
    location: Faker::Address.city,
    price: Faker::Commerce.price,
    image: Faker::Avatar.image,
    email: Faker::Internet.email,
    category_id: Category.all.sample.id
    )
end


