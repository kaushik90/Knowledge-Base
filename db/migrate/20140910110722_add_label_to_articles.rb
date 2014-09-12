class AddLabelToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :lable, :integer
  end
end
