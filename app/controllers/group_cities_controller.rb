class GroupCitiesController < ApplicationController

  def index
    ##trae todos los grupos de ciudad
    @groupcities= GroupCity.where(delete_at:[nil])
  end

  def new
    ##crea la instancia del grupo
    @groupcity=GroupCity.new
  end

  def edit
    @groupcity=GroupCity.find(params[:id])
  end

  def create
    @groupcity=GroupCity.new(group_city_params)
    if @groupcity.save
      redirect_to group_cities_url
    else
      render :new
    end

  end

  def update
    @groupcity = GroupCity.find(params[:id])
    if @groupcity.update_attributes(group_city_params)
      redirect_to group_cities_url
    else
      render 'edit'
    end
  end

  def show
    @groupcity= GroupCity.find(params[:id])
  end

  def deletegroupcity
    ##abre el modal para borrarlo
    @groupcity=GroupCity.find(params[:id])
  end

  def destroy
    @groupcity = GroupCity.find(params[:id])
    if @groupcity.update_attributes(delete_at:DateTime.now.to_datetime)
      redirect_to group_cities_url
    else
      render :edit
    end
  end

  ##metodos privados
  private
  def group_city_params
    ##parametros permitidos
    params.require(:group_city).permit(:name,:description)
  end

end
