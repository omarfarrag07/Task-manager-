class TaskBoardChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "task_board_#{params[:project_id]}"
  
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
