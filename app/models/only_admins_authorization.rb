class OnlyAdminsAuthorization < ActiveAdmin::AuthorizationAdapter

  def authorized?(action, subject = nil)
    case user
    when normalized(Pin)
      if controller == :admin
        user.admin?
      else
        true
      end
    else
      true
    end
  end

end
