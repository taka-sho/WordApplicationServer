class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.string :japanaze
      t.string :english
      t.string :parts_of_speech

      t.timestamps
    end
  end
end
