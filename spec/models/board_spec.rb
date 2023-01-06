require 'rails_helper'

RSpec.describe Board, type: :model do
  describe "Validity of Board model" do
    context "when valid data" do
      let(:valid_board) { build :board }

      it ":board factory should build a valid object" do
        expect(valid_board).to be_valid(Board)
      end

      it "saving a new board should change the number of elements on DB" do
        expect {valid_board.save}.to change {Board.count}.by 1
      end
    end

    context "when name is blank" do
      it_behaves_like "expect raise error" do
        let(:invalid_object) { build(:board, name: nil) }
        let(:message) { "Validation failed: Name can't be blank" }
      end
    end

    context "when creator email is blank" do
      it_behaves_like "expect raise error" do
        let(:invalid_object) { build(:board, creator_email: nil) }
        let(:message) { "Validation failed: Creator email can't be blank" }
      end
    end

    context "when height is blank" do
      it_behaves_like "expect raise error" do
        let(:invalid_object) { build(:board, height: nil) }
        let(:message) { "Validation failed: Height can't be blank, Height is not a number" }
      end
    end

    context "when height is blank" do
      it_behaves_like "expect raise error" do
        let(:invalid_object) { build(:board, height: -1) }
        let(:message) { "Validation failed: Height must be greater than 0" }
      end
    end

    context "when height is blank" do
      it_behaves_like "expect raise error" do
        let(:invalid_object) { build(:board, height: 0) }
        let(:message) { "Validation failed: Height must be greater than 0" }
      end
    end

    context "when width is blank" do
      it_behaves_like "expect raise error" do
        let(:invalid_object) { build(:board, width: nil) }
        let(:message) { "Validation failed: Width can't be blank, Width is not a number" }
      end
    end

    context "when width is blank" do
      it_behaves_like "expect raise error" do
        let(:invalid_object) { build(:board, width: -1) }
        let(:message) { "Validation failed: Width must be greater than 0" }
      end
    end

    context "when width is blank" do
      it_behaves_like "expect raise error" do
        let(:invalid_object) { build(:board, width: 0) }
        let(:message) { "Validation failed: Width must be greater than 0" }
      end
    end

    context "when num_mimes is blank" do
      it_behaves_like "expect raise error" do
        let(:invalid_object) { build(:board, num_mimes: nil) }
        let(:message) { "Validation failed: Num mimes can't be blank, Num mimes is not a number" }
      end
    end

    context "when num_mimes is blank" do
      it_behaves_like "expect raise error" do
        let(:invalid_object) { build(:board, num_mimes: -1) }
        let(:message) { "Validation failed: Num mimes must be greater than or equal to 0" }
      end
    end
  end
end