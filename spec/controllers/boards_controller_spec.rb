require 'rails_helper'

RSpec.describe BoardsController, type: :controller do

  let(:valid_attributes) {
    {
      height: Random.rand(10...100),
      width: Random.rand(10...100),
      num_mimes: Random.rand(1...100),
      name: 'Test Board',
      creator_email: 'test@example.com'
    }
  }

  let(:invalid_attributes) {
    {
      height: -1,
      width: -1,
      num_mimes: -2,
      name: 'Test Board',
      creator_email: 'test@example.com'
    }
  }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Board" do
        post :create, params: { board: valid_attributes}
        expect(Board.count).to eq(1)
      end

      it "renders a JSON response with the new board" do
        post :create, params: {board: valid_attributes}
        expect(response).to have_http_status(302)
      end
    end

    context "with invalid params" do
      it "render new page" do
        post :create, params: { board: invalid_attributes }, as: :html
        expect(response).to render_template(:new)
      end
    end
  end
end