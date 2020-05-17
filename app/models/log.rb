class Log < ApplicationRecord
  belongs_to :user
  acts_as_taggable
  has_many :dones, inverse_of: :log, dependent: :destroy # inverse_ofで親と子が同時に作成された時外部キーが無い事によるid違反を解消してくれる
  has_many :knowledges, inverse_of: :log, dependent: :destroy # +子から親を辿れるようになる
  has_many :todos, inverse_of: :log, dependent: :destroy # +発行されるSQLが少なくなる
  accepts_nested_attributes_for :dones, :knowledges, :todos, reject_if: :all_blank, allow_destroy: true # 親のレコードを更新時に子のレコードも保存される

  validate :ended_on_after_started_on

  def ended_on_after_started_on
    errors.add(:ended_on, "は開始日と同じか、それ以降の日付を選択してください") if
    started_on > ended_on
  end
end
