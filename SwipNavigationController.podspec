
Pod::Spec.new do |s|

  s.name         = "SwipNavigationController"
  s.version      = "0.0.1"
  s.summary      = "https://github.com/MMasahito/SwipNavigationController"
  s.homepage     = "https://github.com/MMasahito"
  s.license      = "MIT"
  s.author       = { "MMasahito" => "voice.hito@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/MMasahito/SwipNavigationController.git", :commit => "38c547f38ad6a9abe98de0bbfb5d1817b796249f", :tag => "#{s.version}" }
  s.source_files = 'Classes/SwipeNavigationControllers.{h,m}'
  s.frameworks   = 'QuartzCore'
  s.requires_arc = true
end

