require 'test_helper'

class FormBuilderTest < ActionView::TestCase

  test 'builder input is html safe' do
    parsley_form_for @user do |f|
      assert f.input(:name).html_safe?
    end
  end

  test 'adds a valid constraint type i18n' do 
    with_parsley_form_for @user do |f|
      f.input :credit_limit
    end
    assert_select 'input[data-type-number-message]'
  end

  test 'doesnt add invalid constraint type i18n' do
    with_parsley_form_for @user do |f|
      f.input :name
    end
    assert_select 'input[data-type-string-message]', 0   
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

  test 'equalto constraint on nested form' do
    with_parsley_form_for @user do |f|
      f.simple_fields_for @post do |posts_form|
        posts_form.input :password
        posts_form.input :password_confirmation, equalto: :password
      end
    end
    assert_select 'input[data-equalto="#user_post_attributes_password"]'
  end

  test 'minlenght constraint' do
    with_parsley_form_for @user do |f|
      f.input :password, minlength: 10
    end
    assert_select 'input[data-minlength=10]'
  end

  test 'maxlenght constraint' do
    with_parsley_form_for @user do |f|
      f.input :password, maxlength: 5
    end
    assert_select 'input[data-maxlength=5]'
  end

  test 'notblank constraint' do
    with_parsley_form_for @user do |f|
      f.input :email, notblank: true
    end
    assert_select 'input[data-notblank]'
  end

end