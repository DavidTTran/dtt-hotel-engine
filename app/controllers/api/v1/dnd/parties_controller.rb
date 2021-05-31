class Api::V1::Dnd::PartiesController < ApplicationController
  def index
    parties = Party.all
    render json: PartySerializer.new(parties)
  end

  def show
    party = Party.find(params[:id])
    render json: PartySerializer.new(party)

  rescue ActiveRecord::RecordNotFound => e
    render json: ErrorHelper.standard_error(e.message)
  end

  def create
    party = Party.new(party_params)
    if party.save
      render json: PartySerializer.new(party)
    else
      render json: ErrorHelper.standard_error(party.errors.messages)
    end
  end

  def update
    party = Party.find(params[:id])
    if party.update(party_params)
      render json: PartySerializer.new(party)
    else
      render json: ErrorHelper.standard_error(party.errors.messages)
    end
  end

  def destroy
    party = Party.find(params[:id]).destroy
    render json: PartySerializer.new(party)

  rescue ActiveRecord::RecordNotFound => e
    render json: ErrorHelper.standard_error(e.message)
  end

  private

  def party_params
    params.permit(:name, :id)
  end
end
