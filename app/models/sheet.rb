class Sheet < ApplicationRecord
    belongs_to :user
    has_many :songs
    validates :title, presence: true
	
    default_scope -> { order(created_at: :desc) }
end
