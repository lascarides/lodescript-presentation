class Piece < ActiveRecord::Base

	has_ancestry
	belongs_to :thing
	belongs_to :membership

	def content_output
		if self.content =~ /^http.*jpe?g$/
			'<img src="' + self.content + '" alt="">'
		elsif self.content =~ /^http/
			'<a href="' + self.content + '">' + self.content + '</a>'
		else
			self.content
		end
	end

	def organization 
		self.membership.organization
	end

end
