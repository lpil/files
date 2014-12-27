class ProjectsController < ApplicationController
  before_action :set_project, only: %i(show edit update destroy)

  def index
    if user_signed_in?
      @projects = current_user.projects
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    @project.owner = current_user
    @project.users << current_user
    if @project.save
      flash.notice = "Created project #{@project.name}"
      redirect_to project_path(@project)
    else
      flash.alert = 'Could not create project'
    end
  end

  def update
    if @project.update_attributes project_params
      redirect_to project_path(@project),
                  notice: "Project #{@project.name} successfully updated"
    else
      render action: :edit
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
