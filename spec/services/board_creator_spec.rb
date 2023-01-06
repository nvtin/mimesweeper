require "rails_helper"

RSpec.describe 'Board Creator' do
  subject(:service) { BoardCreator.new(options).call }

  let(:board_height) { 50 }
  let(:board_width) { 50 }
  let(:num_mimes) { 50 }
  let(:board_name) { 'Test Board' }
  let(:creator_email) { 'test@examplel.com' }
  let(:options) { { name: board_name, creator_email: creator_email, height: board_height, width: board_width, num_mimes: num_mimes } }

  context 'when have full correct data' do
    before { service }

    it 'one board was created successfully.' do
      expect(Board.count).to eq 1
    end

    it 'created board will have correct attributes.' do
      expect(Board.first).to have_attributes(height: board_height, width: board_width, num_mimes: num_mimes, creator_email: creator_email, name: board_name)
    end

    it 'created board will have correct number of cells.' do
      expect(Board.first.cells.count).to eq board_height * board_width
    end

    it 'created board will have correct number of mimes.' do
      expect(Board.first.cells.where(is_mime: true).count).to eq num_mimes
    end
  end

  context 'when board height is zero' do
    let(:board_height) { 0 }

    it 'error will be raised' do
      expect { service }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Height must be greater than 0')
    end
  end

  context 'when board width is zero' do
    let(:board_width) { 0 }

    it 'error will be raised' do
      expect { service }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Width must be greater than 0')
    end
  end

  context 'when board width is zero' do
    let(:num_mimes) { -1 }

    it 'error will be raised' do
      expect { service }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Num mimes must be greater than or equal to 0')
    end
  end

  context 'when board name is blank' do
    let(:board_name) { '' }

    it 'error will be raised' do
      expect { service }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank")
    end
  end

  context 'when board name is blank' do
    let(:creator_email) { '' }

    it 'error will be raised' do
      expect { service }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Creator email can't be blank")
    end
  end
end