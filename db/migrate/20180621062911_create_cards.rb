class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :card do |t|
      t.string :title
      t.string :description
      t.integer :position
      t.string :color
      t.references :board, foreign_key: true
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
