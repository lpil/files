class ProjectsController < ApplicationController
  before_action :set_project, only: %i(show edit update destroy)

  def index
    @projects = current_user.projects
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
