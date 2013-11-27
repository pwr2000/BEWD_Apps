class CreateRewslies < ActiveRecord::Migration
  def change
    create_table :rewslies do |t|
      t.string :title
      t.string :link
      t.integer :upvotes
      t.string :category

      t.timestamps
    end
  end
end
