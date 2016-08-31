class Website < ApplicationRecord
  has_many :user
  has_many :alexa_rank
  validates :url, presence: true
end
