class AddUserToUrlConnectors < ActiveRecord::Migration[6.0]
  def change
    add_reference :url_connectors, :user, null: false, foreign_key: true
  end
end
