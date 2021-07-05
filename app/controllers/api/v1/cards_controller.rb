class Api::V1::CardsController < ApplicationController
  def index
    render json: { cards: Cards::ListService.call }
  end

  def top
    render json: { cards: Cards::TopService.call(10, :week) }
  end
end
