class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id,     null: false
      t.integer :tourist_spot_id, null: false
      t.string :title,            null: false
      t.integer :evaluation,      null: false
      t.text :thoughts,           null: false
      t.timestamps
    end
  end
end
