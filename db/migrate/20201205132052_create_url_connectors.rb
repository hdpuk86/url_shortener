class CreateUrlConnectors < ActiveRecord::Migration[6.0]
  def change
    create_table :url_connectors do |t|
      t.string :long_url, null: false
      t.string :short_url, null: false

      t.timestamps
    end
  end
end
