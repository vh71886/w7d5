class Post < ApplicationRecord
    validates :title, :sub_id, :author_id, presence: true
    
    # done
    belongs_to :author,
        foreign_key: :user_id, 
        class_name: :User,
        primary_key: :id
    
    # done
    belongs_to :sub, 
        foreign_key: :sub_id,
        class_name: :Sub,
        primary_key: :id
end
