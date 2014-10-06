#
# Query Class: 
#
# 1. Handles DB Connection ?
# 2. Superclass Query handles bounding box & default setup, subclasses define specific queries
#

class Query
	require_relative 'DatabaseConnection'
	require_relative 'AnalysisWindow'
	require_relative 'Buckets'

	attr_reader :analysis_window, :constraints, :database

	attr_accessor :selector

	def initialize(args)
		@analysis_window = args[:analysis_window]
		@constraints     = args[:constraints] || {}

		@selector = {}

		query_items = []

		post_initialize(args)
	end

	def post_initialize(args)
		@database = DatabaseConnection.new(country: "haiti").database

		if analysis_window.bounding_box.active
			selector[:geometry] = {'$within' => analysis_window.bounding_box.mongo_format }
		end

		if analysis_window.time_frame.active
			selector[:created_at] = {'$gt' => analysis_window.time_frame.start,
									 '$lt' => analysis_window.time_frame.end}
		end
	end

end

class Node_Query < Query

	def post_initialize(args)
		super(args)

		delete selector[:created_at]

		if analysis_window.time_frame.active
			selector[:date] = {'$gt' => analysis_window.time_frame.start,
									 '$lt' => analysis_window.time_frame.end}
		end
	end

	def run

		results = database["nodes"].find( selector, {:limit=> 10000000} )

		results.each do |node|
			query_items << Node.new(node) #When should it become a node object?
		end

		Nodes.new(items: query_items)
	end
end


class Changeset_Query < Query

	def initialize(args)
		super(args)
	end

	def run

		results = database["changesets"].find( selector, {:limit=> 10000000} )

		results.each do |changeset|
			query_items << Changeset.new(changeset) #When should it become a node object?
		end

		Changesets.new(items: query_items)
	end
end

class User_Query < Query

	def initialize(args)
		super(args)
	end

	def post_initialize(args)
		super(args)
		
		delete selector[:created_at]
		delete selector[:geometry]
		
		selector = {}
		if args[:user_ids]
			selector[:uid] = {'$in' => args[:user_ids]}
		end
	end

	def run
		results = database["users"].find( selector )

	
		results.each do |user|
			users << User.new(user) #When should it become a node object?
		end

		Users.new(items: query_items)
	end
end





