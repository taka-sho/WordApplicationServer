class WordRelationship < ApplicationRecord
  belongs_to :from_word, :class_name => 'Word'
  belongs_to :to_word, :class_name => 'Word'
end
