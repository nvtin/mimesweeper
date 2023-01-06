# require 'rails_helper'

RSpec.shared_examples 'expect raise error' do
  it "saving a new object will raise RecordInvalid error" do
    expect {invalid_object.save!}.to raise_error(ActiveRecord::RecordInvalid, message)
  end
end