class Knowledge < ApplicationRecord
  belongs_to :log
  validates :title, presence: true, length: {maximum: 255}
  validates :comment, length: {maximum: 5000}
end
