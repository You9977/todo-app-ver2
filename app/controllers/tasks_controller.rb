class TasksController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @tasks = Task.all.order(sort_column + ' ' + sort_direction)    
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
    @task = Task.create(task_params)
    if @task.save
      flash[:success] = "登録しました！"
      redirect_to root_url
    else
      render 'tasks/new'
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_url
  end

  def destroy_all
    @tasks = Task.all
    @tasks.each do |task|
      task.destroy
    end
    redirect_to root_url
  end

  private

    def task_params
      params.require(:task).permit(:title, :category , :detail, :deadline)
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
  
    def sort_column
      Task.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end
end
