class GoalsController < ApplicationController

  def index
    ##trae todos los resultados
    @goals= Goal.all
  end

  def new
    ##crea la instancia para la vista
    @goal=Goal.new
  end

  def create
    @goal=Goal.new(goal_params)
    if @goal.save
      redirect_to goals_url
    else
      render :new
    end
  end

  def show
    @goal= Goal.find(params[:id])
  end

  ##metodos privados
  private

  def goal_params
    ##parametros permitidos
    params.require(:goal).permit(:name)
  end

end
