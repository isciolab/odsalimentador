class Api::GroupCitiesController < ApplicationController

  def getGrupos
    @grupos= GroupCity.where(delete_at: [nil])
    render json: @grupos, status: :ok
  end

end
