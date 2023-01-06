require 'rails_helper'

RSpec.describe Cell, type: :model do
  describe "Validity of Board model" do
    let!(:board) { create :board }

    context "when valid data" do
      let(:cell) { build(:cell, board: board) }

      it "cell factory should build a valid object" do
        expect(cell).to be_valid(Cell)
      end

      it "saving a new board should change the number of elements on DB" do
        expect {cell.save}.to change {board.cells.count}.by 1
      end
    end

    context "when row is blank" do
      it_behaves_like 'expect raise error' do
        let(:invalid_object) { build(:cell, board: board, row: nil) }
        let(:message) { "Validation failed: Row can't be blank, Row is not a number" }
      end
    end

    context "when row is -1" do
      it_behaves_like 'expect raise error' do
        let(:invalid_object) { build(:cell, board: board, row: -1) }
        let(:message) { "Validation failed: Row must be greater than or equal to 0" }
      end
    end

    context "when column is blank" do
      it_behaves_like 'expect raise error' do
        let(:invalid_object) { build(:cell, board: board, column: nil) }
        let(:message) { "Validation failed: Column can't be blank, Column is not a number" }
      end
    end

    context "when column is -1" do
      it_behaves_like 'expect raise error' do
        let(:invalid_object) { build(:cell, board: board, column: -1) }
        let(:message) { "Validation failed: Column must be greater than or equal to 0" }
      end
    end
  end
end