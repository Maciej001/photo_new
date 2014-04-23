namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Maciej Nowakowski",
                 email: "maciej@gmail.com",
                 password: "korek001",
                 password_confirmation: "korek001",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   admin: true)
    end
  end
end