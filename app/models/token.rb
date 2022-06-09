class Token < ApplicationRecord
  include TokenEncrypted

  belongs_to :identical, polymorphic: true
end
