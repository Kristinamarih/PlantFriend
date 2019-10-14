class ChangePriceToBeDecimalInProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price, :decimal
  end
end
