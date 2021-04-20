class V1::RelationsController < ApplicationController
	before_action :authenticate_user!
	# 只能向自己歌单添加歌曲
	def create
		# sheet_id 是url中的id
		relation = current_user.sheets.find(params[:sheet_id]).relations.build({ song_id: params[:id], user_id: current_user.id})
		
		if relation.save
			render_success(relation)
		else
			render_argument_error
		end
	end
	
	def destroy
		current_user.sheets.find(params[:sheet_id]).relations.find_by_song_id(params[:id]).destroy
	end
end
