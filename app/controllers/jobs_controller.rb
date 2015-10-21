class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find_by(params[:id])
  end

  def new
  	@job = Job.new
  end

  def create
  	@job = Job.new(job_params)
  end

  private

  def job_params
  	params.require(:job).permit(:title, :description)
  end

end
