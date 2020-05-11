class Category < ApplicationRecord
  belongs_to :user # userとcategoryは一対多
  has_many :categorized_log, dependent: :destroy # categoryが消えるとそのcategory_idを持つcategorized_logも消える
  has_many :logs, through: :categorized_log
end
