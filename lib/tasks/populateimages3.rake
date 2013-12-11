require 'open-uri'
namespace :db do
  desc "Fill database with sample data"
  task populateimages3: :environment do

	 User.all.each do |user|
      puts "[DEBUG] uploading images for user #{user.id} of #{User.last.id}"
      10.times do |n|
        #image = image_remote_url('https://event_sample_images.s3-website-us-east-1.amazonaws.com').sample
        #description = %w(cool awesome crazy wow adorbs incredible).sample
        #user.pins.create!(image: image, description: description)
      end
    end
  end
end