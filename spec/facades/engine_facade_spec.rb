require "rails_helper"

RSpec.describe EngineFacade do
  before :each do
    @facade = EngineFacade.new
  end

  describe "#initialize" do
    it "exists" do
      expect(@facade).to be_an_instance_of(EngineFacade)
    end
  end

  describe "methods" do
    it "returns an array of merchant objects with their attributes" do
      expect(@facade.all_merchants).to be_a(Array)
      @facade.all_merchants.each do |merchant|
        expect(merchant.name).to be_a(String)
      end
    end

    it "returns an array of item objects with their attributes" do
      expect(@facade.get_items(1)).to be_a(Array)
      @facade.get_items(1).each do |item|
        expect(item.name).to be_a(String)
        expect(item.unit_price).to be_a(Float)
        expect(item.description).to be_a(String)
        expect(item.merchant_id).to be_a(Integer)
      end
    end

      it "returns a single merchant object matching the search parameters" do
        merchant = @facade.merchants_by_name('Sch')
        expect(merchant).to be_a(Merchant)
        expect(merchant.name).to be_a(String)
        expect(merchant.id).to be_a(String)
      end
  end
end