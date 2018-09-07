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

  def update
    @city = City.find(params[:id])
    if @city.update_attributes(city_params)
      redirect_to cities_url
    else
      render 'edit'
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
    params.require(:city).permit(:name,:group_cities_id,:is_capital,:goal_group_id,:rccv_program,:total_population,
                                 :metropolitan_area,:city_system_dnp,:dnp_category,:ddt_typology,:department_id,:description)
  end

end
