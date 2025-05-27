class AddFieldsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :category, null: false, foreign_key: true unless column_exists?(:products, :category_id)
    add_column :products, :active, :boolean unless column_exists?(:products, :active)
  end
end
