class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :photo
      t.string :description
      t.datetime :when_went
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
