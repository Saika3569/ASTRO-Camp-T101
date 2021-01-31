class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :content
      t.belongs_to :user, null: false, foreign_key: true 
      t.string :tag
      t.string :priority
      t.string :aasm_state

      t.timestamps
    end
  end
end
