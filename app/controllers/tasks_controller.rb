class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :set_project, only: %i[index new create edit update destroy]

  # GET /tasks or /tasks.json
  def index
    p "================="
    p params

    if @project
      @to_do_tasks = @project.tasks.where(status: 'new').where("title like '%#{params[:query]}%'")
      @in_progress_tasks = @project.tasks.where(status: 'in_progress')
      @resolved_tasks = @project.tasks.where(status: 'resolved')
      @closed_tasks = @project.tasks.where(status: 'closed')
    else
      @to_do_tasks = []
      @in_progress_tasks = []
      @resolved_tasks = []
      @closed_tasks = []
    end
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  def set_project
    if params[:project_id].present?
      @project = Project.find(params[:project_id])
    elsif params[:task] && params[:task][:project_id].present?
      @project = Project.find(params[:task][:project_id])
    elsif @task.present?
      @project = @task.project
    else
      redirect_to projects_path, alert: 'Project ID is missing.'
    end
  end

  # GET /tasks/new
  def new
    @task = @project.tasks.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = @project.tasks.new(task_params)
    if @task.save
      ActionCable.server.broadcast "task_board_#{@project.id}", {
        action: 'create',
        task: render_to_string(partial: 'tasks/task', locals: { task: @task })
      }
      redirect_to dashboard_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    if @task.update(task_params)
      ActionCable.server.broadcast "task_board_#{@project.id}", {
        action: 'update',
        task: render_to_string(partial: 'tasks/task', locals: { task: @task })
      }
      redirect_to project_task_path(@project, @task), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    ActionCable.server.broadcast "task_board_#{@project.id}", {
      action: 'destroy',
      task_id: @task.id
    }
    redirect_to project_tasks_path(@project), notice: 'Task was successfully destroyed.'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:project_id, :category, :title, :description, :status, :attachment, :user_id)
  end
end
