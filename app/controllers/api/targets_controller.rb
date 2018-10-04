class Api::TargetsController < ApplicationController
  def getTargets
    @targets= Target.where(delete_at: [nil])
    render json: @targets, status: :ok
  end
end
