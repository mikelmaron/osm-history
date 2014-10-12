# 
# Base Domain Object Classes.
# 
# There is no more inheritance here because they are instead MongoMapper objects

require 'mongo_mapper'

class Node
	include MongoMapper::Document

	#OSMObjects
	key :user_id, 	String
	key :user_name, String
	key :created_at,Time
	key :version, 	Integer
	key :tags,		Hash

	#Custom to Node
	key :node_id, 	String
	key :lat,		Float
	key :lon,		Float
	key :changeset, String
	key :geometry,	Hash

	def initialize(args)
		#OSMObject Items
		@user_id    = args[:uid].to_s
		@user_name  = args[:user]
		@created_at = args[:created_at]
		@tags       = args[:tags]
		@version    = args[:version]

		@node_id    = args[:id].to_s
		@lon 		= args[:lon]
		@lat 		= args[:lat]
		@changeset  = args[:changeset].to_s

		@geometry   = {type: "Point", coordinates: [lon,lat]}
	end
end





class Way
	include MongoMapper::Document

	#OSMObjects
	key :user_id, 	String
	key :user_name, String
	key :created_at,Time
	key :version, 	Integer
	key :tags,		Hash

	#Custom to Way
	key :way_id, 	String
	key :nodes, 	Array
	key :changeset, String

	def initialize(args)
		#OSMObject Items
		@user_id    = args[:uid].to_s
		@user_name  = args[:user]
		@created_at = args[:created_at]
		@tags       = args[:tags]
		@version    = args[:version]

		@way_id     = args[:id].to_s
		@nodes 		= args[:nodes].collect{|node| node.to_s}
		@changeset  = args[:changeset].to_s
	end
end

class Relation
	include MongoMapper::Document

	#OSMObjects
	key :user_id, 	String
	key :user_name, String
	key :created_at,Time
	key :version, 	Integer
	key :tags,		Hash

	#Custom to Relation
	key :relation_id,	String
	key :nodes,		Array
	key :ways, 		Array 
	key :changeset, String

	def initialize(args)
		#OSMObject Items
		@user_id    = args[:uid].to_s
		@user_name  = args[:user]
		@created_at = args[:created_at]
		@tags       = args[:tags]
		@version    = args[:version]

		@relation_id=args[:id].to_s
		@nodes = args[:members][:nodes].collect{|node| node.to_s}
		@ways  = args[:members][:ways].collect{|way| way[:id].to_s}
		@changeset  = args[:changeset].to_s
	end
end





class Changeset
	include MongoMapper::Document

	#OSMObjects
	key :user_id, 	String
	key :user_name, String
	key :created_at,Time
	key :version, 	Integer
	key :tags,		Hash

	#Custom to Changeset
	key :changeset_id,	String
	key :lower_left, Array
	key :upper_right,Array
	key :closed_at,	Date
	key :open,		Boolean
	key :comment,	String

	#Set aliases for lower left and upper right here too?

	def initialize(args)
		@comment    = args[:comment]
		@closed_at  = args[:closed_at]
		@open       = args[:open]
		@changeset_id = args[:id].to_s

		#OSMObject Items
		@user_id    = args[:user_id].to_s
		@user_name  = args[:user_name]
		@created_at = args[:created_at]
		@tags       = args[:tags]
	end

end

class User # => Do we inherit anything here? No... ?  #More to learn here, probably
	include MongoMapper::Document

	key :user_name, 	String
	key :user_id,		String
	key :join_date,		Time
	key :image_url,		String

	def initialize(args)
		@user_id   = args[:uid].to_s
		@user_name = args[:display_name]
		@join_date = args[:account_created]
		@user_image= args[:image_url]
	end

end

#TODO::
class Note # => Lots to learn here: Not sure what it will look like
	attr_reader :user_id, :user_name, :created_at

	def initialize(args)
		nil
	end
end
