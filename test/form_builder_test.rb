require 'test_helper'

class FormBuilderTest < ActionView::TestCase

  test 'builder input is html safe' do
    parsley_form_for @user do |f|
      assert f.input(:name).html_safe?
    end
  end

  test 'every input have a data-type-message' do
    with_parsley_form_for @user do |f|
      f.input :email
      f.input :password
      f.input :credit_limit
    end
    assert_select 'input#user_attributes_email[data-type-email-message]'
  end

  test 'required input have a data-required-message attribute' do
    with_parsley_form_for @user do |f|
      f.input :name, required: true
    end
    assert_select 'input[data-required-message]'
  end

  test 'equalto' do
    with_parsley_form_for @user do |f|
      f.input :password, required: true
      f.input :confirm_password, :equalto => :password 
    end
    assert_select 'input[data-equalto="#user_attributes_password"]'
  end

end