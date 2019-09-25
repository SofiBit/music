class CreateAssessments < ActiveRecord::Migration[5.2]
  def change
    create_table :assessments do |t|
      t.references :user, foreign_key: true;
      t.references :track, foreign_key: true;
      t.integer :stars, default: 0;

      t.timestamps
    end
  end
end
