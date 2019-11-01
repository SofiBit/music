class AssessmentsController < ApplicationController
  include AssessmentModel

  def index
    track = Track.find(params[:track_id])
    average = track.average_assessment
    respond_to do |format|
      format.json { render json: {average_assessment: average} }
    end
  end

  def create
    user = User.find(params[:user_id])
    track_or_playlist = model(params[:object_type]).find(params[:object_id])
    stars = params[:stars]
    if assessment = Assessment.find_by(user: user, track_playlist: track_or_playlist)
      assessment.destroy
    end
    Assessment.create(user: user, track_playlist: track_or_playlist, stars: stars)
    respond_to do |format|
      format.json { render json: {status: 'success', message: "My assessment is #{stars}"} }
    end
  end

  def show
    user = User.find(params[:user_id])
    object = model(params[:object_type]).find(params[:object_id])

    if assessment = Assessment.find_by(track_playlist: object, user: user)
      respond_to { |format| format.json { render json: {status: 'success', stars: assessment.stars} } }
    else
      respond_to { |format| format.json { render json: {status: 'not found'} } }
    end
  end
end
