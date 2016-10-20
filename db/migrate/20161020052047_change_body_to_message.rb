class ChangeBodyToMessage < ActiveRecord::Migration[5.0]
  #変更後
  def up
    change_column :messages, :body, :text, null: true
  end

  #変更前
  def down
    change_column :messages, :body, :text, null: false
  end
end
