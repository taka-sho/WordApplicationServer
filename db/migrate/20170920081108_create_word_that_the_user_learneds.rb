class CreateWordThatTheUserLearneds < ActiveRecord::Migration[5.1]
  def change
    create_table :word_that_the_user_learneds do |t|
      t.integer :user_id
      t.integer :word_id

      t.timestamps
    end
  end
end
