class Post < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :admin_user
  has_many :comments, :dependent => :destroy
end
