# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Workspace.destroy_all


@moonchild = User.create(
  email: "moonc@email.com",
  username: "MoonChild",
  first_name: "Monique",
  last_name: "St Pierre",
  password: "1234567890"
)


@anna = User.create(
  email: "anna@email.com",
  username: "Anna",
  first_name: "Anna",
  last_name: "Baklova",
  password: "1234567890"
)


@nice = User.create(
  email: "brice@email.com",
  username: "Nice",
  first_name: "Jean",
  last_name: "Dujardin",
  password: "1234567890"
)



puts "Creating workspaces..."

Workspace.create!(
  title: "Quiet Place With 2 Room",
  address: "7 Boundary St, London E2 7JE",
  contact: "49494958586",
  price_per_day: 23,
  check_in_time: "12:00",
  check_out_time: "11:00",
  description:"Lorem Ipsum amor delet",
  max_guests: 2,
  bedrooms: 2,
  office: 2,
  bath: 2,
  wifi_speed: 100,
  user_id: @nice.id
  )
puts "Created Quiet Place With 2 Room"


Workspace.create!(
  title: "Loud Place With 2 Room",
  address: "7 Boundary St, London E2 7JE",
  contact: "49494958586",
  price_per_day: 23,
  check_in_time: "12:00",
  check_out_time: "11:00",
  description:"Lorem Ipsum amor delet",
  max_guests: 2,
  bedrooms: 2,
  office: 2,
  bath: 2,
  wifi_speed: 100,
  user_id: @anna.id
  )
  puts "Created Loud Place With 2 Room"


puts "Finished! Created #{Workspace.count} workspaces."
