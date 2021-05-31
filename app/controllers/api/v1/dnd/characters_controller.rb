class Api::V1::Dnd::CharactersController < ApplicationController
  def index
    chars = Character.all
    render json: CharacterSerializer.new(chars)
  end

  def create
    char = Character.new(character_params)
    if char.save
      render json: CharacterSerializer.new(char)
    else
      render json: ErrorHelper.standard_error(char.errors.messages)
    end

  end

  def update
    char = Character.find(params[:id])
    if char.update(character_params)
      render json: CharacterSerializer.new(char)
    else
      render json: ErrorHelper.standard_error(char.errors.messages)
    end
  end

  def destroy
    char = Character.find(params[:id]).destroy
    render json: CharacterSerializer.new(char)
  end

  private

  def character_params
    params.permit(:name, :level, :character_class, :party_id)
  end
end
