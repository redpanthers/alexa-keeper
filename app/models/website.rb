class Website < ApplicationRecord
  belongs_to :user
  has_many :alexaranks, dependent: :destroy
  validates :url, presence: true
  validates :user_id, presence: true
  validates_uniqueness_of :url, :scope => :user_id
end
