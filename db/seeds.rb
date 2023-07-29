require "faker"
require "open-uri"

puts "Clearing database..."

User.destroy_all
Profile.destroy_all

puts "Destroyed all users & profiles."

admin = User.create!(first_name: "Only", last_name: "Devs", email: "admin@onlydevs.com", password: "password")

puts "--Admin Account--\nEmail: admin@onlydevs.com \nPassword: password"
puts "-----------------\n"

city = ['New York', 'London']
work_experience = [ '< 1 year', '1 - 2 years', '3 - 4 years', '4 - 5 years', '5 - 10 years', "10+ years"]
discipline = ['Front End', 'Back End', 'Full Stack']
tech_stack = ['Javascript', 'HTML', 'CSS', 'Ruby', 'Python', 'Java', 'PHP', 'C++']

text = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "", "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium"]

puts "Creating users and profiles..."
n = 0

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.create!(first_name: first_name, last_name: last_name, email: "#{first_name.downcase}@mail.com", password: "password")
  profile = Profile.new(
    user_id: user.id,
    name: user.first_name,
    city: city.sample,
    work_experience: work_experience.sample,
    discipline: discipline.sample,
    tech_stack: tech_stack.sample(rand(2..8)),
    answer_one: text.sample,
    answer_two: text.sample,
    answer_three: text.sample,
    answer_four: text.sample,
    answer_five: text.sample,
    )
  # avatar active storage
  file = URI.open("https://source.unsplash.com/random/300x300/?avatar")
  profile.avatar.attach(io: file, filename: "#{first_name}.png", content_type: "image/png")
  profile.save!
  n += 1
end

puts "Created #{n} users and profiles."
