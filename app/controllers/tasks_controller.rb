class TasksController < ApplicationController
  before_filter :login_required

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
    @users_in_calendar = User.in_calendar
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to tasks_url, :notice => t(:successfully_created_task)
    else
      render :action => 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to tasks_url, :notice  => t(:successfully_updated_task)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, :notice => t(:successfully_destroyed_task) }
      format.js
    end
  end
end
