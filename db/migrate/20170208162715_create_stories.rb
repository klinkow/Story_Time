class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.column :image, :string
      t.timestamps
    end

    create_table :users do |t|
      t.string :name
      t.timestamps
    end

    create_table :sentences do |t|
      t.belongs_to :stories, index: true
      t.belongs_to :users, index: true
      t.string :text
      t.string :image
      t.timestamps
    end
  end
end
