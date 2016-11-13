class User < ActiveRecord::Base


  def self.create_user! (user_email)
      user_email['session_token'] = SecureRandom.base64
      User.create!(user_email)
  end
  
  def self.authenticate (user_id, user_email)
      user = find_by_user_id(user_id)
      (user && user.email == user_email)? user:nil
  end
end
