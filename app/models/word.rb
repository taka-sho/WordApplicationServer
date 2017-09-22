class Word < ApplicationRecord
  has_many :word_that_the_user_learneds
  has_many :users, :through => :word_that_the_user_learneds

  has_many :word_relationships_of_from_word, :class_name => 'WordRelationship', :foreign_key => 'from_word_id', :dependent => :destroy
  has_many :word_relationships_of_to_word, :class_name => 'WordRelationship', :foreign_key => 'to_word_id', :dependent => :destroy
  has_many :dummy_of_from_word, :through => :word_relationships_of_from_word, :source => 'to_word'
  has_many :dummy_of_to_word, :through => :word_relationships_of_to_word, :source => 'from_word'
end
