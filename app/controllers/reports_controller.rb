class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  before_action :find_raportable 

  def new 
    @report = Report.new
  end

  def create
    @report = @reportable.reports.new report_params
    @report.user_id = current_user.id
      if @report.save
        redirect_to root_path, notice: 'Your report was successfully posted!'
      else
        redirect_to root_path, notice: "Your report wasn't posted!"
      end
  end


  private

  def find_raportable
      @reportable = Shot.find_by_id(params[:shot_id]) if params[:shot_id]
      @reportable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @shot = Shot.find_by_id(params[:shot_id]) if params[:shot_id]
  end

  def report_params
    params.require(:report).permit(:body)
  end
end
