xcodebuild -scheme LocalHotReloading \
           -configuration Debug \
           -derivedDataPath ./DerivedData \
           -sdk iphonesimulator \
           -arch arm64 \
           -arch x86_64
           
xcodebuild -scheme LocalHotReloading \
           -configuration Debug \
           -derivedDataPath ./DerivedData \
           -sdk iphoneos \
           -arch arm64

BUILD_DIR="DerivedData/Build/Products"

OUTPUT_DIRS=("Source/LocalHotReloading.xcframework" "Source/SwiftTraceD.xcframework")

for OUTPUT_DIR in "${OUTPUT_DIRS[@]}"; do
    if [ -d "$OUTPUT_DIR" ]; then
        rm -rf "$OUTPUT_DIR"
    fi
done

INPUTFRAMEWORKS=("LocalHotReloading" "PackageFrameworks/SwiftTraceD")
OUTPUTFRAMEWORKS=("LocalHotReloading" "SwiftTraceD")

for i in "${!INPUTFRAMEWORKS[@]}"; do
    iphoneosFramework="$BUILD_DIR/Debug-iphoneos/${INPUTFRAMEWORKS[$i]}.framework"
    simulatorFramework="$BUILD_DIR/Debug-iphonesimulator/${INPUTFRAMEWORKS[$i]}.framework"
    if [ -d "$iphoneosFramework" ] && [ -d "$simulatorFramework" ]; then
        xcodebuild -create-xcframework \
                -framework "$iphoneosFramework" \
                -framework "$simulatorFramework" \
                -output "Source/${OUTPUTFRAMEWORKS[$i]}.xcframework"
    else
        echo "Error: One or both of the frameworks for ${INPUTFRAMEWORKS[$i]} do not exist."
        exit 1
    fi
done