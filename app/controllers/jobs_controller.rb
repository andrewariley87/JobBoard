class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
  	@job = Job.new
  end

  def create
  	@job = Job.new(job_params)

  	if @job.save
      flash[:notice] = 'Post created successfully'
  		redirect_to jobs_path
  	else
  		flash[:notice] = "Post must have a title and description"
      render :new
  	end
  end

  private

  def job_params
  	params.require(:job).permit(:title, :description)
  end

end
