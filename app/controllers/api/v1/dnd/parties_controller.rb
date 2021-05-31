class Api::V1::Dnd::PartiesController < ApplicationController
  def index
    render json: Party.all
  end

  def create
    party = Party.new(party_params)
    if party.save
      redirect_to "/api/v1/dnd/parties"
    else
      render json: ErrorHelper.standard_error(party.errors.messages)
    end
  end

  def update
    party = Party.find(params[:id])
    if party.update(party_params)
      render json: party
    else
      render json: ErrorHelper.standard_error(party.errors.messages)
    end
  end

  def destroy
    render json: Party.find(params[:id]).destroy
  end

  private

  def party_params
    params.permit(:name, :id)
  end
end
