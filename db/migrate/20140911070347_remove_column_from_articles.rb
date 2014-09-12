class RemoveColumnFromArticles < ActiveRecord::Migration
  def up
  	remove_column :articles, :lable
  end

  def down
  	add_column :articles, :tag, :integer
  end
end
