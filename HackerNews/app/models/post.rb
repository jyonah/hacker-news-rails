class Post < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :comments
  has_many :commenters, through: :comments, source: :commenter

  validates :title, :url, :author, presence: true
end
