require 'test_helper'

class FormBuilderTest < ActionView::TestCase

  test 'builder input is html safe' do
    parsley_form_for @user do |f|
      assert f.input(:name).html_safe?
    end
  end

  test 'required constraint' do
    with_parsley_form_for @user do |f|
      f.input :name, required: true
    end
    assert_select 'input[data-required-message]'
  end

  test 'equalto constraint' do
    with_parsley_form_for @user do |f|
      f.input :password, required: true
      f.input :confirm_password, :equalto => :password 
    end
    assert_select 'input[data-equalto="#user_password"]'
  end

  test 'notblank constraint' do
    with_parsley_form_for @user do |f|
      f.input :email, notblank: true
    end
    assert_select 'input[data-notblank]'
  end

end