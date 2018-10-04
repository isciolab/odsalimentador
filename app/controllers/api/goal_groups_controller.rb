class Api::GoalGroupsController < ApplicationController
  def getGoalGroups
    @goal_groups= GoalGroup.where(delete_at: [nil])
    render json: @goal_groups, status: :ok
  end
end
