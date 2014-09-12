# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag        :string(255)
#

class Article < ActiveRecord::Base
  attr_accessible :content, :title, :tag

  belongs_to :user

  validates :user_id,	presence: true 
  validates :content,	presence: true
  validates :title, 	presence: true
  validates :tag, 		presence: true 
end
