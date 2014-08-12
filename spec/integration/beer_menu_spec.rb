RSpec.describe "Viewing the beer menu", :integration do
  let!(:region1){ Region.create(name: "Tennessee") }
  let!(:region2){ Region.create(name: "New York") }

  context "a region that is in the list" do
    let(:output){ run_bier_with_input('2') } # New York

    before do
      Beer.create(brewery: "Yazoo", location: "Nashville, TN", description: "The first big microbrew in Music City", region: region1)
      Beer.create(brewery: "Jackalope", location: "Nashville, TN", description: "The second big microbrew in Music City", region: region1)
      Beer.create(brewery: "Brooklyn", location: "Brooklyn, NY", description: "The first big microbrew in Brooklyn", region: region2)
      Beer.create(brewery: "Heartland", location: "Brooklyn, NY", description: "The second big microbrew in Brooklyn", region: region2)
    end

    it "should include the name of the region being viewed" do
      expect(output).to include("We're traveling to New York to try some of their local beers !")
    end
    # it "should list the breweries in this region" do
    #   expected = "1. Brooklyn\n" +
    #              "2. Heartland\n"
    #   expect(output).to include(expected)
    # end
  #   it "shouldn't list the skills in other training paths" do
  #     expect(output).not_to include("with Scissors")
  #     expect(output).not_to include("like a Zombie")
  #   end
  end

  context "if we enter a region that doesn't exist" do
    let(:output){ run_bier_with_input('3') }
    it "prints an error message" do
      expect(output).to include("Sorry, region 3 doesn't exist.")
    end
  end
end
