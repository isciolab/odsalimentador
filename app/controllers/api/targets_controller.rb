class Api::TargetsController < ApplicationController
  def getTargets
    @targets= Target.where(goal_id: params[:goal_id], delete_at: [nil])
    render json: @targets, status: :ok
  end
end
