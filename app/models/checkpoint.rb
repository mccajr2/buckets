class Checkpoint < ActiveRecord::Base
  attr_accessible :description
  validates :bucket_id, presence: true
  validates :description, presence: true, length: { maximum: 140 }
  belongs_to :bucket
end
