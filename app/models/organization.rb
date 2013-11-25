class Organization < ActiveRecord::Base

	has_many :memberships
	has_many :things, :through => 'memberships'

	def to_s 
		self.name
	end

	def color
		if name =~ /digital/
			"#fd9"
		elsif name =~ /teara/
			"#acf"
		elsif name =~ /ourheritage/
			"#6f6"
		else
			"#afc"
		end
	end

end
