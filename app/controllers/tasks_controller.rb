class TasksController < ApplicationController
  def index
    @tasks = Task.where({ "user_id" => session["user_id"] })
  end

  def create
    if session["user_id"].present?
      @task = Task.new
      @task["description"] = params["description"]
      @task["user_id"] = session["user_id"]
      @task.save
    end
    redirect_to "/tasks"
  end

  def destroy
    if session["user_id"].present?
      @task = Task.find_by({ "id" => params["id"], "user_id" => session["user_id"] })
      @task.destroy
    end
    redirect_to "/tasks"
  end
end
