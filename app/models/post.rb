class Post < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :admin_user
end
