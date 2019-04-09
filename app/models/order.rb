class Order < ApplicationRecord
  include AASM
  has_one :product

  aasm column: 'status' do
    state :confirmation, initial: true
    state :canceled, :sent, :received

    event :cancel do
      transitions from: :confirmation, to: :canceled
    end

    event :sending do
      transitions from: :confirmation, to: :sent
    end

    event :receive do
      transitions from: :sent, to: :received
    end
  end
end
