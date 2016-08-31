class Website < ApplicationRecord
  has_many :user
  has_many :alexaranks
  validates :url, presence: true
end
