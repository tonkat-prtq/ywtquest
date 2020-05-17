class Todo < ApplicationRecord
  belongs_to :log
  validates :title, length: {maximum: 255}
end
