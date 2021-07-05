class Api::V1::FeedbacksController < ApplicationController
  def chart
    render json: { chart: Feedbacks::ChartService.call(params[:id], :month) }
  end
end
