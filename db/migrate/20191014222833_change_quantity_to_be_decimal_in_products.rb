class ChangeQuantityToBeDecimalInProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :quantity, :decimal
  end
end
