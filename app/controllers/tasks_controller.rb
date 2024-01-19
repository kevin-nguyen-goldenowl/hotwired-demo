class TasksController < ApplicationController
  before_action :prepare_task, only: %i[ show edit update destroy ]

  def index
    @tasks = Task.all.order(created_at: :desc)
    @task = Task.new
  end

  def edit; end

  def create
    @task = Task.new(task_params)
    @task.save

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.prepend('tasks', partial: 'tasks/task', locals: { task: @task })
      end
    end
  end

  def update
    @task.update(task_params)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update(@task)
      end
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove(@task)
      end
    end
  end

  private

  def prepare_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:task_name, :completed)
  end
end
