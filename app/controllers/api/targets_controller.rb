class Api::TargetsController < ApplicationController
  def getTargets
    @targets= Target.select('*').joins(:goal)
    render json: @targets, status: :ok
  end
end
