rm -rf ./build_prod/*

xcodebuild archive \
  -project SpeakIA.xcodeproj \
  -scheme SpeakIA \
  -archivePath ./build_prod/SpeakIA \
  -configuration release \
  -sdk iphoneos \
  SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES



xcodebuild -create-xcframework \
  -framework ./build_prod/SpeakIA.xcarchive/Products/Library/Frameworks/SpeakIA.framework \
  -output ./build_prod/SpeakIA.xcframework;
