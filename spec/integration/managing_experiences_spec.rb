RSpec.describe "Marking the beer style as experienced or not", :integration do

  let!(:region1){ Region.create(name: "Tennessee")}
  let!(:beer1){ Beer.create(brewery: "Yazoo", location: "Nashville, TN", description: "The best brewery in town", region: region1)}
  let!(:style1){ Style.create(name: "Gerst", style: "Amber Ale", abv: "5", beer: beer1)}
  let!(:style2){ Style.create(name: "Dos Perros", style: "Mexican Lager", abv: "5", beer: beer1)}

  context "a beer that has not previously been experienced" do
    let!(:output_yes){ run_bier_with_input('1', '1', '1', 'y') }
    let!(:output_no){ run_bier_with_input('1', '1', '2', 'n') }

    context "marking as experienced" do
      before do
        output_yes
      end
      it "should ask the user if they have experienced the beer yet" do
        expect(output_yes).to include("Mark as experienced? y/n")
      end

      # it "should print a congratulatory message" do
      #   expect(output_yes).to include("Congrats, you are on a mission!")
      # end

      it "should save a new experience for that beer" do
        style1.experience.consumed.should be_truthy
      end

      context "and viewing the skill again" do
        let(:output_view){ run_bier_with_input('1', '1', '1') }
        before do
          output_view
        end
        # it "should congratulate me for knowing this already" do
        #   expect(output_view).to include("Congrats! You already knew this!")
        # end
        it "should not ask the user if they have achieved the skill yet" do
          expect(output_view).not_to include("Mark as achieved? y/n")
        end
      end
    end

    context "marking as not experienced" do
      before do
        output_no
      end
      it "should ask the user if they have experienced the beer yet" do
        expect(output_no).to include("Mark as experienced? y/n")
      end

      # it "should print a insulting message" do
      #   expect(output_no).to include("Really?! All you had to do was read this paragraph. Would you agree with that?")
      # end
      #
      it "should save a new experience for that skill" do
        style2.experience.consumed.should be_falsey
      end

      # context "then updating it to mark it as mastered" do
      #   let(:output_updated){ run_bier_with_input('1', '1', '2' 'y') }
      #   it "should ask the user if they have achieved the skill yet" do
      #     expect(output_updated).to include("Mark as achieved? y/n")
      #   end
      #
      #   it "should print a congratulatory message" do
      #     expect(output_updated).to include("Congrats, you've mastered Name Calling!")
      #   end
      # end
    end
  end
end
