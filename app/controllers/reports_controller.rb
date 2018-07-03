class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  before_action :find_raportable 

  def new 
    @report_types = ReportType.all
    @report = Report.new
  end

  def create
    @report = @reportable.reports.new report_params
    @report.user_id = current_user.id
    respond_to do |format|
      if @report.save
        format.html { redirect_to root_path, notice: 'Your report was successfully posted!' }
        format.json { render :show, status: :created, location: @designer }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end
  private

  def find_raportable
      @reportable = Shot.find_by_id(params[:shot_id]) if params[:shot_id]
      @reportable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @shot = Shot.find_by_id(params[:shot_id]) if params[:shot_id]
  end

  def report_params
    params.require(:report).permit(:body, :report_type_id)
  end

end
