require 'rails_helper'

RSpec.describe Couple, type: :model do
  describe 'model attributes' do
    it {should respond_to :description}
    it {should respond_to :player1}
    it {should respond_to :player2}
    it {should respond_to :wedding_date}
    it {should respond_to :budget}
    it {should respond_to :ceremony_location}
    it {should respond_to :reception_location}
  end
end
