class UserSerializer < BaseSerializer
  attributes :id, :created_at, :updated_at, :email, :name
end
