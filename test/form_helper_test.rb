require 'test_helper'

class FormHelperTest < ActionView::TestCase

  test 'parsley_form_for yields an instance of FormBuilder' do
    parsley_form_for @user do |f|
      assert f.instance_of?(ParsleySimpleForm::FormBuilder)
    end
  end

  test 'form attribute novalidate as true' do
    with_parsley_form_for @user do |f|
      f.input :name
    end
    assert_select 'form[data-parsley-validate][data-parsley-namespace=data-parsley-]'
  end

end