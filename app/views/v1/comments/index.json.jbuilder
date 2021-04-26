json.data @data do |data|
	json.(data, :id, :content, :like_count, :created_at)
	
	user(json, data.user)
	
	if data.video
		json.video do
			json.(data.video, :id, :title)
		end
	end
	if data.sheet
		json.video do
			json.(data.video, :id, :title)
		end
	end
	if data.song
		json.video do
			json.(data.video, :id, :title)
		end
	end

end