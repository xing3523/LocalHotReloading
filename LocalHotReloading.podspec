Pod::Spec.new do |s|
  s.name         = "LocalHotReloading"
  s.version      = "1.0.1"
  s.summary      = "HotReloading framework for pod install"
  s.description  = <<-DESC
  HotReloading framework for pod install, You can use this when you are not using SPM
  DESC
  s.homepage     = "https://github.com/xing3523/LocalHotReloading"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "xing" => "xinxof@foxmail.com" }
  s.platform     = :ios, '12.0'
  s.source       = { :git => "https://github.com/xing3523/LocalHotReloading.git", :tag => s.version.to_s }
  s.vendored_frameworks = [
    'LocalHotReloading/Source/LocalHotReloading.xcframework',
    'LocalHotReloading/Source/SwiftTraceD.xcframework'
  ]
end
