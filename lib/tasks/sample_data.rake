namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_admin
  end
end

def make_users
  make_admin
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    username = "example-#{n+1}"
    password  = "password"
    User.create!(name: name, email: email,
                 username: username, password: password,
                 password_confirmation: password)
  end
end

def make_admin
  admin = User.create!(name: "admin", email: "timgreen1@outlook.com",
                       username: "admin", password: "password", 
                       password_confirmation: "password", admin: true)
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]

  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end