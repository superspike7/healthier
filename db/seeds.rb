# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do |n|
  random_number = rand.to_s[2..4]
  User.create!(username: "example#{random_number}", email: "example#{random_number}@example.com", password: 'abc123',
               password_confirmation: 'abc123', confirmed_at: Time.now.utc)
end

User.create!(username: 'admin123', email: 'admin@example.com', password: 'abc123',
             password_confirmation: 'abc123', confirmed_at: Time.now.utc, admin: true)
