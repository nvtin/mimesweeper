require "rails_helper"

RSpec.describe 'Cell Creator' do
  subject(:service) { CellsCreator.new(board: board).call }

  let(:board) { create(:board) }

  context 'when have valid board' do
    before { service }

    it 'board cells were created successfully.' do
      expect(board.cells.count).to eq board.height * board.width
    end

    it 'mime cells are correct number.' do
      expect(board.cells.where(is_mime: true).count).to eq board.num_mimes
    end
  end

  context 'when invalid board' do
    let(:board) { nil }

    it 'error will be raised' do
      expect { service }.to raise_error(RuntimeError, 'Board is required to create cell')
    end
  end
end