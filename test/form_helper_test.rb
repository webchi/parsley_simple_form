require 'test_helper'

class FormHelperTest < ActionView::TestCase

  test 'ParsleySimpleForm for yields an instance of FormBuilder' do
    parsley_form_for :user do |f|
      assert f.instance_of?(ParsleySimpleForm::FormBuilder)
    end
  end
end