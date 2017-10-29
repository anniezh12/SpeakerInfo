class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
#overriding the default device method after_sign_in_path
  #before_action :
def after_sign_up_path_for(resource)
   new_user_path
end


  def after_sign_in_path_for(resource_or_scope)
     user_path(current_user)
   end
end
