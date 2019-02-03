class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.integer :customer_id
      t.integer :attribute_id
      t.string :answer_type
      t.string :value
    end
  end
end
