class RolesController < ApplicationController
  before_action :authenticate_user!

  def index
    ##trae todos los roles
    @roles = Role.where(delete_at: [nil])
  end

  def new
    ##crea la instancia del rol
    @role = Role.new
  end

  def edit
    @role = Role.find(params[:id])
  end

  def create
    @role = Role.new(role_params)
    respond_to do |format|
      if @role.save
        format.html {redirect_to roles_url, notice: 'Datos guardados con éxito'}
      else
        format.html {render "roles/create"}
        format.js # call create.js.erb on save errors
      end
    end

  end

  def update
    @role = Role.find(params[:id])
    respond_to do |format|
      if @role.update_attributes(role_params)
        format.html {redirect_to roles_url, notice: 'Datos guardados con éxito'}
      else
        format.html {render "roles/create"}
        format.js # call create.js.erb on save errors
      end
    end
  end

  def show
    @role = Role.find(params[:id])
  end

  def deleterole
    ##abre el modal para borrarlo
    @role = Role.find(params[:id])
  end

  def destroy
    @role = Role.find(params[:id])
    if @role.update_attributes(delete_at: DateTime.now.to_datetime)
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
