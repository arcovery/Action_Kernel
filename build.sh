echo "===================Setup Export========================="
export ARCH=arm64
export CROSS_COMPILE=$GITHUB_WORKSPACE/kernel/tool/aarch/bin/aarch64-linux-android-
export CROSS_COMPILE_ARM32=$GITHUB_WORKSPACE/kernel/tool/arm/bin/arm-linux-androideabi-

echo "=========================Clean========================="
rm -rf $KERNEL_PATH/out/ *.zip
git submodule init
git submodule update
make mrproper && git reset --hard HEAD

echo "=========================make========================="
make O=out raphael_defconfig
make O=out
