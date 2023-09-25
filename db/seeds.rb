# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

TagToPost.destroy_all
Post.destroy_all
Tag.destroy_all
User.destroy_all

puts "============= CREATING USERS ==========================="

bob = User.create(username: 'Bob', email: 'bob@gmail.com', password: "password")
puts bob.username
patrick = User.create(username: 'Patrick', email: 'patrick@gmail.com', password: "password")
puts patrick.username
carlo = User.create(username: 'Carlo', email: 'carlo@gmail.com', password: "password")
puts carlo.username
sandy = User.create(username: 'Sandy', email: 'sandy@gmail.com', password: "password")
puts sandy.username

users = [bob, patrick, carlo, sandy]

puts "============= CREATING POSTS ==========================="

posts = []
15.times do
  post = Post.create(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph,
    user_id: users.sample.id,
    date: Faker::Date.between(from: 5.days.ago, to: Date.today)
  )
  puts post.title
  posts << post
end

puts "============= CREATING TAGS ==========================="

tags = []
10.times do
  tag = Tag.create(name: Faker::Book.genre)
  puts tag.name
  tags << tag
end

puts "============= CREATING TAGS RELATIONS ==========================="

10.times do
  TagToPost.create(
    post_id: posts.sample.id,
    tag_id: tags.sample.id
  )
end
