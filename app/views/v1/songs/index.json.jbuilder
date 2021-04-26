json.data @data do |data|
	json.(data, :id,:title,:banner,:uri,:clicks_count,:comments_count,:style,:lyric,:created_at,:updated_at)
	
	# json.user do
	# 	json.(data.user, :id, :nickname, :avatar)
	# end
	user(json,data.user)
	json.singer do
		json.(data.singer, :id, :nickname, :avatar)
	end
end