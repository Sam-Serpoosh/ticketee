class Comment < ActiveRecord::Base
  validates :text, :presence => true

  belongs_to :comment
  belongs_to :user
end
