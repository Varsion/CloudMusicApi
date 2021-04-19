class Sheet < ApplicationRecord
    belongs_to :user
    has_many :songs
    validates :title, presence: true

    has_many :relations
    # 一个歌单，有多个歌曲
    # through：表示这个关系是通过relations表来管理的
    has_many :songs, through: :relations
    
    default_scope -> { order(created_at: :desc) }
end
