class Song < ApplicationRecord
	# 一个歌单属于一个用户
	belongs_to :user
	
	# 歌手，这里引用的是用户对象
	# 下面的意思是：
	# 一首音乐属于一个singer，类名是User
	# 外键是singer_id
	belongs_to :singer, class_name: 'User', foreign_key: 'singer_id'
	
	# 验证（约束）
	# 标题不能为空
	validates :title, presence: true, length: {minimum: 2,maximum: 20 }
	validates :banner, presence: true
	validates :uri, presence: true
	validates :style, inclusion: { in: [STYLE_LYRIC,STYLE_LYRIC_KSC] }
	
	default_scope -> { order(created_at: :desc) }
end