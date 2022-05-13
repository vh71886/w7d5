class User < ApplicationRecord
    validates :username, :session_token, :password_digest, presence: true
    validates :username, :session_token, uniqueness: true
    validates :password, length: { minimum: 6 }, allow_nil: true
    
    attr_reader :password
    before_validation :ensure_session_token

    # Associations

    # for Post: author
    has_many :authored_posts,
        foreign_key: :user_id,
        class_name: :Post,
        primary_key: :id

    # for Sub:moderator 
    has_many :subs,
        foreign_key: :user_id,
        class_name: :User,
        primary_key: :id

    # SPIRE
    def self.find_by_credentials(username, password)
        @user = User.find_by(username: username)
        if @user && @user.is_password?(password)
            @user
        else
            nil
        end
    end

    def password=(password)
        # .create makes an object and then saves to a string
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        # .new converts to a password object
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end
end
