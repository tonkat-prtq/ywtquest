class Done < ApplicationRecord
  belongs_to :log
  validates :title, presence: true, length: {maximum: 255}
  validates :comment, length: {maximum: 5000}
  validates :worktime, length: {maximum: 5}
  validates :worktime, numericality: { greater_than_or_equal_to: 0}
end
