class TargetsController < ApplicationController

  def index
    ##trae todas las measures
    @targets= Target.where(delete_at:[nil])
  end

  def new
    ##crea la instancia de la unidad de measure
    @target=Target.new
  end

  def edit
    @target=Target.find(params[:id])
  end

  def create
    @target=Target.new(target_params)
    if @target.save
      redirect_to targets_url
    else
      render :new
    end
  end

  def update
    @target = Target.find(params[:id])
    if @target.update_attributes(target_params)
      redirect_to targets_url
    else
      render 'edit'
    end
  end


  def show
    @target= Target.find(params[:id])
  end

  def deletetarget
    ##abre el modal para borrarlo
    @target=Target.find(params[:id])
  end

  def destroy
    @target = Target.find(params[:id])
    if @target.update_attributes(delete_at:DateTime.now.to_datetime)
      redirect_to targets_url
    else
      render :edit
    end
  end

  ##metodos privados
  private

  ##nombre del modelo _params
  def target_params
    ##parametros permitidos
    params.require(:target).permit(:name,:available,:goal_id,:number)

  end

  def validate_user
    redirect_to new_user_session_path, notice: "Necesitas iniciar sesion"
  end

end
