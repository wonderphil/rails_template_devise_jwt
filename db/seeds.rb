AdminUser.create!(email: 'admin@dev.com', password: 'password') if Rails.env.development?
