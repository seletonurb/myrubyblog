class Post < ApplicationRecord
  attr_accessible :name, :body, :author_id
  belongs_to :category
end
