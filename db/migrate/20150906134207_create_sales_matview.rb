class CreateSalesMatview < ActiveRecord::Migration
  def change
    execute <<-SQL
      CREATE MATERIALIZED VIEW sales_matview AS
        SELECT DATE_TRUNC('day', sold_date) AS date,
        i.name AS item,
        SUM(amount) AS amount,
        SUM(quantity) AS quantity,
        c.name AS channel
      FROM sales s
      INNER JOIN items i ON i.id = s.item_id
      INNER JOIN channels c ON c.id = s.channel_id
      GROUP BY DATE_TRUNC('day', sold_date), item, channel
    SQL
  end
end
