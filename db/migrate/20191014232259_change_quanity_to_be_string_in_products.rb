class ChangeQuanityToBeStringInProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :quantity, :string
  end
end
