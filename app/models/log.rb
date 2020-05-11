class Log < ApplicationRecord
  belongs_to :user
  # inverse_ofで親と子が同時に作成された時外部キーが無い事によるid違反を解消してくれる
  # + 子から親を辿れるようになる
  # + 発行されるSQLが少なくなる
  has_many :dones, inverse_of: :log, dependent: :destroy
  has_many :knowledges, inverse_of: :log, dependent: :destroy
  has_many :todos, inverse_of: :log, dependent: :destroy
  
  has_many :categorized_logs, dependent: :destroy
  has_many :category, through: :categorized_logs
  # logが消えるとそのlog_idを持つcategorized_logsのレコードも消える
  # through: :categorized_logsで、@log.categoriesのような文が使えるようになる
  accepts_nested_attributes_for :dones, :knowledges, :todos, reject_if: :all_blank, allow_destroy: true # 親のレコードを更新時に子のレコードも保存される
end
