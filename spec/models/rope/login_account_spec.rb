require "spec_helper"

module Rope 
  describe LoginAccount do 
    it { should be_embedded_in(:user) }
  end
end
