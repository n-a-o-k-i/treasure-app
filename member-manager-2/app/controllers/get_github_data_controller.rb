class GetGithubDataController < ApplicationController
	def index
    @test = "test"
    respond_to do |format|
      format.html
      format.json {render json: {test: @test}}
    end
	end
end
