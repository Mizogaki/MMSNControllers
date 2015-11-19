
Pod::Spec.new do |s|

  s.name         = "SwipNavigationController"
  s.version      = "0.1.0"
  s.summary      = "https://github.com/MMasahito/SwipNavigationController"
  s.homepage     = "https://github.com/MMasahito"
  s.license      = "MIT"
  s.author       = { "MMasahito" => "voice.hito@gmail.com" }
  s.platform     = :ios,
  s.source       = { :git => "https://github.com/MMasahito/SwipNavigationController.git", :commit => "32f44b7fe193a613e3c9b8a132f86dd808bbd840", :tag => "#{s.version}" }
  s.source_files = 'Classes/SwipeNavigationControllers.{h,m}'
  s.requires_arc = true
end
