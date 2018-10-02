class MetricsController < ApplicationController

  def index
    @metrics = current_user.metrics.order("created_at desc").paginate(:page => params[:page], :per_page => 10)
  end

  def create
    @metric = Metric.add_glucose_metrics(metric_params,current_user.id)
    flash[:notice] = "Successfully created"
    flash[:notice] = @metric.errors.messages.values.flatten.first if @metric&.errors&.messages&.any?
    redirect_to metrics_path
  end

  def update
    get_metric.update_attributes metric_params
    redirect_to metrics_path
  end

  def destroy
    get_metric.destroy
    redirect_to metrics_path
  end

  private

  def get_metric
    Metric.where(id: params["id"]).first
  end

  def metric_params
    params.require("metric").permit([:glucose_unit])
  end

end
