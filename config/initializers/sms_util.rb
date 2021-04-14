module SMSUtil
	def self.sendSMS phone, code
		param = { "code" => code }.to_json
		response = Aliyun.send(phone, ALIYUN_VERIFY_CODE, param, nil)
		
		if response.success?
			result_string = response.body
			result = JSON.parse(result_string)
			if result["Code"] == "OK"
				true
			else
				false
			end
		end
	end
end