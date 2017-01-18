class Token < ApplicationRecord
    validates :token, presence: true

end
