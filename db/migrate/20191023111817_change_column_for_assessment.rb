class ChangeColumnForAssessment < ActiveRecord::Migration[5.2]
  def change
    remove_reference :assessments, :track, foreign_key: true
    add_reference :assessments, :track_playlist, polymorphic: true
  end
end
