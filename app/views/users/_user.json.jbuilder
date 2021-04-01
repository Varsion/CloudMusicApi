json.extract! user, :id, :nickname, :avatar, :description, :gender, :birthday, :email, :phone, :password_digest, :session_digest, :reset_password_digest, :reset_password_sent_at, :confirmation_digest, :confirmed_at, :confirmation_sent_at, :qq_id, :qq_id_digest, :wechat_id, :wechat_id_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
