class CgroupsController < ApplicationController
	def index
		@groups = Mgroup.all
	end
	def new
		@groups = Mgroup.new
	end
end
