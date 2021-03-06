#!/bin/bash
set -ex

BUNDLE_IDENTIFIER=com.folio-sec.folio-app
BUILD_VARIANTS_PROJECT=_BuildVariants-Project.xcconfig
BUILD_VARIANTS_APP=_BuildVariants-Folio.xcconfig

cat << EOT > "${SRCROOT}/Configurations/${BUILD_VARIANTS_PROJECT}"
CONTAINING_APP_BUNDLE_IDENTIFIER = ${BUNDLE_IDENTIFIER}
GOOGLESERVICE_INFO_PLIST_DIR = ${PROJECT_DIR}/${TARGET_NAME}/FirebaseOptions/Release

API_HOST = ${API_HOST}
WEB_HOST = ${WEB_HOST}
EOT

cat << 'EOT' >> "${SRCROOT}/Configurations/${BUILD_VARIANTS_PROJECT}"
API_BASE_PATH = https:$()/$()/$(API_HOST)
WEB_BASE_PATH = https:$()/$()/$(WEB_HOST)
EOT

cat << EOT > "${SRCROOT}/Configurations/${BUILD_VARIANTS_APP}"
PRODUCT_BUNDLE_IDENTIFIER = ${BUNDLE_IDENTIFIER}
ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon
EOT
