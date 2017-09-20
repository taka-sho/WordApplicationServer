class CreateJapaneseWordForDummies < ActiveRecord::Migration[5.1]
  def change
    create_table :japanese_word_for_dummies do |t|
      t.string :word_id
      t.string :dummy_word

      t.timestamps
    end
  end
end
