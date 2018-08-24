class GroupCitiesController < ApplicationController

  def index
    ##trae todos los grupos de ciudad
    @groupcities= GroupCity.all
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

  def show
    @groupcity= GroupCity.find(params[:id])
  end

  ##metodos privados
  private

  ##nombre del modelo _params
  def group_city_params
    ##parametros permitidos
    params.require(:groupcity).permit(:name)
  end

end
