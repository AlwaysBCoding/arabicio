class CreateEnglishMeanings < ActiveRecord::Migration
  def change
    create_table :english_meanings do |t|
      t.belongs_to :arabic_stem
      t.text :meaning
      t.string :measure, length: 4
      t.timestamps
    end
  end
end
