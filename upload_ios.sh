_api_key=""
_uKey=""
_dir="/app/"

# ######### 脚本样式 #############
__LINE_BREAK_LEFT="\033[32;1m"
__LINE_BREAK_RIGHT="\033[0m"

# 打印信息
function printMessage() {
  pMessage=$1
  echo "${__LINE_BREAK_LEFT}${pMessage}${__LINE_BREAK_RIGHT}"
}

flutter clean;

flutter build ios;

if [ -d build/ios/iphoneos/Runner.app ]
    then

    mkdir app/Payload

    cp -r build/ios/iphoneos/Runner.app app/Payload

    cd app
    filename=ios-$(date "+%Y%m%d%H%M").ipa
    _dir=$_dir$filename
    zip -r -m $filename Payload
    cd ..

    printMessage "打包成功😄"

    open app

else
    echo "遇到报错了😭, 打开Xcode查找错误原因"
    say "打包失败"
fi

curl -F "file=@`pwd`$_dir" \
-F "uKey=$_uKey" \
-F "_api_key=$_api_key" \
"http://www.pgyer.com/apiv1/app/upload"

printMessage "\n上传成功 🚀 🚀 🚀"