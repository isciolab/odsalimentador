class CitiesController < ApplicationController

  def index
    ##trae todas las ciudades
    @cities= City.all
  end

  def new
    ##crea la instancia de la ciudad
    @city=City.new
  end

  def edit
    @city=City.find(params[:id])
  end

  def create
    @city=City.new(city_params)
    if @city.save
      redirect_to cities_url
    else
      render :new
    end

  end

  def show
    @city= City.find(params[:id])
  end

  ##metodos privados
  private

  ##nombre del modelo _params

  def city_params

    ##parametros permitidos
    params.require(:city).permit(:name)
  end

end
