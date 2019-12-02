class BlogSerializer < ActiveModel::Serializer
  attributes :id, :category, :title, :content
end
