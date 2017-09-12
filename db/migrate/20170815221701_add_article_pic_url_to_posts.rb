class AddArticlepic < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :article_pic, :string
  end
end
