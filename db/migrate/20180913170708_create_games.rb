class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      # status can be init, in_progress, win, lose
      t.text :mines
      t.text :cells
      t.string :status, default: :init
      t.integer :rows, default: 8
      t.integer :cols, default: 8
      t.timestamps
    end
  end
end
