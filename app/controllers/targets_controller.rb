class TargetsController < ApplicationController
  before_action :authenticate_user!

  def index
    ##trae todas las measures
    @targets = Target.where(delete_at: [nil])
  end

  def new
    ##crea la instancia de la unidad de measure
    @target = Target.new
  end

  def edit
    @target = Target.find(params[:id])
  end

  def create
    @target = Target.new(target_params)
    respond_to do |format|
      if @target.save
        format.html {redirect_to targets_url, notice: 'Datos guardados con éxito'}
      else
        format.html { render "targets/create" }
        format.js # call create.js.erb on save errors
      end
    end
  end

  def update
    @target = Target.find(params[:id])
    respond_to do |format|
      if @target.update_attributes(target_params)
        format.html { redirect_to targets_path, notice: 'Meta actualizada con éxito' }
      else
        format.html { render "targets/create" }
        format.js # call create.js.erb on save errors
      end
    end

  end


  def show
    @target = Target.find(params[:id])
  end

  def deletetarget
    ##abre el modal para borrarlo
    @target = Target.find(params[:id])
  end

  def destroy
    @target = Target.find(params[:id])
    if @target.update_attributes(delete_at: DateTime.now.to_datetime)
      redirect_to targets_url
    else
      render :edit
    end
  end

  ##metodo que retorna las metas o targets filtradas por un ODS o Goal
  def filter_targets_by_goals
    @filtered_units = Target.where(goal_id: params[:selected_goal])
    @selectargetid = params[:selectargetid] ##para decirle a cual select de target va a actualizar
    @target_selected = ""

    ##target_selected es por si quieres marcar como selected una opcion en el select
    if params[:target_selected] != ""
      @target_selected = params[:target_selected]
    end
  end

  ##retorna la tabla de todas las metas
  def tbltargets
    @targets = Target.where(delete_at: [nil]).order(:goal_id)
    if params[:goal] != ""
      @targets = @targets.where(goal_id: params[:goal])
    end

    render :partial => 'tbltarget'
  end
  def redirect(url, text)
    redirect_to url, notice: text
  end

  ##esto se usa para importar las metas via csv
  def import
    if params[:file]
      Target.import(params[:file])
      redirect_to configs_path, :flash => {:notice => "Datos guardados éxito!"}
    else
      redirect_to configs_path, :flash => {:error => "Por favor seleccionar un archivo CSV"}
    end
  end

  ##metodos privados

  private

  ##nombre del modelo _params
  def target_params
    ##parametros permitidos
    params.require(:target).permit(:name, :available, :goal_id, :number, :description)

  end

  def validate_user
    redirect_to new_user_session_path, notice: "Necesitas iniciar sesion"
  end

end
