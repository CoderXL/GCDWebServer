# http://guides.cocoapods.org/syntax/podspec.html
# Verify Podspec with:
#   sudo gem update cocoapods
#   pod spec lint GCDWebServer.podspec --verbose
# Add to source line:
#   :tag => s.version.to_s

Pod::Spec.new do |s|
  s.name     = 'GCDWebServer'
  s.version  = '2.3.1'
  s.author   =  { 'Pierre-Olivier Latour' => 'info@pol-online.net' }
  s.license  = { :type => 'BSD', :file => 'LICENSE' }
  s.homepage = 'https://github.com/swisspol/GCDWebServer'
  s.summary  = 'Lightweight GCD based HTTP server for OS X & iOS (includes web based uploader & WebDAV server)'
  
  s.source   = { :git => 'https://github.com/swisspol/GCDWebServer.git' }
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'
  s.requires_arc = true
  
  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |cs|
    cs.source_files = 'GCDWebServer/**/*.{h,m}'
    cs.requires_arc = true
    cs.ios.library = 'z'
    cs.ios.frameworks = 'MobileCoreServices', 'CFNetwork'
    cs.osx.library = 'z'
    cs.osx.framework = 'SystemConfiguration'
    cs.compiler_flags = '-DNDEBUG'  # TODO: Only set this for Release configuration
  end
  
  s.subspec 'WebDAV' do |cs|
    cs.dependency 'GCDWebServer/Core'
    cs.source_files = 'GCDWebDAVServer/*.{h,m}'
    cs.requires_arc = true
    cs.ios.library = 'xml2'
    cs.osx.library = 'xml2'
    cs.compiler_flags = '-I$(SDKROOT)/usr/include/libxml2'
  end
  
  s.subspec 'WebUploader' do |cs|
    cs.dependency 'GCDWebServer/Core'
    cs.source_files = 'GCDWebUploader/*.{h,m}'
    cs.requires_arc = true
    cs.resource = "GCDWebUploader/GCDWebUploader.bundle"
  end
  
end
