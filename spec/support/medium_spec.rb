RSpec.shared_examples "a medium" do

  describe "model validations" do
    it "requires a title" do
      medium = described_class.new

      expect(medium).to be_invalid
      expect(medium.errors.keys).to include :title
    end
  end

end
