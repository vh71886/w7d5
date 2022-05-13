class Sub < ApplicationRecord
    validates :title, :description, presence: true

    # done
    belongs_to :moderator, 
        foreign_key: :user_id,
        class_name: :User,
        primary_key: :id

    # for Post:sub
    has_many :posts,
        foreign_key: :sub_id,
        class_name: :Post,
        primary_key: :id

end
