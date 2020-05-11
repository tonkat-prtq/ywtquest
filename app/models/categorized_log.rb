class CategorizedLog < ApplicationRecord
  # categoryとlogの中間テーブル。categoryとlogの多対多を実現
  belongs_to :category
  belongs_to :log
end
