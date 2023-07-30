class Question < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  has_many :answers
  validates :content, presence: true
end
