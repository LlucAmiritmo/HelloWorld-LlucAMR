module Admin
  class UsersController < Admin::BaseControllers
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :load_roles, only: [:new, :create, :edit, :update]

    def index
      @users = User.includes(:role).order(:login)
    end

    def show
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to @user, notice: "User was created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @user.update(user_params)
        redirect_to @user, notice: "User was updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy

      redirect_to users_path, notice: "User was deleted successfully."
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def load_roles
      @roles = Role.all.order(:code)
    end

    def user_params
      permitted_params = params.require(:user).permit(
        :name,
        :login,
        :role_id,
        :password,
        :password_confirmation
      )

      if action_name == "update" && permitted_params[:password].blank?
        permitted_params.delete(:password)
        permitted_params.delete(:password_confirmation)
      end

      permitted_params
    end
  end
end