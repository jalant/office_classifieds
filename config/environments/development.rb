require 'pusher'
Pusher.app_id = '51119'
Pusher.key = '8fb376b55499b1c7c5c8'
Pusher.secret = 'afeade81c17e9c7f5f5b'
OfficeClassifieds::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.eager_load = false
  config.cache_classes = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Expands the lines which load the assets
  config.assets.debug = true

  # Devise

  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
end
