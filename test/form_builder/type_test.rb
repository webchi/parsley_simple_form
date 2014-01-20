require 'test_helper'

class TypeTest < ActionView::TestCase

  test "email" do
    with_parsley_form_for @user do |f|
      f.input :email
    end
    assert_select 'input[type=email]'
  end

  test "url" do
    with_parsley_form_for @user do |f|
      f.input :action, as: :url
    end
    assert_select 'input[type=url]'
  end

  test "digits" do
    with_parsley_form_for @user do |f|
      f.input :lock_version
    end
    assert_select 'input[data-parsley-type=digits]'
  end

  test "number" do
    with_parsley_form_for @user do |f|
      f.input :age
    end
    assert_select 'input[type=number]'
  end  

  test "phone" do
    with_parsley_form_for @user do |f|
      f.input :phone_number, as: :tel
    end
    assert_select 'input[type=tel]'
  end  

  test "alphanum" do
    with_parsley_form_for @user do |f|
      f.input :action, input_html: { :'data-parsley-type' => 'alphanum' }
    end
    assert_select 'input[data-parsley-type=alphanum]'    
  end

  test "date iso" do
    with_parsley_form_for @user do |f|
      f.input :created_at, as: :string, input_html: { :'data-parsley-type' => 'dateIso' }
    end
    assert_select 'input[data-parsley-type=dateIso]'    
  end

  test "url strict" do
    with_parsley_form_for @user do |f|
      f.input :action, input_html: { :'data-parsley-type' => 'urlstrict' }
    end
    assert_select 'input[data-parsley-type=urlstrict]'    
  end
end