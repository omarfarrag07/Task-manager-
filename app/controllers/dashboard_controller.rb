class DashboardController < ApplicationController
  def index
    @projects = Project.all  # If you need to list all projects

    # If a specific project is needed for the view, set it accordingly
    # For example, using a default or the first project
    @project = @projects.first if @projects.any?
    
    # If @tasks are needed for the view, set them as well
    @tasks = Task.all
  end
end
