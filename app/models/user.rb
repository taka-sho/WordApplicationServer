class User < ApplicationRecord

    has_many :word_that_the_user_learneds
  has_many :words, :through => :word_that_the_user_learneds

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :omniauthable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  enum authority: {normal: 0, administrator: 1, semi_administrator: 2}

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.new(
        name:     auth.extra.raw_info.name,
        provider: auth.provider,
        uid:      auth.uid,
        email:    auth.info.email,
        password: Devise.friendly_token[0,20]
      )
      user.save
    end
    user
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.new(
        name:     auth.info.nickname,
        provider: auth.provider,
        uid:      auth.uid,
        email:    User.create_unique_email,
        password: Devise.friendly_token[0,20]
      )
      user.save
    end
    user
  end

  # twitterではemailを取得できないので、適当に一意のemailを生成
  def self.create_unique_email
    return SecureRandom.uuid + "@example.com"
  end
end
