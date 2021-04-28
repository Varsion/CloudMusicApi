# 发送验证码
PLATFORM_EMAIL=0
PLATFORM_PHONE=10
PLATFORM_QQ=20
PLATFORM_WECHAT=30

#歌词类型
STYLE_LYRIC=0
STYLE_LYRIC_KSC=10
# Aliyun SMS模版编号
# 验证码
# 您的验证码为： ${code}
ALIYUN_VERIFY_CODE="SMS_215335203"
# 极光推送
# 客户端退出事件
# push_util
PUSH_STYLE_LOGOUT=0
# Global Error code and Error message
ERROR_ARGUMENT=30
ERROR_ARGUMENT_MESSAGE="Parameter error!"

ERROR_TOO_FAST=50
ERROR_TOO_FAST_MESSAGE="Interface calls are too frequent!"

ERROR_PARAMS_ENCRYPT=60
ERROR_PARAMS_ENCRYPT_MESSAGE="Incorrect parameter encryption！"

ERROR_PARAMS_SIGN=70
ERROR_PARAMS_SIGN_MESSAGE="Incorrect parameter signature！"

ERROR_UNAUTHORIZED=401
ERROR_UNAUTHORIZED_MESSAGE="Please login first!"

ERROR_USER_EXIST=1000
ERROR_USER_EXIST_MESSAGE="This email or phone is existed!"

ERROR_USER_NOT_EXIST=1010
ERROR_USER_NOT_EXIST_MESSAGE="This User not exist!"

ERROR_LOGIN=1020
ERROR_LOGIN_MESSAGE="Login failed！"

ERROR_USERNAME_OR_PASSWORD=1030
ERROR_USERNAME_OR_PASSWORD_MESSAGE="Username or password error!"

ERROR_EMPTY_EMAIL_OR_PASSWORD=1040
ERROR_EMPTY_EMAIL_OR_PASSWORD_MESSAGE="Username or password cannot be empty!"

ERROR_ACCOUNT_BOUND=1050
ERROR_ACCOUNT_BOUND_MESSAGE="The account has been bound"

ERROR_SAVE_SESSION=1060
ERROR_SAVE_SESSION_MESSAGE="Login failed!"

ERROR_EMAIL_SEND=1070
ERROR_EMAIL_SEND_MESSAGE="Failed to send mail!"

ERROR_EMAIL_ALREADY_CONFIRM=1070
ERROR_EMAIL_ALREADY_CONFIRM_MESSAGE="The email has been verified, please do not verify again!"

ERROR_CODE=1080
ERROR_CODE_MESSAGE="Verification code error!"

ERROR_EXPIRED_CODE=1090
ERROR_EXPIRED_CODE_MESSAGE="Verification code expired!"

ERROR_USE_LAST_PASSWORD=1100
ERROR_USE_LAST_PASSWORD_MESSAGE="Password cannot be the same as last time!"

ERROR_SEND_SMS=1110
ERROR_SEND_SMS_MESSAGE="Message failed to send!"

ERROR_SEND_WECHAT=1120
ERROR_SEND_WECHAT_MESSAGE="WeChat verification code failed to be sent!"

ERROR_NOT_BIND_WECHAT=1130
ERROR_NOT_BIND_WECHAT_MESSAGE="Please bind WeChat first!"

ERROR_ORDER_STATUS=1140
ERROR_ORDER_STATUS_MESSAGE="Order status is wrong!"

ERROR_ORDER_PAY_CHANNEL=1150
ERROR_ORDER_PAY_CHANNEL_MESSAGE="Wrong payment channel!"

# 评论排序
COMMENT_HOT="10"