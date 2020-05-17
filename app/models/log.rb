class Log < ApplicationRecord
  belongs_to :user
  acts_as_taggable
  has_many :dones, inverse_of: :log, dependent: :destroy # inverse_ofで親と子が同時に作成された時外部キーが無い事によるid違反を解消してくれる
  has_many :knowledges, inverse_of: :log, dependent: :destroy # +子から親を辿れるようになる
  has_many :todos, inverse_of: :log, dependent: :destroy # +発行されるSQLが少なくなる
  accepts_nested_attributes_for :dones, :knowledges, :todos, reject_if: :all_blank, allow_destroy: true # 親のレコードを更新時に子のレコードも保存される

  validate :ended_on_after_started_on
  validate :when_to_do_after_ended_on

  def ended_on_after_started_on
    errors.add(:ended_on, "は開始日と同じか、それ以降の日付を選択してください") if
    started_on > ended_on
  end

  def when_to_do_after_ended_on
    self.todos.each do |t|
      # t.when_to_doだとカラム名じゃなくカラムに格納されている日付が出てしまう
      # human_attribute_nameを使えばここにカラム名を入れることが出来る
      # t("activerecord.attributes.todo.when_to_do")じゃ駄目だった
      errors.add(Todo.human_attribute_name(:when_to_do), "は終了日以降の日付を選択してください") if
      ended_on > t.when_to_do
    end
  end


end
