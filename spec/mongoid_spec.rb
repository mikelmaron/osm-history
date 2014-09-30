require "spec_helper"

require_relative '../models/DomainObjects'


describe Nodes do

	before :each do
		Mongoid.load!("config/mongoid.yml")
	end

  	it "Can access the nodes collection" do 
  		puts Nodes.count
  	end
end