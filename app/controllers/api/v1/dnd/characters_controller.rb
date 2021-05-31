class Api::V1::Dnd::CharactersController < ApplicationController
  def index
    render json: Character.all
  end

  def create
    char = Character.new(character_params)
    if char.save
      redirect_to "/api/v1/dnd/characters"
    else
      render json: ErrorHelper.standard_error(char.errors.messages)
    end

  end

  def update
    char = Character.find(params[:id])
    if char.update(character_params)
      render json: char
    else
      render json: ErrorHelper.standard_error(char.errors.messages)
    end
  end

  def destroy
    render json: Character.find(params[:id]).destroy
  end

  private

  def character_params
    params.permit(:name, :level, :character_class, :party_id)
  end
end
