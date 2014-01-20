require 'test_helper'

class ConstraintsTest < ActionView::TestCase

  test 'builder input is html safe' do
    parsley_form_for @user do |f|
      assert f.input(:name).html_safe?
    end
  end

  test 'adds a valid constraint type i18n' do 
    with_parsley_form_for @user do |f|
      f.input :credit_limit
    end
    assert_select 'input[data-parsley-type-number-message]'
  end

  test 'doesnt add invalid constraint type i18n' do
    with_parsley_form_for @user do |f|
      f.input :name
    end
    assert_select 'input[data-parsley-type-string-message]', 0   
  end

  test 'required constraint' do
    with_parsley_form_for @user do |f|
      f.input :name, required: true
    end
    assert_select 'input[data-parsley-required-message]'
  end

  test 'equalto constraint' do
    with_parsley_form_for @user do |f|
      f.input :password, required: true
      f.input :confirm_password, :equalto => :password 
    end
    assert_select 'input[data-parsley-equalto="#user_password"]'
  end

  test 'equalto constraint on nested form' do
    with_parsley_form_for @user do |f|
      f.simple_fields_for @post do |posts_form|
        posts_form.input :password
        posts_form.input :password_confirmation, equalto: :password
      end
    end
    assert_select 'input[data-parsley-equalto="#user_post_attributes_password"]'
  end

  test 'minlenght constraint' do
    with_parsley_form_for @user do |f|
      f.input :password, minlength: 10
    end
    assert_select 'input[data-parsley-minlength=10]'
  end

  test 'maxlenght constraint' do
    with_parsley_form_for @user do |f|
      f.input :password, maxlength: 5
    end
    assert_select 'input[data-parsley-maxlength=5]'
  end

  test 'rangelenght constraint with string parameter' do
    mock_i18n({ :form_validation => { :message => { :rangelength => "%{min},%{max}" } } })
    with_parsley_form_for @user do |f|
      f.input :password, rangelength: "[1,5]"
    end
    assert_select "input[data-parsley-rangelength='[1,5]'][data-parsley-rangelength-message=1,5]"
  end

  test 'rangelength constraint with Range object as parameter' do
    mock_i18n({ :form_validation => { :message => { :rangelength => "%{min},%{max}" } } })
    with_parsley_form_for @user do |f|
      f.input :password, rangelength: 1..5
    end
    assert_select "input[data-parsley-rangelength='[1,5]'][data-parsley-rangelength-message=1,5]"
  end

  test 'notblank constraint' do
    with_parsley_form_for @user do |f|
      f.input :email, notblank: true
    end
    assert_select 'input[data-parsley-notblank]'
  end

  test 'min constraint' do
    mock_i18n({ :form_validation => { :message => { :min => "%{min}" } } })
    with_parsley_form_for @user do |f|
      f.input :credit_limit, min: 6
    end
    assert_select 'input[data-parsley-min-message=6][min=6][type=number]'
  end

  test 'max constraint' do
    mock_i18n({ :form_validation => { :message => { :max => "%{max}" } } })
    with_parsley_form_for @user do |f|
      f.input :credit_limit, input_html: { max: 6 }
    end
    assert_select 'input[data-parsley-max-message=6][max=6][type=number]'
  end

  test 'range constraint with Range object as parameter' do
    mock_i18n({ :form_validation => { :message => { :range => "%{min},%{max}" } } })
    with_parsley_form_for @user do |f|
      f.input :credit_limit, range: 1000..5000
    end
    assert_select "input[data-parsley-range='[1000,5000]'][data-parsley-range-message=1000,5000]"
  end

  test 'regexp constraint' do
    with_parsley_form_for @user do |f|
      f.input :name, regexp: "$@"
    end
    assert_select "input[pattern=$@]"
  end

  test 'min check' do
    with_parsley_form_for @user do |f|
      f.input :active, mincheck: 2, check_group: 'group'
    end
    assert_select "input[data-parsley-mincheck=2][data-parsley-group=group]"
  end

  test 'max check' do
    with_parsley_form_for @user do |f|
      f.input :active, maxcheck: 1
    end
    assert_select "input[data-parsley-maxcheck=1]"
  end

  test 'range check' do
    with_parsley_form_for @user do |f|
      f.input :active, rangecheck: 0..1
    end
    assert_select "input[data-parsley-rangecheck='[0,1]']"
  end

end