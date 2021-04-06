class MonitorsController < ApplicationController
	# 获取当前版本
	def version
		version = {
			"code" => 100,
			"name" => "1.0.0"
		}
		render json: version
    end
end
