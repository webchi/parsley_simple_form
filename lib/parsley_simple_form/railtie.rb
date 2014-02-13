require 'rails'
require_relative 'form_builder'
require_relative 'action_view_extensions/form_helper'

Dir[File.join(File.dirname(__FILE__), 'concerns', '**', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'constraints', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'constraints', 'basics', '*.rb')].each {|file| require file }

module ParsleySimpleForm
  ActionView::Base.send :include, ActionViewExtensions::FormHelper
end 
