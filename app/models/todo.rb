class Todo < ApplicationRecord
  belongs_to :log
  validates :title, presence: true, length: {maximum: 255}

  scope :default_order, -> { order(created_at: :desc) } # 作成日を降順に並べるscopeの名前を変更し分かりやすく
end
