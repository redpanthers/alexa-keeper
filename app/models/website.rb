class Website < ApplicationRecord
  has_many :user
  validates :url, presence: true
end
