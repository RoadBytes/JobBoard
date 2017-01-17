# handles main job search feature
class JobSearchesController < ApplicationController
  def new
    render :index
  end

  def index
    keywords = job_search_params[:keywords]
    @jobs = IndeedAPI.search_jobs(q: keywords)
    flash[:notice] = "Results for '#{keywords}'"
  end

  private

  def job_search_params
    params.require(:job_search).permit(:keywords)
  end
end
