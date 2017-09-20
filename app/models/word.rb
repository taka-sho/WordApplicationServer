class Word < ApplicationRecord
  has_many :word_that_the_user_learneds
  has_many :users, :through => :word_that_the_user_learneds

  has_many :japanese_word_for_dummies
  has_many :english_word_for_dummies

end
