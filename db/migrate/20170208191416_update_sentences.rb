class UpdateSentences < ActiveRecord::Migration[5.0]
  def change
    rename_column :sentences, :stories_id, :story_id
    rename_column :sentences, :users_id, :user_id
  end
end
