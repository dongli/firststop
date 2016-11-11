# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  { username: 'dongli', email: 'dongli@firststop.org', password: '12345678', password_confirmation: '12345678', role: 'admin' },
  { username: 'peter', email: 'peter@firststop.org', password: '12345678', password_confirmation: '12345678', role: 'author' },
  { username: 'alice', email: 'alice@firststop.org', password: '12345678', password_confirmation: '12345678', role: 'guest' }
])

guides = Guide.create([
  { title: 'STARMAN使用手册', abstract: '此手册介绍包管理器STARMAN的使用。' }
])

chapters = Chapter.create([
  { title: '安装STARMAN', abstract: '介绍如何安装STARMAN。' }
])

UserGuideJoin.create([
  { editor_id: 1, guide_id: 1 }
])
