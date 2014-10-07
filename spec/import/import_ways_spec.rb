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

	it "Can create way objects from the PBF" do
		@conn.parse_to_collection(object_type="ways", lim=10)
	end

end