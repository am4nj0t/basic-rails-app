class Topic < ActiveRecord::Base
	has_many :posts, dependent: :destroy

	scope :publicly, -> { where(public: true) }
	scope :privately, -> { where(public: false) }
	scope :visible_to, -> (user) { user ? all : where(public: true) }
end
