class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login: params[:login])

    if user&.authenticate(params[:password])
      reset_session
      session[:user_id] = user.id

      if user.role.admin?
        redirect_to admin_roles_path, notice: "Logged in successfully."
      else
        redirect_to users_roles_path, notice: "Logged in successfully."
      end
    else
      flash.now[:alert] = "Invalid login or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "Logged out successfully."
  end
end