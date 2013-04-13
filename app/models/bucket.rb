# == Schema Information
#
# Table name: buckets
#
#  id          :integer          not null, primary key
#  description :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Bucket < ActiveRecord::Base
  attr_accessible :description
  belongs_to :user
  has_many :checkpoints, dependent: :destroy
  validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 140 }
  default_scope order: 'buckets.created_at DESC'
end
