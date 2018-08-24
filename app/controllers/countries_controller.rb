class CountriesController < ApplicationController

  def index
    ##trae todoss los paises
    @countries= Country.all
  end

  def new
    ##crea la instancia del departamento
    @country=Country.new
  end

  def edit
    @country=Country.find(params[:id])
  end

  def create
    @country=Country.new(country_params)
    if @country.save
      redirect_to countries_url
    else
      render :new
    end

  end

  def show
    @country= Country.find(params[:id])
  end

  ##metodos privados
  private

  ##nombre del modelo _params
  def country_params
    ##parametros permitidos
    params.require(:country).permit(:name)
  end

end
