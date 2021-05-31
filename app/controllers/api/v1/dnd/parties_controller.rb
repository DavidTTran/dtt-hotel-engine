class Api::V1::Dnd::PartiesController < ApplicationController
  def index
    render json: Party.all
  end

  def create
    party = Party.new(party_params)
    if party.save
      redirect_to :api_v1_dnd_parties_route
    else
      render json: { status: "error", code: 400, message: party.errors.messages }
    end
  end

  def update
    params = party_params
    render json: Party.find(params[:id]).update(params)
  end

  def destroy
    render json: Party.find(params[:id]).destroy
  end

  private

  def party_params
    params.permit(:name, :id)
  end
end
