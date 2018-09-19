
class RolesController < ApplicationController

  def index
    ##trae todos los roles
    @roles= Role.all
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

  ##metodos privados
  private

  ##nombre del modelo _params
  def role_params
    ##parametros permitidos
    params.require(:role).permit(:name)
  end

end
