class AddMailedStatusToComments < ActiveRecord::Migration
  def change
    add_column :spree_comments, :mailed, :boolean
  end
end
