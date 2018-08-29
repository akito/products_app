# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# for carrierwave
require "carrierwave/orm/activerecord"
