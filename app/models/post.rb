class Post < ApplicationRecord
    belongs_to :user
    validates :title, :body, presence: true

    self.per_page = 5

end
