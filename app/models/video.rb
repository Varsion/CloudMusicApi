class Video < ApplicationRecord
  belongs_to :user

  # 验证（约束）
  # 标题：不能为空，长度1~15。
  validates :title, presence: true, length: {minimum: 1,maximum: 15 }

  # 视频地址不能为空
  # 真是项目中，如果需要清晰度，加密，转码等功能
  # 一般会选用第三方视频服务
  validates :uri, presence: true

  # 视频封面不能为空
  validates :banner, presence: true
end
