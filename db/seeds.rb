# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create!(name: '管理員', email: 'vzxc@gmail.com', password: '123456', admin: true)
user = User.create!(name: '使用者1', email: 'fdsa@gmail.com', password: '123456')

12.times do |i|
  FactoryBot.create(:task, title: "title #{i}", user_id: user.id, tag_list: Faker::Games::Zelda.item )
end

