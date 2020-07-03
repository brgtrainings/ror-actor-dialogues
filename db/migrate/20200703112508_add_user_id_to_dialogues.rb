class AddUserIdToDialogues < ActiveRecord::Migration[5.2]
  def change
    add_column :dialogues, :user_id, :int
  end
end
