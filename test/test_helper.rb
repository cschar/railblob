# ENV['RAILS_ENV'] ||= 'test'
ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper


  # Helper methods e.g. session_helper imported in base application controller
  # are not available in tests, we make another method
  # to imitate session_helper.rb:logged_in

  # Returns true if a test user is logged in.
  def is_logged_in?

    #session set in session_helper:log_in
    # during controller execution flow
    !session[:user_id].nil?
  end

end
