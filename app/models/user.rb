class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable
  has_many :collections
  has_many :websites, through: :collections
  validates :token, :name, presence: true
  validates_uniqueness_of :token
end
