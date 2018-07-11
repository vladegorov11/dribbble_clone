class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  before_action :find_raportable 

  def new 
    @report_types = ReportType.all
    @reportable.push @reportable.last.reports.build
  end

  def create
    @report = @reportable.last.reports.build(report_params)
    @report.user_id = current_user.id
    respond_to do |format|
      if @report.save
        format.html { redirect_to root_path, notice: 'Your report was successfully posted!' }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end
  private

  def find_raportable
    @reportable = []
    params.each do |name, value|
        if name =~ /(.+)_id$/
          @reportable.push  $1.classify.constantize.find(value)
        end
    end
    @reportable
  end

  def report_params
    params.require(:report).permit(:body, :report_type_id)
  end


end
