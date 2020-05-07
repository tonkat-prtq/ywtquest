class Log < ApplicationRecord
  has_many :dones, inverse_of: :log, dependent: :destroy # inverse_ofで親と子が同時に作成された時外部キーが無い事によるid違反を解消してくれる
  has_many :knowledges, inverse_of: :log, dependent: :destroy # +子から親を辿れるようになる
  has_many :todos, inverse_of: :log, dependent: :destroy # +発行されるSQLが少なくなる
  accepts_nested_attributes_for :dones # 親のレコードを更新時に子のレコードも保存される
end
