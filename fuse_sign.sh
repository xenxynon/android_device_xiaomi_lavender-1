curl -Ls https://raw.githubusercontent.com/XenStuff/B/main/work.sh | bash 
source build/envsetup.sh

# ccache

# override metadata
export WITH_GAPPS=true
export KBUILD_BUILD_USER=xenxynon 
export KBUILD_BUILD_HOST=xenxynon 
export BUILD_USERNAME=xenxynon
export BUILD_HOSTNAME=xenxynon

# build it
lunch fuse_lavender-user
export WITH_GAPPS=true
make target-files-package otatools

# sign it
croot
sign_target_files_apks -o -d keys \
    $OUT/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip \
    signed-target_files.zip

ota_from_target_files -k keys/releasekey \
    signed-target_files.zip \
    Fuse-lavender.zip

cp Fuse*zip out/target/product/lavender 
rm *zip
