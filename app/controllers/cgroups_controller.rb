class CgroupsController < ApplicationController
	def index
		@groups = Mgroup.all
	end
end
