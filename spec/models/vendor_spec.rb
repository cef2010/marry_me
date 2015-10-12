require 'rails_helper'
RSpec.describe Vendor, type: :model do


  describe "tests model attributes" do
    it { should respond_to :name }
    it { should respond_to :description }
    it { should respond_to :type }
    it { should respond_to :address }
    it { should respond_to :website }
    it { should respond_to :phone }
  end

end
