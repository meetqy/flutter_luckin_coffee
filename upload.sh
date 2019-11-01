### 
# @Author: meetqy
# @since: 2019-08-16 16:23:37
 # @lastTime: 2019-10-26 10:02:35
 # @LastEditors: meetqy
###

# 蒲公英配置
_api_key=""
_uKey=""
# 相对于项目的路径
_android_dir="/build/app/outputs/apk/release/app-arm64-v8a-release.apk"

# ######### 脚本样式 #############
__LINE_BREAK_LEFT="\033[32;1m"
__LINE_BREAK_RIGHT="\033[0m"

__LINE_RED_LEFT="\033[31m"
__LINE_RED_RIGHT="\033[0m"

# 打印信息
function printMessage() {
  pMessage=$1
  echo "${__LINE_BREAK_LEFT}${pMessage}${__LINE_BREAK_RIGHT}"
}

function errorMessage() {
  pMessage=$1
  echo "${__LINE_RED_LEFT}${pMessage}${__LINE_RED_RIGHT}"
}




# 获取flutter路径
_flutter=`which flutter`

$_flutter clean;

if [ $? -ne 0 ]; then
  errorMessage 'clean失败'
  exit;
else
  printMessage "\nclean成功,开始打包..."
fi

$_flutter build apk --split-per-abi;

if [ $? -ne 0 ]; then
  errorMessage '\n打包失败'
  exit;
else
  printMessage "\n打包成功,开始上传... 🚀 🚀 🚀"
fi

printMessage "上传中..."

curl -F "file=@`pwd`$_android_dir" \
-F "uKey=$_uKey" \
-F "_api_key=$_api_key" \
"http://www.pgyer.com/apiv1/app/upload"

if [ $? -ne 0 ]; then
  errorMessage "\n上传失败"
  exit;
else
  printMessage "\n上传成功 🚀 🚀 🚀"
fi




