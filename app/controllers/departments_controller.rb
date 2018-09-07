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

  def update
    @department = Department.find(params[:id])
    if @department.update_attributes(department_params)
      redirect_to departments_url
    else
      render 'edit'
    end
  end

  def show
    @department= Department.find(params[:id])
  end

  ##metodos privados
  private

  def department_params
    ##parametros permitidos
    params.require(:department).permit(:name)
  end

end
