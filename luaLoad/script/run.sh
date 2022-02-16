#!/bin/
set -x
work_path=$(cd `dirname $0`; pwd)
rm -rf $work_path/../../luaLoad_temp
cp -r -f $work_path/../../luaLoad $work_path/../../luaLoad_temp
# echo $work_path
lc_work_path=$work_path/../../luaLoad_temp
lib_work_path=$work_path/../../luaLoadlib

$work_path/HYCodeScan.app/Contents/MacOS/HYCodeScan --redefine -i $lc_work_path/luaLoad/Classes/realprefix.pch -i $lc_work_path/luaLoad/Classes/ZipLoader.h -i $lib_work_path/prefix.pch
$work_path/HYCodeScan.app/Contents/MacOS/HYCodeScan --xcode --config $work_path/appConfig.json -p $lc_work_path/Example/Pods/Pods.xcodeproj

cp -rf $lc_work_path/luaLoad/Classes/ZipLoader.h $lc_work_path/Example/Pods/Headers/Public/luaLoad/

xcodebuild -workspace $lc_work_path/Example/luaLoad.xcworkspace -scheme luaLoad-Example -sdk iphonesimulator -configuration Release build -jobs 8
xcodebuild -workspace $lc_work_path/Example/luaLoad.xcworkspace -scheme luaLoad-Example -sdk iphoneos -configuration Release build -jobs 8


sh $lib_work_path/updateVersion.sh

productFolder="Example/Pods/Products/luaLoad"
for i in `ls $lc_work_path/$productFolder`; do
cp -rf $lc_work_path/$productFolder/$i $lib_work_path/luaLoad/
done

cp -rf $lc_work_path/luaLoad/Classes/ZipLoader.h $lib_work_path/luaLoad/

function comit()
{
	cd $lib_work_path
	git add -u && git commit -m 'autobuild' && git push origin master
}

comit
