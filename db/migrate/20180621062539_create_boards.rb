class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :board do |t|
      t.string :title
      t.string :description
      t.integer :position
      t.string :color

      t.timestamps
    end
  end
end
