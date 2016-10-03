
form = $("#new_contact")
result = $("#contact-response")

form.find(".form-group").removeClass('has-error')
result.removeClass('alert-success').removeClass('alert').html('')

<% if @contact.valid? %>

form[0].reset()
result.addClass('alert').addClass('alert-success').html('Спасибо, <%= @contact.name %>!<br />Я получил Ваше сообщение и скоро Вам отвечу!')

<% else %>

<% @contact.errors.messages.map do |k, message| %>
$("#contact_<%= k %>").closest('.form-group').addClass('has-error') if $("#contact_<%= k %>").length
<% end %>

<% end %>