#
# Query Class: 
#
# 1. Handles DB Connection ?
# 2. Superclass Query handles bounding box & default setup, subclasses define specific queries
#

class Query
	require_relative 'DatabaseConnection'

	require 'mongo_mapper'

	attr_reader :analysis_window, :constraints, :database

	attr_accessor :selector

	def initialize(args)
		@analysis_window = args[:analysis_window]
		@constraints     = args[:constraints] || {}

		@selector = {}

		post_initialize(args)
	end

	def post_initialize(args)
		
		if analysis_window.bounding_box.active
			selector[:geometry] = {'$within' => analysis_window.bounding_box.mongo_format }
		end

		if analysis_window.time_frame.active
			selector[:created_at] = {'$gt' => analysis_window.time_frame.start,
									 '$lt' => analysis_window.time_frame.end}
		end
	end
end



#How could these be made smarter?
class Node_Query < Query
	def run
		Node.all( selector )
	end
end

class Changeset_Query < Query

	def run
		Changeset.all( selector )
	end
end

class Relation_Query < Query
	def run
		Relation.all( selector )
	end
end





class User_Query < Query

	def post_initialize(args)
		super(args)
		
		#Empty selector and reprepare...
		selector = {}

		if args[:user_ids]
			selector[:uid] = {'$in' => args[:user_ids]}
		end
	end

	def run
		User.all( selector )
	end
end





