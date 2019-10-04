class CommentsController < ApplicationController
  include Comments

  def index
    @id = params[:object_id]
    type = params[:object_type]
    object = model(type).find(@id)
    @comments = Comment.where(object: object).reverse
    respond_to do |format|
      format.js
      format.json { render 'index' }
    end
  end

  def new
    id = params[:object_id]
    type = params[:object_type]
    @object = model(type).find(id)
    @comment = @object.comments.new(user: current_user)
  end

  def create
    @comment = Comment.new(comment_params)
    @tag_id = params[:tag_id]
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

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :object_type, :object_id)
  end
end
