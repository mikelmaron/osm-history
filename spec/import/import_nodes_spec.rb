require 'spec_helper'


describe OSMPBF do

	#Open the PBF file
	before :each do
		@conn = OSMPBF.new
		@conn.open_parser("./spec/import/test_files/terre-haute.osm.pbf")
	end

	it "Can open and read stats on a PBF file" do
		puts @conn.file_stats
	end

	it "Can create node objects from the PBF" do
		@conn.parse_to_collection(object_type="nodes", lim=1000)
	end

end