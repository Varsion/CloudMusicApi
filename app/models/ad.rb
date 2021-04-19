class Ad < ApplicationRecord
	# 表间链接
    belongs_to :user
	# 约束
    validates :banner, presence: true
end
