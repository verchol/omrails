require 'open-uri'
namespace :db do
  desc "Fill database with sample data"
  task populateimage: :environment do

	User.all.each do |user|
      puts "[DEBUG] uploading images for user #{user.id} of #{User.last.id}"
      10.times do |n|
        image = open('http://s3.amazonaws.com/event_sample_images').sample
        description = %w(cool awesome crazy wow adorbs incredible).sample
        user.pins.create!(image: image, description: description)
      end
    end
  end
end