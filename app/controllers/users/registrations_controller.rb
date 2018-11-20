# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :html, :js
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

     # will be the similar to user = User.new(sign_up_params)
     build_resource(sign_up_params)

     resource.save

     ##if was saved
     if resource.persisted?

       if resource.active_for_authentication?
         puts "activo"
         set_flash_message :notice, :signed_up if is_flashing_format?
         sign_up(resource_name, resource)
         redirect_to allusers_url, notice: 'Datos guardados con éxito'
       else
         puts "inactivo"
         set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
         expire_data_after_sign_in!
         redirect_to allusers_url, notice: 'Datos guardados con éxito'
       end
     else
       ##
       clean_up_passwords resource
       set_minimum_password_length
       ##si entra aqui, es porque se hizo la validacion y retorno error

     end
   end

  # GET /resource/edit
   def edit
     @user = User.find(params[:id])
   end

  # PUT /resource
   def update
     # will be the similar to user = User.new(sign_up_params)
     build_resource(sign_up_params)

     puts resource.inspect
     resource.update_attributes


     ##if was saved
     if resource.persisted?

       if resource.active_for_authentication?
         puts "activo"
         set_flash_message :notice, :signed_up if is_flashing_format?
         sign_up(resource_name, resource)
         redirect_to allusers_url, notice: 'Datos guardados con éxito'
       else
         puts "inactivo"
         set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
         expire_data_after_sign_in!
         redirect_to allusers_url, notice: 'Datos guardados con éxito'
       end
     else
       puts "no actualizo"
       clean_up_passwords resource
       set_minimum_password_length
       ##si entra aqui, es porque se hizo la validacion y retorno error

     end
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
   def after_inactive_sign_up_path_for(resource)
     "/allusers"
   end
  #

end
