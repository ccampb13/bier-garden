RSpec.describe "Adding beers to a region", :integration do
  context "valid input" do

    let!(:region1){ Region.create(name: "Germany")}
    let!(:region2){ Region.create(name: "Belgium")}
    let!(:output){ run_bier_with_input("2", "add", "Westvleteren", "Brussels", "A brewery in Belgium")}

    # it "prints a success message" do
    #   expect(output).to include("Westvleteren has been added to the list of breweries in Belgium")
    # end

    it "should add a brewery" do
      expect(Beer.count).to eql 1
    end

    it "saves the correct region to the record" do
      expect(Beer.last.region_id).to eq region2.id
    end

    it "saves the brewery name" do
      expect(Beer.last.brewery).to eq "Westvleteren"
    end
  end

  context "invalid input" do
    let!(:region){ Region.create(name: "Germany") }
    let!(:output){ run_bier_with_input("1", "add", "") }

    # it "prints an error message" do
    #   expect(output).to include("Name can't be blank")
    # end

    it "doesn't create a brewery" do
      expect(Beer.count).to eq 0
    end
  end
end
#{brewery} has been added to list of breweries in #{@origin_region.name}
