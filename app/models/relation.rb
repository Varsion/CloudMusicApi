class Relation < ApplicationRecord
	# 链接歌单和音乐
    belongs_to :song
    belongs_to :sheet
    belongs_to :user
end
