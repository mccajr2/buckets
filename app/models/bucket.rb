class Bucket < ActiveRecord::Base
  attr_accessible :description
  belongs_to :user
  #has_many :checkpoints
  validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 140 }
  default_scope order: 'buckets.created_at DESC'
end
