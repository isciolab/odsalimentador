
class RolesController < ApplicationController

  def index
    ##trae todos los roles
    @roles= Role.where(delete_at: [nil])
  end

  def new
    ##crea la instancia del rol
    @role=Role.new
  end

  def edit
    @role=Role.find(params[:id])
  end

  def create
    @role=Role.new(role_params)
    if @role.save
      redirect_to roles_url
    else
      render :new
    end

  end

  def update
    @role = Role.find(params[:id])
    if @role.update_attributes(role_params)
      redirect_to roles_url
    else
      render 'edit'
    end
  end

  def show
    @role= Role.find(params[:id])
  end

  def deleterole
    ##abre el modal para borrarlo
    @role=Role.find(params[:id])
  end

  def destroy
    @role = Role.find(params[:id])
    if @role.update_attributes(delete_at:DateTime.now.to_datetime)
      redirect_to roles_url
    else
      render :edit
    end
  end

  ##metodos privados
  private

  def role_params
    ##parametros permitidos
    params.require(:role).permit(:name)
  end

end
