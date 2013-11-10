# config/initializers/paperclip.rb
Paperclip::Attachment.default_options[:s3_host_name] = 'event_sample_images.amazonaws.com'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'