# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |n|
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = "example-#{n+5}@example.com"
    password = "password"
    User.create!( first_name: first_name,
                  last_name: last_name,
                  email: email,
                  password: password,
                  password_confirmation: password)
  end

  users = User.last(20)

  users.each do |user|
    5.times do
      title = Faker::Music.genre
      user.playlists.create(title: title)
    end
  end

  playlists = Playlist.last(100)

  playlists.each do |playlist|
    5.times do
      tag_name = Faker::Beer.name
      playlist.tags.create(name: )
    end
  end


# create Rooms
# create SubscriptionOnUser
# create SubscriptionOnPlaylist
# create AddingTrackToUser
# create AddingTrackToPlaylist
# create Assessments
# create Comments
# create Notifications
