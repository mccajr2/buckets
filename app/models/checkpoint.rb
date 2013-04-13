# == Schema Information
#
# Table name: checkpoints
#
#  id          :integer          not null, primary key
#  description :string(255)
#  bucket_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Checkpoint < ActiveRecord::Base
  attr_accessible :description
  validates :bucket_id, presence: true
  validates :description, presence: true, length: { maximum: 140 }
  belongs_to :bucket
end
