class AddVisitCountToUrlConnector < ActiveRecord::Migration[6.0]
  def change
    add_column :url_connectors, :visit_count, :integer, null: false, default: 0
  end
end
