module RegistrationsHelper
  def register_or_unregister_button(event, register)
    if @register
     button_to "Cancel Registration", event_registration_path(@event, @register), method: :delete
    else
     button_to "Register", event_registrations_path(@event)
   end
 end
end
