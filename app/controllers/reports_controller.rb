class ReportsController < ApplicationController

  before_action :get_report_date, only: [:daily_report, :month_to_date_report, :monthly_report]

  def daily_report
    @metrics = Metric.generate_report(@date.beginning_of_day,@date.end_of_day,current_user.id)
                   .paginate(:page => params[:page], :per_page => PER_PAGE)
    render partial: 'metric_data' if params["date"].present?
  end

  def month_to_date_report
    @metrics = Metric.generate_report(@date.beginning_of_month, @date.end_of_day,current_user.id)
                   .paginate(:page => params[:page], :per_page => PER_PAGE)
    respond_to do |format|
      format.html {render partial: 'metric_data' if params["date"].present?}
      format.js
    end
  end

  def monthly_report
    @metrics = Metric.generate_report(@date.beginning_of_month, @date.end_of_month,current_user.id)
                   .paginate(:page => params[:page], :per_page => PER_PAGE)
    respond_to do |format|
      format.html {render partial: 'metric_data' if params["date"].present?}
      format.js
    end
  end

  def get_report_date
    @date = params["date"].present? ? Date.parse(params["date"]) : Date.today
  end

end
