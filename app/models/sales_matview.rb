class SalesMatview < ActiveRecord::Base
  self.table_name = 'sales_matview'

  def readonly?
    true
  end

  def self.refresh
    ActiveRecord::Base.connection.execute('REFRESH MATERIALIZED VIEW sales_matview')
  end
end
