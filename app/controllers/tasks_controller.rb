class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new
    @task.save
    redirect_to root_url
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_url
  end
end
