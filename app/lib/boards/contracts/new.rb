module Boards
  module Contracts
    class New <  Dry::Validation::Contract
      params do
        required(:width).value(:integer)
        required(:height).value(:integer)
        required(:num_mimes).value(:integer)
        required(:name).filled(:string)
        required(:creator_email).filled(:string)
      end

      rule(:width) do
        key.failure('must be greater than zero') if value <= 0
      end

      rule(:height) do
        key.failure('must be greater than zero') if value <= 0
      end

      rule(:num_mimes) do
        key.failure('must be greater than or equal to zero') if value < 0
      end

      rule(:num_mimes, :width,  :height) do
        available_num_mimes = values[:width] * values[:height]
        key.failure("must be less than or equal to #{available_num_mimes}") if values[:num_mimes] > available_num_mimes
      end
    end
  end
end
