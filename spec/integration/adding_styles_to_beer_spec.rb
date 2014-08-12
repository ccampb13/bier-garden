RSpec.describe "Adding styles to a Brewery", :integration do
  let!(:region1){ Region.create(name: "Tennessee")}
  let!(:beer1){ Beer.create(brewery: "Yazoo", location: "Nashville, TN", description: "The best brewery in town", region: region1)}

  context "valid input" do
    let(:output){ run_bier_with_input('1', '1') } # Yazoo

    before do
      Style.create(name: "Gerst", style: "Amber Ale", abv: "5", beer: beer1)
    end

    it "should add a style" do
      expect(Style.count).to eql 1
    end

    it "saves the correct style to the record" do
      expect(Style.last.beer_id).to eq region1.id
    end

    it "saves the style name" do
      expect(Style.last.name).to eq "Gerst"
    end
  end

  context "invalid input" do
    let!(:region1){ Region.create(name: "Tennessee")}
    let!(:beer1){ Beer.create(brewery: "Yazoo", location: "Nashville, TN", description: "The best brewery in town", region: region1) }
    let!(:output){ run_bier_with_input("1", "1" "add", "") }

     it "doesn't create a style" do
      expect(Style.count).to eq 0
    end
  end
end
