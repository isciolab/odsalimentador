class GroupCitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    ##trae todos los grupos de ciudad
    @groupcities = GroupCity.where(delete_at: [nil])
  end

  def new
    ##crea la instancia del grupo
    @groupcity = GroupCity.new
  end

  def edit
    @groupcity = GroupCity.find(params[:id])
  end

  def create
    @groupcity = GroupCity.new(group_city_params)
    respond_to do |format|
      if @groupcity.save
        format.html {redirect_to group_cities_url, notice: 'Datos guardados con éxito'}
      else
        format.html {render "group_cities/create"}
        format.js # call create.js.erb on save errors
      end
    end

  end

  def update
    @groupcity = GroupCity.find(params[:id])
    respond_to do |format|
      if @groupcity.update_attributes(group_city_params)
        format.html {redirect_to group_cities_url, notice: 'Datos guardados con éxito'}
      else
        format.html {render "group_cities/create"}
        format.js # call create.js.erb on save errors
      end
    end
  end

  def show
    @groupcity = GroupCity.find(params[:id])
  end

  def deletegroupcity
    ##abre el modal para borrarlo
    @groupcity = GroupCity.find(params[:id])
  end

  def destroy
    @groupcity = GroupCity.find(params[:id])
    if @groupcity.update_attributes(delete_at: DateTime.now.to_datetime)
      redirect_to group_cities_url
    else
      render :edit
    end
  end

  ##metodos privados

  private

  def group_city_params
    ##parametros permitidos
    params.require(:group_city).permit(:name, :description)
  end

end
