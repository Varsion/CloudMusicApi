class Collection < ApplicationRecord
	# 用户收藏歌单
	belongs_to :sheet
	belongs_to :user
end
