ParsleySimpleForm
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

Contributions
-------------

Feel free to make a PR or add an issue to the project :)