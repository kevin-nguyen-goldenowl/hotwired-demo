# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  after_action :after_login, only: %i[create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   self.resource = warden.authenticate!(auth_options)
  #   set_flash_message!(:notice, :signed_in) unless current_user&.otp_enable
  #   Clients::OtpMailer.otp_mailer(client: current_user).deliver_now! if current_user.has_role?('client') && current_user.otp_enable && !current_user.is_deactive?
  #   session[:otp_auth_session] = nil
  #   sign_in(resource_name, resource)
  #   yield resource if block_given?
  #   respond_with resource, location: after_sign_in_path_for(resource)
  # end

  # DELETE /resource/sign_out
  def destroy
    after_sign_out_path_for(current_user)
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
  end
end
