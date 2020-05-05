class Log < ApplicationRecord
  has_many :dones
  has_many :knowledges
  has_many :todos
end
