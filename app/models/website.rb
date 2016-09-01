class Website < ApplicationRecord
  has_many :users
  has_many :alexaranks
  validates :url, presence: true
  validates :user_id, presence: true
end
