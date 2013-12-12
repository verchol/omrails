require 'open-uri'
namespace :db do
  desc "Fill database with sample data"
  task populateimages3: :environment do

	 User.all.each do |user|
      puts "[DEBUG] uploading images for user #{user.id} of #{User.last.id}"
      10.times do |n|
        #What I want here is perhaps an array that gets the list of file names
        #via a wildcard - basically anything.jpg and puts them in an array
        #then use the elements of the array and append to the url - .../sample/blah
        #and pop from the array until empty
        #example - this link works - https://s3.amazonaws.com/event_sample_images/sample/IMG_0537.jpg
        #but the link to just the sample directory does not  .../sample
        #image_url = 'https://s3.amazonaws.com/event_sample_images/sample/*.jpg'
        #description = %w(cool awesome crazy wow adorbs incredible).sample
        #user.pins.create!(image: image, description: description)
      end
    end
  end
end