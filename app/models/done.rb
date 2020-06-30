class Done < ApplicationRecord
  belongs_to :log
  validates :title, presence: true, length: {maximum: 255}
  validates :comment, length: {maximum: 5000}
  validates :worktime, length: {maximum: 5}
  validates :worktime, numericality: { greater_than_or_equal_to: 0} # greater_than_or_equal_toで、設定した値と同じかそれ以上のバリデーションをかけられる

  scope :default_order, -> { order(created_at: :desc) } # 作成日を降順に並べるscopeの名前を変更し分かりやすく
end
