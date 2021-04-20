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
    
    default_scope -> { order(created_at: :desc) }
end
