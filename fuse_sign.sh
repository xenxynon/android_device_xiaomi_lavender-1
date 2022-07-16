make target-files-package otatools

sign_target_files_apks -o -d certs \
    $OUT/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip \
    signed-target_files.zip


ota_from_target_files \
signed-target_files.zip \
fusionOS-lavender-signed.zip

mv fusionOS-lavender-signed.zip $OUT
