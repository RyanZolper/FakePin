class OnlyAuthorsAuthorization < ActiveAdmin::AuthorizationAdapter

  def authorized?(action, subject = nil)
    case user
    when normalized(Pin)
      # Only let the author update and delete posts
      if action == :update || action == :destroy
        user.id == Pin.user_id
      else
        true
      end
    else
      true
    end
  end

end
