class Dialogue < ApplicationRecord
  validates :line, presence: true, length: { minimum: 6 }
  validates :movie, presence: true, length: { minimum: 3 }
end
