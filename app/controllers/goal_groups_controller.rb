class GoalGroupsController < ApplicationController

  def index
    ##trae todoss los Grupos ODS
    @goalgroups= GoalGroup.all
  end

  def new
    ##crea la instancia del Grupo ODS
    @goalgroup=GoalGroup.where(delete_at:[nil])
  end

  def edit
    @goalgroup=GoalGroup.find(params[:id])
  end

  def create
    @goalgroup=GoalGroup.new(goalgroup_params)
    if @goalgroup.save
      redirect_to goal_groups_url
    else
      render :new
    end
  end

  def update
    @goalgroup = GoalGroup.find(params[:id])
    if @goalgroup.update_attributes(goalgroup_params)
      redirect_to goal_groups_url
    else
      render 'edit'
    end
  end

  def show
    @goalgroup= GoalGroup.find(params[:id])
  end

  def deletegoalgroup
    ##abre el modal para borrarlo
    @goalgroup=GoalGroup.find(params[:id])
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
