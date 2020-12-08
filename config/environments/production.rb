# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true
config.action_view.cache_template_loading            = true

# See everything in the log (default is :info)
# config.log_level = :debug

# Use a different logger for distributed setups
# config.logger = SyslogLogger.new

# Use a different cache store in production
# config.cache_store = :mem_cache_store

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host = "http://assets.example.com"

config.action_mailer.delivery_method = :sendmail
# Disable delivery errors, bad email addresses will be ignored
# config.action_mailer.raise_delivery_errors = false

ActionMailer::Base.delivery_method = :sendmail 
ActionMailer::Base.sendmail_settings = {  :location => '/usr/sbin/sendmail',  :arguments => '-i -t' } 
ActionMailer::Base.perform_deliveries = true 
ActionMailer::Base.raise_delivery_errors = true 
ActionMailer::Base.default_charset = "utf-8" 

#ActionMailer::Base.smtp_settings = {  :address => "95.142.44.43", :domain => "95.142.44.43",  :user_name => "web",  :password => "7Mrbm6QBsg",  :authentication => :plain } 
# Enable threaded mode
# config.threadsafe!