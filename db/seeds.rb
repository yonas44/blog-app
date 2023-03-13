# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# RAILS_ENV=test rails db:seed
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create(name: 'Yonas', photo: 'https://avatars.githubusercontent.com/u/72081991?v=4', email: 'test@gmail.com', password: '123123', password_confirmation: '123123', bio: 'I am super user')
user2 = User.create(name: 'Katie', photo: 'https://cdn2.psychologytoday.com/assets/styles/manual_crop_1_91_1_1528x800/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=7lrLYx-B', email: 'test2@gmail.com', password: '123123', password_confirmation: '123123', bio: 'Hello, Katie here..')

post1 = Post.create(author: user, title: "My first post", text: "This is my first post...")
post2 = Post.create(author: user, title: "My second post", text: "This is my second post...")
post3 = Post.create(author: user, title: "My third post", text: "This is my third post...")

post4 = Post.create(author: user2, title: "My first post", text: "This is my first post...")
post5 = Post.create(author: user2, title: "My second post", text: "This is my second post...")
post6 = Post.create(author: user2, title: "My third post", text: "This is my third post...")

comment1 = Comment.create(author: user2, post: post1, text: 'Hi Yonas, thanks for sharing!')