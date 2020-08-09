class RemovePostCodeToAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :post_code, :integer
  end
end
