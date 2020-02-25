class CreateArticleLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :article_likes do |t|

      t.references :users, foreign_key: true
      t.references :articles, foreign_key: true

    end
  end
end
