module Users
  class RolesController < Users::BaseController
    before_action :set_role, only: [:show]

    def index
      @roles = Role.all.order(:code)
    end

    def show
    end

    private

    def set_role
      @role = Role.find(params[:id])
    end
  end
end