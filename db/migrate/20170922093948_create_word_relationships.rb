class CreateWordRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :word_relationships do |t|
      t.integer :from_word_id
      t.integer :to_word_id

      t.timestamps
    end
  end
end
