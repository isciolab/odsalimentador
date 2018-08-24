class GoalGroupsController < ApplicationController

  def index
    ##trae todoss los Grupos ODS
    @goalgroups= GoalGroup.all
  end

  def new
    ##crea la instancia del Grupo ODS
    @goalgroup=GoalGroup.new
  end

  def edit
    @goalgroup=GoalGroup.find(params[:id])
  end

  def create
    @goalgroup=GoalGroup.new(goalgroup_params)
    if @goalgroup.save
      redirect_to goalgroups_url
    else
      render :new
    end

  end

  def show
    @goalgroup= GoalGroup.find(params[:id])
  end

  ##metodos privados
  private

  ##nombre del modelo _params
  def goalgroup_params
    ##parametros permitidos
    params.require(:goalgroup).permit(:name)
  end

end
