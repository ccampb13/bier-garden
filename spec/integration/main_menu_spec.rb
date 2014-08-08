RSpec.describe "Bier Garden Menu", :integration do
  context "Prints a menu" do
    it "shows a beer" do
      actual = run_bier_with_input()
      expected = %q{

         .   *   ..  . *  *
       *  * @()Ooc()*   o  .
           (Q@*0CG*O()  ___
          |\_________/|/ _ \
          |  |  |  |  | / | |
          |  |  |  |  | | | |
          |  |  |  |  | | | |
          |  |  |  |  | | | |
          |  |  |  |  | | | |
          |  |  |  |  | \_| |
          |  |  |  |  |\___/  Bier Garden
          |\_|__|__|_/|
           \_________/
}
      expect(actual).to include(expected)
    end
  end

  context "when we type an incorrect command" do
    let(:output){ run_bier_with_input('remove') }
    it "prints an informative message" do
      expect(output).to include("I don't know the 'remove' command.")
    end
  end
end
