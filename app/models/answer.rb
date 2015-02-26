class Answer < ActiveRecord::Base
	validates :title, presence: true
  validates :content, presence: true

	belongs_to :question

end
