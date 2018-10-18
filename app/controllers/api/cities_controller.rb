class Api::CitiesController < ApplicationController
  def getCities
    @cities= City.where(delete_at: [nil]).to_json(include: :department)
    render json: @cities, status: :ok
  end

end
