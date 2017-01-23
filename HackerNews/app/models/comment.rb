class Comment < ApplicationRecord
  belongs_to :commenter, class_name: :user
  belongs_to :post

  validates :body, :post, :commenter, presence: true
end
