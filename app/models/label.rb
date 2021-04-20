class Label < ApplicationRecord
	belongs_to :tag
	belongs_to :sheet
	belongs_to :user

	# 不能为空
	validates :tag, presence: true
	validates :sheet, presence: true
	validates :user, presence: true
end
