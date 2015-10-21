class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find_by(params[:id])
  end

  def create
  end

  def edit
end
