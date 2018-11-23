class ConfigsController < ApplicationController
  before_action :authenticate_user!
  def index

  end

  def importheme

    if params[:file]
      Theme.import(params[:file])
      redirect_to configs_path, :flash => {:notice => "Datos guardados éxito!"}
    else
      redirect_to configs_path, :flash => {:error => "Por favor seleccionar un archivo CSV"}
    end
  end

  def importpersons_has_questions
    if params[:file]
      PersonHasQuestion.importar(params[:file])
      redirect_to configs_path, :flash => {:notice => "Datos guardados éxito!"}
    else
      redirect_to configs_path, :flash => {:error => "Por favor seleccionar un archivo CSV"}
    end
  end

  def dictionary_objetive
    if params[:file]
      DictionaryObjetive.importar(params[:file])
      redirect_to configs_path, :flash => {:notice => "Datos guardados éxito!"}
    else
      redirect_to configs_path, :flash => {:error => "Por favor seleccionar un archivo CSV"}
    end
  end

  def objetive_data
    if params[:file]
      DataObjetive.importar(params[:file])
      redirect_to configs_path, :flash => {:notice => "Datos guardados éxito!"}
    else
      redirect_to configs_path, :flash => {:error => "Por favor seleccionar un archivo CSV"}
    end
  end

end
