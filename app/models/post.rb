class Post < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :admin_user
  has_many :comments, :dependent => :destroy
  validates :title, :presence => true
  validates_length :body, :minimum => 10
end
