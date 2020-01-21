Pod::Spec.new do |spec|

  spec.name         = "AnyReusableCell"
  spec.version      = "1.0.1"
  spec.summary      = "Some reuse extension for UITableView/UICollectionView"
  
  spec.homepage     = "https://github.com/anotheren/AnyReusableCell"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "anotheren" => "liudong.edward@gmail.com" }
  
  spec.ios.deployment_target = '8.0'
  spec.swift_versions = ['5.0', '5.1']
  
  spec.source       = { :git => "https://github.com/anotheren/AnyReusableCell.git", :tag => "#{spec.version}" }
  spec.source_files = 'Sources/**/*.{h,swift}'
  
end
