class CommentsController < ApplicationController
  include CommentsHelper

  before_action :find_comment, only: %i[edit update destroy]

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
    respond_to { |format| format.js }
  end

  def create
    @comment = Comment.new(comment_params)
    @object = @comment.object
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

  def destroy
    @comment.destroy if @comment
    respond_to { |format| format.js }
  end

  def edit
    @object = @comment.object
    respond_to { |format| format.js {render 'edit'} }
  end

  def update
    @comment.update(comment_params)
    @comment.save
    respond_to { |format| format.js {render 'update'} }
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
    @comment_id = @comment.id
  rescue
    @comment_id = params[:id]
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :object_type, :object_id)
  end
end
