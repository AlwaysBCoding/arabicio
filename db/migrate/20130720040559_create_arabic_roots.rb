class CreateArabicRoots < ActiveRecord::Migration
  def change
    create_table :arabic_roots do |t|
    	t.string :root, array: true, length: 4
    	t.string :forms, array: true, length: 15
      t.timestamps
    end
  end
end
