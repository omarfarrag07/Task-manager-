# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

Task.create([
  { title: 'Task 1', description: 'Description for Task 1', status: 'new' },
  { title: 'Task 2', description: 'Description for Task 2', status: 'in_progress' },
  { title: 'Task 3', description: 'Description for Task 3', status: 'resolved' }
])
