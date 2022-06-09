class AdminUser < User
  default_scope -> { where(is_admin: true) }
end
