ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'minitest/rails/capybara'

require 'test_password_helper'

# Include the test password helpers in our fixtures
ActiveRecord::FixtureSet.context_class.send :include, TestPasswordHelper

class ActiveSupport::TestCase
  # Setup fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  include TestPasswordHelper
end
