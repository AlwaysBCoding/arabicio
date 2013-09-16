class CreateArabicStems < ActiveRecord::Migration
  def change
    create_table :arabic_stems do |t|
    	t.string :root, array: true, length: 4, default: []
    	t.string :measures, array: true, length: 15, default: []
      t.string :perfect_kicker, length: 2
      t.string :imperfect_kicker, length: 2
    	t.string :verbal_nouns, array: true, length: 5, default: []
      t.text :notes
      t.timestamps
    end
  end
end
