# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

require 'active_model'
require 'action_controller'
require 'action_view'
require 'action_view/template'

require 'action_view/test_case'

require "rails/generators/test_case"

require 'simple_form'

require_relative 'support/user'

module Rails
  def self.env
    ActiveSupport::StringInquirer.new("test")
  end
end

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end

class ActionView::TestCase
  include SimpleForm::ActionViewExtensions::FormHelper
  include ParsleySimpleForm::ActionViewExtensions::FormHelper

  setup :setup_users

  def protect_against_forgery?
    false
  end

  def user_path(*args)
    '/users'
  end

  def company_user_path(*args)
    '/company/users'
  end

  def setup_users(extra_attributes = {})
    @user = User.build(extra_attributes)
  end

  alias :users_path :user_path
  alias :super_user_path :user_path
  alias :validating_user_path :user_path
  alias :validating_users_path :user_path
  alias :other_validating_user_path :user_path
end