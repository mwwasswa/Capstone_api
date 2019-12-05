class BlogSerializer < ActiveModel::Serializer
  attributes :id, :category, :title, :content, :picture
  has_one :user
end
