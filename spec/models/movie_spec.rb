require 'rails_helper'

RSpec.describe Movie, type: :model do

  # let(:medium) do
  #   Movie.create(create_params[:movie])
  # end

  it_behaves_like "a medium"

  # 
  # let(:create_params) do
  #   {
  #     movie: {
  #       title: "Something",
  #       director: "Uncle Bob",
  #       ranking: 3,
  #       description: "description"
  #     }
  #   }
  # end

end
