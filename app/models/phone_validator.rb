=begin
	自定义数据验证器 尝试按目录放置
	目前该文件在 app/models 下
=end
class PhoneValidator < ActiveModel::Validator
	# 自定义验证器
	def validate record
		if record.phone
			unless record.phone =~ /^[1](([3][0-9])|([4][5,7,9])|([5][4,6,9])|([6][6])|([7][3,5,6,7,8])|([8][0-9])|([9][8,9]))[0-9]{8}$/i
				record.errors[:phone] << 'is not an phone'
			end
		else
			record.errors[:phone] << "can't be blank"
		end
	end
end