class DepartmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    ##trae todoss los departamentos
    @departments = Department.where(delete_at: [nil])
  end

  def new
    ##crea la instancia del departamento
    @department = Department.new
  end

  def edit
    @department = Department.find(params[:id])
  end

  def create
    @department = Department.new(department_params)
    respond_to do |format|
      if @department.save
        format.html {redirect_to departments_url, notice: 'Datos guardados con éxito'}
      else
        format.html {render "departments/create"}
        format.js # call create.js.erb on save errors
      end
    end

  end

  def update
    @department = Department.find(params[:id])
    respond_to do |format|
      if @department.update_attributes(department_params)
        format.html {redirect_to departments_url, notice: 'Datos guardados con éxito'}
      else
        format.html {render "departments/create"}
        format.js # call create.js.erb on save errors
      end
    end
  end

  def show
    @department = Department.find(params[:id])
  end

  def deletedepartment
    ##abre el modal para borrarlo
    @department = Department.find(params[:id])
  end

  def destroy
    @department = Department.find(params[:id])
    if @department.update_attributes(delete_at: DateTime.now.to_datetime)
      redirect_to departments_url
    else
      render :edit
    end
  end


  ##metodos privados

  private

  def department_params
    ##parametros permitidos
    params.require(:department).permit(:name)
  end

end
