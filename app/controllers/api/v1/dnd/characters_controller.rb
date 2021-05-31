class Api::V1::Dnd::CharactersController < ApplicationController
  def index
    render json: Character.all
  end

  def create
    char = Character.new(character_params)
    if char.save
      render json: char.save
    else
      render json: { status: "error", code: 400, messages: char.errors.messages }
    end

  end

  def update
    char = Character.find(params[:id]).assign_attributes(character_params)
    if char.save
      render json: char.save
    else
      render json: { status: "error", code: 400, messages: char.errors.messages }
    end
  end

  def delete
    render json: Character.find(params[:id]).destroy
  end

  private

  def character_params
    params.permit(:name, :level, :class, :party_id)
  end
end
