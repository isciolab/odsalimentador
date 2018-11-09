class GoalGroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    ##trae todoss los Grupos ODS
    @goalgroups = GoalGroup.all
  end

  def new
    ##crea la instancia del Grupo ODS
    @goalgroup = GoalGroup.new
  end

  def edit
    @goalgroup = GoalGroup.find(params[:id])
  end

  def create
    @goalgroup = GoalGroup.new(goalgroup_params)
    respond_to do |format|
      if @goalgroup.save
        format.html {redirect_to goal_groups_url, notice: 'Datos guardados con éxito'}
      else
        format.html {render "goal_groups/create"}
        format.js # call create.js.erb on save errors
      end
    end
  end

  def update
    @goalgroup = GoalGroup.find(params[:id])
    respond_to do |format|
      if @goalgroup.update_attributes(goalgroup_params)
        format.html {redirect_to goal_groups_url, notice: 'Datos guardados con éxito'}
      else
        format.html {render "goal_groups/create"}
        format.js # call create.js.erb on save errors
      end
    end
  end

  def show
    @goalgroup = GoalGroup.find(params[:id])
  end

  def deletegoalgroup
    ##abre el modal para borrarlo
    @goalgroup = GoalGroup.find(params[:id])
  end

  def destroy
    @goalgroup = GoalGroup.find(params[:id])
    if @goalgroup.delete
      redirect_to goal_groups_url
    else
      render :edit
    end
  end

  ##metodos privados

  private

  ##nombre del modelo _params
  def goalgroup_params
    ##parametros permitidos
    params.require(:goal_group).permit(:name)
  end

end
