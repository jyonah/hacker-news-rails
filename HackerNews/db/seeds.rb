# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

INFO = {
  "jyonah" => "email@email.com",
  "eorear" => "otheremail@email.com",
  "jimmyjohn" => "jj@email.com",
  "faceman" => "faceemail@email.com",
  "max" => "maxsemail@email.com",
}


INFO.each do |username, email|
  User.create(username: username, email: email, password_digest: '1234')
end

User.all.each do |user|
  3.times do
    Post.create(title: Faker::Lorem.sentence, url: Faker::Internet.url, author_id: user.id)
  end
end

Post.all.each do |post|
  rand(3..5).times do
    Comment.create(post_id: post.id, body: Faker::Lorem.paragraphs(rand(1..4)), commenter_id: User.all.sample.id )
  end
end
