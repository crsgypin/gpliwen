class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :account_owner_users
  has_many :account_owners, :through=>:account_owner_users
  has_many :account_entities, :through=>:account_owners
  accepts_nested_attributes_for :account_owner_users, :allow_destroy=>:true
  has_many :deal_recrod_user_updates

  def display_name
    if self.username.present?
      return self.username
    elsif self.name.present?
      return self.name
    else
      return self.email.split("@").first
    end

  end

  def admin?
    self.role == "admin"
  end

  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    user = User.find_by_auth_uid( auth.uid )
    if user
      user.auth_token = auth.credentials.token
      user.auth_raw_data = auth
      user.save!
      return user
    end

    # Case 2: Find existing user by email
    existing_user = User.find_by_email( auth.info.email )
    if existing_user
    	existing_user.auth_provider = auth.provider
    	existing_user.auth_uid = auth.uid
    	existing_user.auth_token = auth.credentials.token
    	existing_user.auth_raw_data = auth
      existing_user.save!
      return existing_user
    end

    # Case 3: Create new password
    user = User.new
    user.auth_provider = auth.provider
    user.auth_uid = auth.uid
    user.auth_token = auth.credentials.token
    user.auth_raw_data = auth

    user.avatar = URI.parse(auth.info.image.gsub 'http','https')
    user.username = auth.info.name
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.save!
    return user
  end

end
