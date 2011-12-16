class TasksController < ApplicationController
  before_filter :login_required

  def index
    @tasks = Task.not_archived
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
    @task.priority = "Normal"
    @users_in_calendar = User.in_calendar
  end
  
  def archive
    @task = Task.find(params[:id])
    @task.archived = true
    if @task.save
      respond_to do |format|
        format.html {redirect_to tasks_url, :notice => t(:successfully_archived_task)}
        format.js
      end
    else
      respond_to do |format|
        format.html {render :action => 'index'}
        format.js
      end
    end
  end
  
  def archived
    @tasks = Task.archived
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
    @task.due = I18n.l @task.due
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
