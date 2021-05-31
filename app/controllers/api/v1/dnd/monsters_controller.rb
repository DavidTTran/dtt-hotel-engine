class Api::V1::Dnd::MonstersController < ApplicationController
  def index
    response = Rails.cache.fetch("dnd-monsters") || DndService.new.monsters
    render json: response
  end
end
