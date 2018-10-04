class Api::CitiesController < ApplicationController
  def getCities
    @cities= City.where(delete_at: [nil])
    render json: @cities, status: :ok
  end

end
