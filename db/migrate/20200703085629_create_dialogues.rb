class CreateDialogues < ActiveRecord::Migration[5.2]
  def change
    create_table :dialogues do |t|
      t.text :line
      t.string :movie
      t.boolean :nonveg

      t.timestamps
    end
  end
end
