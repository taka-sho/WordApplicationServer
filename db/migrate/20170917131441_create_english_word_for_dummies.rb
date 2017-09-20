class CreateEnglishWordForDummies < ActiveRecord::Migration[5.1]
  def change
    create_table :english_word_for_dummies do |t|
      t.integer :word_id
      t.string :dummy_word

      t.timestamps
    end
  end
end
