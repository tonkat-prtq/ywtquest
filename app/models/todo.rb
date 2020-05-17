class Todo < ApplicationRecord
  belongs_to :log
  validates :title, presence: true, length: {maximum: 255}
end
