class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
     @project = Project.new
  end

  def create
     @project = Project.new(params[:project])
    if @project.save
       redirect_to @project, :notice  => "Project has been created."
    else
       flash[:alert] = "Project can not be created."
      render :action => 'new'
    end
  end

  def show
     @project = Project.find(params[:id])
  end
end