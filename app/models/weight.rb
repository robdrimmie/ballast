class Weight < ActiveRecord::Base
  attr_accessible :weight

  belongs_to :user

  validates :weight, :presence => true 
  validates_numericality_of :weight, :greater_than => 0


  default_scope :order => 'weights.created_at DESC'
end
