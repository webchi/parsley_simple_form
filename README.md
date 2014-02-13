ParsleySimpleForm
=================
[![Gem Version](https://badge.fury.io/rb/parsley_simple_form.png)](http://badge.fury.io/rb/parsley_simple_form) [![Code Climate](https://codeclimate.com/github/innvent/parsley_simple_form.png)](https://codeclimate.com/github/innvent/parsley_simple_form) [![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/gbmoretti/parsley_simple_form/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

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

Don't forget to add parsley.js to your project. You can do it by adding the gem [parsley-rails](https://github.com/mekishizufu/parsley-rails) to project's Gemfile (we don't recommend this approach) or use a package manager like [Bower](https://github.com/bower/bower).

Contributions
-------------

Feel free to make a PR or add an issue to the project :)



