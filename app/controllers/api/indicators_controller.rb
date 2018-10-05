class Api::IndicatorsController < ApplicationController
  def getIndicators
    @indicators= Indicator.where(target_id: params[:target_id], delete_at: [nil])
    render json: @indicators, status: :ok
  end
end
