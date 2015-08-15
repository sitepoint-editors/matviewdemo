class Sale < ActiveRecord::Base
  belongs_to :item
  belongs_to :channel
end
