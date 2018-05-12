Pod::Spec.new do |spec|

  spec.name         = 'SimpleDevice'
  spec.version      = '1.0'
  spec.license      = { :type => 'Apache License 2.0' }
  spec.homepage     = 'https://github.com/anotheren/SimpleDevice'
  spec.author       = { 'liudong' => 'liudong.edward@gmail.com' }
  spec.summary      = 'A simple UIDevice extension for easy use'
  spec.source       = { :git => 'https://github.com/anotheren/SimpleDevice.git',
                        :tag => spec.version }
  spec.swift_version = '4.1'

  spec.ios.deployment_target     = '11.0'

  spec.source_files = "Sources/**/*.swift"

end
