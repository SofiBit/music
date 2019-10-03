class CommentsController < ApplicationController
  def index
    @comments = Comment.where(object: params[:object])
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      respond_to do |format|
        format.js
        format.json { render 'create' }
      end
    else
      respond_to do |format|
        format.json { render json: { message: @comment.errors.messages } }
      end
    end
  end

  def edit

  end

  def update

  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :object_type, :object_id)
  end
end
