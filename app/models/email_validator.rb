class EmailValidator < ActiveModel::EachValidator
	# 记录， 属性名， 属性值 分别对应 模型实例， 要验证的属性， 其值
	def validate_each(record, attribute, value)
		if value
			unless value =~ /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/i
				record.errors[attribute] << (options[:message] || "is not an email")
			end
		else
			record.errors[attribute] << "can't be blank"
		end
	end
end