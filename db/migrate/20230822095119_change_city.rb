class ChangeCity < ActiveRecord::Migration[7.0]
  def change
    add_column :instruments, :city, :string
  end
end
