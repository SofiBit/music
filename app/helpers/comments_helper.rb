# frozen_string_literal: true

module CommentsHelper
  def model(type)
    [Comment, Playlist, Track].select do |model|
      model.to_s == type
    end.first
  end

  def can_delete_comment?(user, comment)
    return user == comment.user if comment.object.is_a?(Track)
    
    user == comment.user || user == comment.object.user
  end

  def handling_exception
    @comment.destroy
  rescue ActiveRecord::RecordNotFound
    @comment_id = @comment.id
  end
end
