class ContestantOutingsController < ApplicationController 
  def destroy
    contestant_outings = ContestantOuting.find_by(contestant_id: params[:id], outing_id: params[:outing_id])

    contestant_outings.delete

    redirect_to "/outings/#{params[:outing_id]}"
  end
end