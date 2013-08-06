# Load the rails application
require File.expand_path('../application', __FILE__)
require 'pusher'
Pusher.app_id = '51119'
Pusher.key = '8fb376b55499b1c7c5c8'
Pusher.secret = 'afeade81c17e9c7f5f5b'

# Initialize the rails application
OfficeClassifieds::Application.initialize!
