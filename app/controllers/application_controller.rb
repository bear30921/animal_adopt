class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception




  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:nickname, :email, :password, :password_confirmation)
    end
  end



  
end
