module Admin
  class RolesController < Admin::BaseController
    before_action :set_role, only: [:show, :edit, :update, :destroy]

    def index
      @roles = Role.all.order(:code)
    end

    def show
    end

    def new
      @role = Role.new
    end

    def create
      @role = Role.new(role_params)

      if @role.save
        redirect_to @role, notice: "Role was created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @role.update(role_params)
        redirect_to @role, notice: "Role was updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @role.destroy

      redirect_to roles_path, notice: "Role was deleted successfully."
    end

    private

    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:code, :description, :admin, :user)
    end
  end
end