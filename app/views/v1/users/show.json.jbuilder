json.data do
	# 添加@user上面的后面这个几个字段
	json.(@user, :id,:nickname,:avatar,:description,:gender,:birthday,:phone,:email,:created_at,:updated_at)
end