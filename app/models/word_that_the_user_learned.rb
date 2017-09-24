class WordThatTheUserLearned < ApplicationRecord
  belongs_to :user
  belongs_to :word
  validates :from_word_id, :uniqueness => {:scope => :to_word_id}
end
