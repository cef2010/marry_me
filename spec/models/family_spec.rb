require 'rails_helper'

RSpec.describe Family, type: :model do
  describe 'model attributes' do
    it { should respond_to :name }
    it { should respond_to :description }
    it { should respond_to :contact }
    it { should respond_to :role }
    it { should respond_to :relation }
    it { should respond_to :couple_id }
    it { should belong_to :couple }
  end
end
