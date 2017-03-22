# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "开始建立管理员账户。。。"

u = User.new
u.email = "leichaofan2024@gmail.com"
u.password = "123456"
u.password_confirmation = "123456"
u.is_admin = true
u.save

puts "成功建立账户"
