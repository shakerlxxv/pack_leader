class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  attr_accessor :password
  before_save :encrypt_password

  validates :password, :confirmation => true
  validates :password, :presence => true
  validates :name, :presence => true

  # from ROR Tutorial by Matt Hartl
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :email, :format => { :with => email_regex }

  # from Ryan Bates User Authentication RailsCast
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  # from Ryan Bates User Authentication RailsCast
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password,user.password_salt)
      user
    else
      nil
    end
  end

end
