require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

  let(:medium) do
    Album.create(create_params[:album])
  end

  it_behaves_like "a medium controller"


  let(:create_params) do
    {
      album: {
        title: "Something",
        artist: "Uncle Bob",
        ranking: 3,
        description: "description"
      }
    }
  end

  let(:update_params) do
    { id: medium.id,
      album: {
        title: "Something",
        artist: "Uncle Joe",
        ranking: 0,
        description: "new description"
      }
    }
  end

  let(:bad_params) do
    {id: medium.id,
      album: {title: ""}
    }
  end
end
