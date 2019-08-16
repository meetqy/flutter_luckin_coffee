### 
# @Author: meetqy
 # @since: 2019-08-16 16:23:37
 # @lastTime: 2019-08-16 17:08:20
 # @LastEditors: meetqy
 ###

# 蒲公英配置
_api_key=""
_uKey=""
# 相对于项目的路径
_android_dir="/build/app/outputs/apk/release/app-release.apk"

# ######### 脚本样式 #############
__LINE_BREAK_LEFT="\033[32;1m"
__LINE_BREAK_RIGHT="\033[0m"

# 打印信息
function printMessage() {
  pMessage=$1
  echo "${__LINE_BREAK_LEFT}${pMessage}${__LINE_BREAK_RIGHT}"
}


# 获取flutter路径
_flutter=`which flutter`

$_flutter build apk;

printMessage "打包成功 🚀 🚀 🚀"

printMessage "上传中..."

curl -F "file=@`pwd`$_android_dir" \
-F "uKey=$_uKey" \
-F "_api_key=$_api_key" \
"http://www.pgyer.com/apiv1/app/upload"

printMessage "\n上传成功 🚀 🚀 🚀"


