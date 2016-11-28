
form = $("#new_contact")
result = $("#contact-response")

form.find(".form-group").removeClass('has-error')
result.removeClass('alert-success').removeClass('alert').html('')

<% if @contact.valid? %>

form[0].reset()
result.addClass('alert').addClass('alert-success').html('<%= t 'contacts.create.body.success_html', name: @contact.name %>')

<% else %>

<% @contact.errors.messages.map do |k, message| %>
$("#contact_<%= k %>").closest('.form-group').addClass('has-error') if $("#contact_<%= k %>").length
<% end %>

<% end %>