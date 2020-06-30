class Knowledge < ApplicationRecord
  belongs_to :log
  validates :title, presence: true, length: {maximum: 255}
  validates :comment, length: {maximum: 5000}

  scope :default_order, -> { order(created_at: :desc) } # 作成日を降順に並べるscopeの名前を変更し分かりやすく
end
