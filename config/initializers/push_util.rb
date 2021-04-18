$jpush = JPush::Client.new(ENV["JPUSH_KEY"], ENV["JPUSH_SECRET"])
module PushUtil

	def self.send_logout(user_id)
		# 设置要推送的用户
		audience = JPush::Push::Audience.new
		
		# 这里是通过别名设置
		# 因为客户端在用户登录完成后
		# 会设置别名
		# 设置的是用户Id
		audience.set_alias(user_id)
		
		# 要推送的内容
		# 我们这里客户端只需要知道
		# 要被挤掉了
		# 所以添加一个style字段就行了
		# 如果客户端还需要知道，登录IP，登录设备
		# 可以在添加其他的字段，和客户端约定好就行了
		content={style:PUSH_STYLE_LOGOUT}
		
		# 创建一条推送
		push_payload = JPush::Push::PushPayload.new(
		  platform: 'all',
		  audience: audience
		).set_message(
		  content.to_json
		)
		
		# 开始推送
		response=$jpush.pusher.push(push_payload)
		
		# 可以这样进行结果判断
		# HTTP请求响应码
		# response.http_code
		
		# body是一个字典
		# 消息发送成功值为"0"
		# response.body["sendno"]
		
		# 消息Id，可以通过相关API查询状态
		# response.body["msg_id"]
	end
end