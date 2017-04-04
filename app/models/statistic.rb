class Statistic < ApplicationRecord
  # Receives a hash of attributes to update
  def self.update_statistics(attributes)
    first_or_create.update(attributes)
  end
end
