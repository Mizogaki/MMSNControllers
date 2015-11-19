
Pod::Spec.new do |s|

  s.name         = "SwipNavigationController"
  s.version      = "1.0.0"
  s.summary      = "https://github.com/MMasahito/SwipNavigationController"
  s.homepage     = "https://github.com/MMasahito"
  s.license      = "MIT"
    s.author     = "MMizogaki"
  s.author       = { "MMizogaki" => "voice.hito@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/MMasahito/SwipNavigationController.git", :commit => "0402bd7b7596e73b40b30d1414b32860c5896571", :tag => "#{s.version}" }
  s.source_files = 'Classes/SwipeNavigationControllers.{h,m}'
  s.requires_arc = true
end

