Pod::Spec.new do |s|
  s.name         = "RippleAnimation"
  s.version      = "0.2"
  s.summary      = "Inspired from Material Design Ripple Effects for iOS"
  s.description  = <<-DESC
                   - Easy way to use Ripple Effects is call `rippleAnimate` method for your UIView instances.
                   - `rippleAnimate` is UIView extension.
                   DESC

  s.homepage     = "https://github.com/mnat44/RippleAnimation"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Motoki Narita" => "m.nat44@gmail.com" }
  s.social_media_url   = "http://twitter.com/mo_to_44"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/mnat44/RippleAnimation.git", :tag => "0.2" }
  s.source_files  = "RippleAnimation/**/*.swift"
  s.requires_arc = true

end
