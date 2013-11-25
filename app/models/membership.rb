class Membership < ActiveRecord::Base
	
	belongs_to :organization
	belongs_to :thing
	
	include RankedModel
	ranks :row_order, :with_same => :thing_id

	def prefix
		parts = self.organization.name.split('.')
		(parts[0] == 'www') ? parts[1] : parts[0]
	end

end
