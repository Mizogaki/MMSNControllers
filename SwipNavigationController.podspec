
Pod::Spec.new do |s|

  s.name         = "SwipNavigationController"
  s.version      = "0.0.1"
  s.summary      = "https://github.com/MMasahito/SwipNavigationController"
  s.homepage     = "https://github.com/MMasahito"
  s.license      = "MIT"
  s.author       = { "MMizogaki" => "voice.hito@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/MMasahito/SwipNavigationController.git", :commit => "74522916897976e4775ce47cb9ac416e976683f8", :tag => "#{s.version}" }
  s.source_files = 'Classes/SwipeNavigationControllers.{h,m}'
  s.requires_arc = true

end

