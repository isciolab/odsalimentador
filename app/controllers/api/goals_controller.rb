class Api::GoalsController < ApplicationController
  def getGoals
    @goals= Goal.where(delete_at: [nil])
    render json: @goals, status: :ok
  end

end