Pod::Spec.new do |s|
  s.name             = 'MusicControls'
  s.version          = '0.1.0'
  s.summary          = 'A wrapper to control Music app.'
 
  s.description      = <<-DESC
A wrapper to control Music app on macOS 10.15 and newer.
                       DESC
 
  s.homepage         = 'https://github.com/Minh-Ton/MusicControls'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MinhTon' => 'ford.tonthat@icloud.com' }
  s.source           = { :git => 'https://github.com/Minh-Ton/MusicControls.git', :tag => s.version.to_s }
 
  s.osx.deployment_target = '10.12'
  s.source_files = 'MusicControls/*.swift'
  s.swift_version = '4.0'
 
end