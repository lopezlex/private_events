module RegistrationsHelper
  def register_or_unregister_button(event, register)
    if @event.status == 'public'
      if @register
        button_to "Cancel Registration", event_registration_path(@event, user_id: current_user.id), method: :delete
      else
        # button_to "Register", event_registrations_path(@event)
        button_to "Register", event_registrations_path(@event, user_id: current_user.id)
      end
    else
      button_to "Cancel Invitation", event_registration_path(@event, user_id: current_user.id), method: :delete
    end
  end

  # def invite_or_uninvite_button(event, invite, user)
  #   if @invite.user
  #     button_to "Cancel Invitation", event_registration_path(@event, user_id: user.id), method: :delete
  #   else
  #     button_to "Invite", event_registrations_path(@event, user_id: user.id)
  #   end
  # end
end