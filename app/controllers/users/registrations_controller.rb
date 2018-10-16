# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
   before_action :configure_account_update_params, only: [:update]
   prepend_before_action :require_no_authentication, only: :cancel
   include Devise::Controllers::Helpers

  def newuser

    @user=User.new

  end

  # GET /resource/sign_up
   def new
     @user=User.new
   end

  # POST /resource
   def create
     super
   end

  # GET /resource/edit
   def edit
    super
   end

  # PUT /resource
   def update
     super
   end

  # DELETE /resource
   def destroy
     super
   end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
   def cancel
     super
   end

    protected

   ##despues de creado el usuario, redirecciono al index de todos los usuarios
   def after_sign_up_path_for(user)
     return "/allusers"
   end

   ##despues de hacer el registro del usuario, el metodo create llama a sign_up que hace el login del usuario que se eesta registrando
  # que trae por defecto devise,
  # entonces lo que hago es crear uno nuevo aqui sobreescribiendo el de defecto, para que no loguee al usuario que se crea
   def sign_up(resource_name, resource)
     true
   end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :role_id,
                                                               :city_id, :identification, :name, :surname)}
   end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
   end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  #

end
