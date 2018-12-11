class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence:true, length:{maximum: 255}
  
  has_many :reverses_of_like_relationship, class_name: 'LikesRelationship', foreign_key: 'like_id'
  has_many :liked_users, through: :reverses_of_like_relationship,  source: :user
end
