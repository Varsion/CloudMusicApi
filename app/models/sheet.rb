class Sheet < ApplicationRecord
    belongs_to :user
    has_many :songs
    validates :title, presence: true

    has_many :relations
    # through：表示这个关系是通过relations表来管理的
    has_many :songs, through: :relations
    
    # 收藏
    has_many :collections
    has_many :users, through: :collections
    
    # 歌单下有多个标签
    has_many :labels
    has_many :tags, through: :labels

    # 让当前模型，支持labels嵌套模型
    accepts_nested_attributes_for :labels
    
    default_scope -> { order(created_at: :desc) }
end
