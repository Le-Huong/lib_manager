class Author < ApplicationRecord
  belongs_to :publisher
  
  has_many :relationships, as: :ownerable
  has_many :books, through: :relationships, source_type: Book.name, source: :targetable
  has_many :follower_users, through: :relationships, source_type: User.name, source: :ownerable

  rails_admin do
    exclude_fields :categories, :relationships, :users, :borrow_books, :comments, :user_ratings, :authors
  end
end