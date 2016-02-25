class CGroupsController < ApplicationController
	def index
		@groups = MGroup.all
	end
end
