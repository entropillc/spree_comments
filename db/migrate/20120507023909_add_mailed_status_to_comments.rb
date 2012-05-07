class AddMailedStatusToComments < ActiveRecord::Migration
  def change
    add_column :spree_comments, :mailed, :boolean
    add_column :spree_comments, :status, :string
  end
end
