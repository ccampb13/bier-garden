RSpec.describe "Adding Regions", :integration do
  context "valid input" do
    let!(:output){ run_bier_with_input("add", "Germany") }

    it "should add a region" do
      expect(Region.count).to eql 1
    end
    it "should save the record accurately" do
      expect(Region.last.name).to eql "Germany"
    end
    it "should print a success message" do
      expect(output).to include("Germany has been added to the list of regions")
    end
  end

  context "invalid input" do
    let(:long_string){"beer" * 20}
    let!(:output){ run_bier_with_input("add", long_string)}

    it "prints the error message for the type of invalid input" do
      expect(output).to include("Name must be less than 30 characters")
    end
    it "shouldn't save the new record" do
      expect(Region.count).to eql 0
    end
  end
end
