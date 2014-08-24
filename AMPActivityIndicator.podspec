Pod::Spec.new do |s|
  s.name             = "AMPActivityIndicator"
  s.version          = "0.1.1"
  s.summary          = "Customizable UIActivityIndicatorView"
  s.description      = <<-DESC
                       AMPActivityIndicator is a custom UIView subclass that mimics the UIActivityIndicatorView behaviour
                       DESC
  s.homepage         = "https://github.com/alexito4/AMPActivityIndicator"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Alejandro Martinez" => "alexito4@gmail.com" }
  s.source           = { :git => "https://github.com/alexito4/AMPActivityIndicator.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/alexito4'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  # s.resources = 'Pod/Assets/*.png'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'QuartzCore'
  # s.dependency 'AFNetworking', '~> 2.3'
end
