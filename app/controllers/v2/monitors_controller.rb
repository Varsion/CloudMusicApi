class V2::MonitorsController < ApplicationController
	# 获取当前版本
	def version
		version = {
			"version" => {
				"name" => ENV['VERSION_NAME'],
				"code" => ENV['VERSION_CODE']
			}
		}
		render json: version
	end
end
