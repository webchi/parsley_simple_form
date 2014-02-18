ParsleySimpleForm [![Gem Version](https://badge.fury.io/rb/parsley_simple_form.png)](http://badge.fury.io/rb/parsley_simple_form) [![Code Climate](https://codeclimate.com/github/innvent/parsley_simple_form.png)](https://codeclimate.com/github/innvent/parsley_simple_form) [![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/gbmoretti/parsley_simple_form/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
=================


This project uses MIT-LICENSE.

Client-side validation helper powered by [simple_form](http://github.com/plataformatec/simple_form) and [parsley.js](http://parsleyjs.org/)

Usage
--------

Use `parsley_form_for` to automatically add client-side validation to your form.

This code:
```erb
<%= parsley_form_for(@user) do |f| %>
  <%= f.input :name %>
  <%= f.input :password %>
  <%= f.input :password_confirmation, equalto: :password %>
<% end %>
```

Automatically adds required constraint to inputs which are required attributes, and validates equality of `password` and `password_confirmation`.

Don't forget to add parsley.js to your project. You can do it by adding the gem [parsley-rails](https://github.com/mekishizufu/parsley-rails) to project's Gemfile (we don't recommend this approach) or use a front-end package manager like [Bower](https://github.com/bower/bower).

This gem supports all parsley's [basic constraints](http://parsleyjs.org/documentation.html#basic-constraints) 

### Required
For required constraint you can let ParsleySimpleForm infer about the constraint (by ActiveRecord `validates_presence_of`) or explicitly indicate this in the field

```erb
<%= f.input :password, required: true %>
```

### Not blank
Check if that value is not blank
```erb
<%= f.input :name %>
```

### Min/Max length
Validates minimum or maximum length of the field value string
```erb
<%= f.input :password, minlength: 6 %>
<%= f.input :nickname, maxlength: 10 %>
```

### Range length
Check if the field have and string between the range
```erb
<%= f.input :password, rangelength: 5..10 %>
```
Note: You can use a Range object or a string, ie "[5,10]"


### Min/Max
Validates the numerical value of a field
```erb
<%= f.input :drivers, max: 1 %>
<%= f.input :passengers, min: 0 %>
```

### Range
Validate numerical value between a range
```erb
<%= f.input :passengers, range: 1..4 %>
```

### RegExp
Checks with the string matches with a given expression
```erb
<%= f.input :twitter_account, regexp: '$@' %>
``` 

### Equal to
Validates if the value between two fields are identical
```erb
<%= f.input :password %>
<%= f.input :password_confirmation, equalto: :password %>
```

### Min/Max/Range check
Validates that a certain minimum/maximum number of checkboxes in a group are checked. You can define a group by giving the same name to radio / checkboxes elements or add a `check_group` property to each one of them
```erb
<%= f.input :active_red, mincheck: 2, check_group: 'leds' %>
<%= f.input :active_green, check_group: 'leds' %>
<%= f.input :active_blue, check_group: 'leds' %>
````

Or for a range:
```erb
<%= f.input :active_red, rangencheck: 1...2, check_group: 'leds' %>
<%= f.input :active_green, check_group: 'leds' %>
<%= f.input :active_blue, check_group: 'leds' %>
````


Contributions
-------------

Feel free to make a PR or add an issue to the project :)



