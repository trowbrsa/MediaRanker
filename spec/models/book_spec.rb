require 'rails_helper'

RSpec.describe Book, type: :model do

  describe ".validates" do
    it "must have a title" do
      expect(Book.new(title: nil)).to_not be_valid
    end
  end

end
