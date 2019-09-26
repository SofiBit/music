class AssessmentsController < ApplicationController
  def index
    track = Track.find(params[:track_id])
    average = track.average_assessment
    respond_to do |format|
      format.json { render json: {average_assessment: average} }
    end
  end

  def create
    user = User.find(params[:user_id])
    track = Track.find(params[:track_id])
    stars = params[:stars]
    if assessment = Assessment.find_by(user: user, track: track)
      assessment.destroy
    end
    Assessment.create(user: user, track: track, stars: stars)
    respond_to do |format|
      format.json { render json: {status: 'success', message: "My assessment is #{stars}"} }
    end
  end

  def show
    user = User.find(params[:user_id])
    track = Track.find(params[:track_id])

    if assessment = track.assessments.find_by(user: user)
      respond_to { |format| format.json { render json: {status: 'success', stars: assessment.stars} } }
    else
      respond_to { |format| format.json { render json: {status: 'not found'} } }
    end
  end

  def destroy
  end
end
