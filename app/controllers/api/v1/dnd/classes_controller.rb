class Api::V1::Dnd::ClassesController < ApplicationController
  def index
    response = Rails.cache.fetch("dnd-classes") || DndService.new.classes
    render json: response
  end
end
