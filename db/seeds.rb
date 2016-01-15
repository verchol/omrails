# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'
remote_base_url = "https://s3.amazonaws.com/event_sample_images/sample"
#remote_base_url = "https://www.dropbox.com/home/Apps/social-butterfly-images"

#remote_files = Dir.entries("sampleimage").select {|x| x =~ /.*(jpg)/ }
remote_files = ["IMG_0537.jpg", "IMG_0555.jpg", "IMG_0556.jpg", "IMG_0574.jpg", "IMG_0582.jpg", "IMG_0588.jpg", "IMG_0590.jpg", "IMG_0595.jpg", "IMG_0606.jpg", "IMG_0620.jpg", "IMG_0622.jpg", "IMG_0632.jpg", "IMG_0641.jpg", "IMG_0644.jpg", "IMG_0657.jpg", "IMG_0660.jpg", "IMG_0666.jpg", "IMG_0683.jpg", "IMG_0698.jpg", "IMG_0710.jpg", "IMG_0714.jpg", "IMG_0733.jpg", "IMG_0739.jpg", "IMG_0750.jpg", "IMG_0771.jpg", "IMG_0798.jpg", "IMG_0809.jpg", "IMG_0814.jpg", "IMG_0819.jpg", "IMG_0820.jpg", "IMG_0823.jpg", "IMG_0825.jpg", "IMG_0833.jpg", "IMG_0856.jpg", "IMG_0865.jpg", "IMG_0901.jpg", "IMG_0909.jpg", "IMG_0921.jpg", "IMG_0930.jpg", "IMG_0936.jpg", "IMG_0948.jpg", "IMG_0959.jpg", "IMG_0962.jpg", "IMG_0967.jpg", "IMG_0969.jpg", "IMG_0993.jpg", "IMG_1006.jpg", "IMG_1042.jpg", "IMG_1098.jpg", "IMG_1099.jpg", "IMG_1109.jpg", "IMG_1137.jpg", "IMG_1138.jpg", "IMG_1354.jpg", "IMG_3621.jpg", "IMG_4099.jpg", "IMG_4796.jpg", "IMG_5490.jpg", "IMG_5580.jpg"]

#build an array of full URLs
remote_full_url = []
remote_files.each do |file|
  full_url = remote_base_url + "/" + file
  remote_full_url << full_url
end
namespace :db do
  desc "Fill database with sample data"
  task populateimages3: :environment do
	 User.all.each do |user|
      puts "[DEBUG] uploading images for user #{user.id} of #{User.last.id}"
      5.times do |n|
        image = (remote_full_url).sample
        description = %w(cool awesome crazy wow adorbs incredible).sample
        user.pins.create!(image: image, description: description)
      end
    end
  end
end
