require 'rails_helper'

RSpec.describe Movie, type: :model do

describe ".validates" do
  it "must have a title" do
    expect(Movie.new(title: nil)).to_not be_valid
  end
end

end
