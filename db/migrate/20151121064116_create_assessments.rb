class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.integer :user_id,                               index: true
      t.string :uid,                       null: false, index: true
      t.boolean :finished, default: false, null: false, index: true
      t.string :blend_name

      t.timestamps                         null: false
    end
  end
end
