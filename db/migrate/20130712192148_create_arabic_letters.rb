class CreateArabicLetters < ActiveRecord::Migration
  def change
    create_table :arabic_letters do |t|
    	t.string :ascii_value
    	t.string :unicode_value
    	t.string :english_value
    	t.string :english_symbol
      t.timestamps
    end
  end
end
