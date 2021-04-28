json.meta do
	paginate_meta(json, @data)
end
json.data @data do |data|
	
	json.(data, :id, :content, :like_count, :created_at)
	
	
	
	user(json, data.user)
	likes?(json, data)
	
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