require "rails_helper"

RSpec.describe EngineService do
  describe "class methods" do
    describe "#parse_api" do
      it "returns a json object" do
        expect(EngineService.get_url("/api/v1/merchants")).to be_a(Hash)
      end

      describe "#get_merchants" do
        it "gets all merchants" do
          all_merchants = EngineService.get_merchants

          expect(all_merchants).to be_a(Hash)

          expect(all_merchants).to have_key(:data)
          expect(all_merchants[:data].first).to have_key(:id)

          expect(all_merchants[:data].first).to have_key(:type)
          expect(all_merchants[:data].first[:type]).to be_a(String) 

          expect(all_merchants[:data].first).to have_key(:attributes)
          
          expect(all_merchants[:data].first[:attributes]).to have_key(:name)
          expect(all_merchants[:data].first[:attributes][:name]).to be_a(String)
        end
      end

      describe "#get_items" do
        it "gets all a merchant's items" do
          merchant_id = 1
          all_items = EngineService.get_items(merchant_id)

          expect(all_items).to be_a(Hash)

          expect(all_items).to have_key(:data)
          expect(all_items[:data].first).to have_key(:id)

          expect(all_items[:data].first).to have_key(:type)
          expect(all_items[:data].first[:type]).to be_a(String) 

          expect(all_items[:data].first).to have_key(:attributes)
          
          expect(all_items[:data].first[:attributes]).to have_key(:name)
          expect(all_items[:data].first[:attributes][:name]).to be_a(String)

          expect(all_items[:data].first[:attributes]).to have_key(:description)
          expect(all_items[:data].first[:attributes][:name]).to be_a(String)

          expect(all_items[:data].first[:attributes]).to have_key(:unit_price)
          expect(all_items[:data].first[:attributes][:unit_price]).to be_a(Float)

          expect(all_items[:data].first[:attributes]).to have_key(:merchant_id)
          expect(all_items[:data].first[:attributes][:merchant_id]).to be_a(Integer)
        end

        describe "#find_by_name" do
          it "find a merchant by name or name fragment" do
            name = "Sch"
            merchant = EngineService.find_by_name(name)
  
            expect(merchant).to be_a(Hash)
            expect(merchant).to have_key(:data)
            expect(merchant[:data]).to have_key(:id)
            expect(merchant[:data]).to have_key(:attributes)
            expect(merchant[:data][:attributes]).to have_key(:name)
            expect(merchant[:data][:attributes][:name]).to be_a(String)
          end
        end
      end
    end
  end
end