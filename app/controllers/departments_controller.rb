class DepartmentsController < ApplicationController

  def index
    ##trae todoss los departamentos
    @departments= Department.all
  end

  def new
    ##crea la instancia del departamento
    @department=Department.new
  end

  def edit
    @department=Department.find(params[:id])
  end

  def create
    @department=Department.new(department_params)
    if @department.save
      redirect_to departments_url
    else
      render :new
    end

  end

  def show
    @department= Department.find(params[:id])
  end

  ##metodos privados
  private

  ##nombre del modelo _params
  def department_params
    ##parametros permitidos
    params.require(:department).permit(:name)
  end

end
