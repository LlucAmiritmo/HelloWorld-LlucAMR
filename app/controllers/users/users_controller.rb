module Users
  class UsersController < Users::BaseController
    before_action :set_user, only: [:show]

    def index
      @users = User.includes(:role).order(:login)
    end

    def show
    end

    private

    def set_user
      @user = User.find(params[:id])
    end
  end
end