class Invite < ApplicationRecord
  has_secure_token
  validates :name, :email, presence: true
end
