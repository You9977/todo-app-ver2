class TasksController < ApplicationController  
  helper_method :sort_column, :sort_direction
  before_action :user_logged_in?

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

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "タスクを編集しました。"
      redirect_to tasks_url(current_user)
    else
      render 'edit'
    end
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "#{@task.title}を登録しました！"
      redirect_to tasks_url(current_user)
    else
      render 'tasks/new'
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "#{@task.title}を削除しました！"
    redirect_to tasks_url(current_user)
  end

  def destroy_all
    @tasks = Task.all
    @tasks.each do |task|
      task.destroy
    end
    flash[:success] = "全て削除しました！"
    redirect_to tasks_url(current_user)
  end

  private

    def task_params
      params.require(:task).permit(:title, :category , :detail, :deadline, :user_id)
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
  
    def sort_column
      Task.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
