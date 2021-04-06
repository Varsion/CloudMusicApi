class MonitorsController < ApplicationController
	# 获取当前版本
	def version
		version = {
			"name" => ENV["VERSION_NAME"],
			"code" => ENV["VERSION_CODE"]
		}
		render json: version
    end
end
