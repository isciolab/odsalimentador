class CitiesController < ApplicationController
  before_action :authenticate_user!
  def index
    ##trae todas las ciudades
    @cities= City.where(delete_at: [nil])
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

  def deletecity
    ##abre el modal para borrarlo
    @city=City.find(params[:id])
  end

  def destroy
    @city = City.find(params[:id])
    if @city.update_attributes(delete_at:DateTime.now.to_datetime)
      redirect_to cities_url
    else
      render :edit
    end
  end

  def tblcities
    @cities = City.where(delete_at: [nil]).order(:id)
  if params[:department]!=""
    @cities=@cities.where(department_id: params[:department])
  end
  render :partial => 'tblcities'
  end

  ##metodos privadosgroup_cities_id
  private
  def city_params

    ##parametros permitidos
    params.require(:city).permit(:name,:group_cities_id,:is_capital,:goal_group_id,:rccv_program,:total_population,
                                 :metropolitan_area,:city_system_dnp,:dnp_category,:ddt_typology,:department_id,
                                 :description,:avatar)
  end

end
