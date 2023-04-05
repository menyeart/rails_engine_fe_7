class EngineFacade
  def initialize
  end

  def all_merchants
    EngineService.get_merchants[:data].map do |merchant|
      Merchant.new(find_info(merchant))
    end
  end

  def get_items(merchant_id)
    EngineService.get_items(merchant_id)[:data].map do |item|
      Item.new(find_item_info(item))
    end
  end

private

  def find_info(merchant)
    info_hash = Hash.new(nil)
    info_hash[:name] = merchant[:attributes][:name]
    info_hash[:id] = merchant[:id]
    info_hash
  end

  def find_item_info(item)
    info_hash = Hash.new(nil)
    info_hash[:id] = item[:id]
    info_hash[:name] = item[:attributes][:name]
    info_hash[:description] = item[:attributes][:description]
    info_hash[:unit_price] = item[:attributes][:unit_price]
    info_hash[:merchant_id] = item[:attributes][:merchant_id]
    info_hash
  end
end