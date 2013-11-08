# config/initializers/paperclip.rb
Paperclip::Attachment.default_options[:s3_host_name] = 'event_sample_images.amazonaws.com'