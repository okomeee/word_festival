class Post < ApplicationRecord
  validates :word, presence: true, ng_word: true, length: { in: 1..10 }
end
