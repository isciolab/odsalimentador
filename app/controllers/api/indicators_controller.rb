class Api::IndicatorsController < ApplicationController
  def getIndicators
    @indicators= Indicator.where(delete_at: [nil])
    render json: @indicators, status: :ok
  end
end
