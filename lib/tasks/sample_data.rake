namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		admin = User.create!(name: "Admin", email: "admin@example.com",
                         username: "admin", password: "password",
                         password_confirmation: "password", admin: true)

		User.create!(name: "Example User", username: "tim",
								 email: "tim@twitter.com", password: "password",
								 password_confirmation: "password")

		99.times do |n|
			name	= Faker::Name.name
			username = "example-#{n+1}"
			email = "example-#{n+1}@twitter.com"
			password	= "password"
			User.create!(name: name, username: username, email: email,
									 password: password, password_confirmation: password)
		end

		users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
	end
end