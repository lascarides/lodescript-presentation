class Thing < ActiveRecord::Base

	has_many :pieces, :order => 'memberships.row_order, pieces.position', :include => :membership, :dependent => :destroy
	has_many :equivalents, :order => 'position'
	has_many :schemes, :order => 'position'
	has_many :memberships, :order => 'memberships.row_order', :dependent => :destroy
	has_many :organizations, :through => :memberships

	def bibliography(mem)
		self.pieces.group_by(&:predicate).collect do |pred, pieces| 
			if pieces.first.membership == mem
				if pieces.first.predicate == pieces.first.original_predicate
					pieces.first.predicate
				else
					"#{pieces.first.predicate} (as #{pieces.first.original_predicate})"
				end
			end
		end.compact.join(', ')
	end

end
