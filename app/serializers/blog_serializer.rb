class BlogSerializer < ActiveModel::Serializer
  attributes :id, :category, :title, :content
  has_one :user
end
