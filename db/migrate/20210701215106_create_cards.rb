class CreateCards < ActiveRecord::Migration[6.1]
  def up
    create_table :cards do |t|
      t.integer :imt_id
      t.text :product_name

      t.timestamps
    end

    add_index :cards, :imt_id, unique: true
  end

  def down
    remove_index :cards, name: :imt_id
    drop_table :cards
  end
end
