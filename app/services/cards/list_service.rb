class Cards::ListService < ApplicationService
  def call
    Card.all
  end
end