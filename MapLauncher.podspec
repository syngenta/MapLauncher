Pod::Spec.new do |s|
  s.name             = 'MapLauncher'
  s.version          = '0.1.1'
  s.summary          = 'Swift library that helps to build a route with external navigation apps'
  s.description      = 'Swift library that helps to build a route with external navigation apps. For now, supporting: Apple Maps, Google Maps, Waze and Yandex.'
  s.homepage         = 'https://github.com/cropio/MapLauncher'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dmitriy Romanov' => 'dimkahr@gmail.com' }
  s.source           = { :git => 'https://github.com/cropio/MapLauncher.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.swift_version = '4.0'
  s.source_files = 'MapLauncher/Classes/*'
  s.frameworks = 'UIKit', 'CoreLocation'
end
