class Item
  attr_reader :name,
              :id,
              :description,
              :unit_price,
              :merchant_id

  def initialize(info)
    @name = info[:name]
    @id = info[:id]
    @description = info[:description]
    @unit_price = info[:unit_price]
    @merchant_id = info[:merchant_id]
  end
end