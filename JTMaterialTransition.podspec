Pod::Spec.new do |s|
  s.name         = "JTMaterialTransition"
  s.version      = "2.0.3"
  s.summary      = "An iOS transition for controllers based on material design."
  s.homepage     = "https://github.com/jonathantribouharet/JTMaterialTransition"
  s.license      = { :type => 'MIT' }
  s.author       = { "Jonathan VUKOVICH TRIBOUHARET" => "jonathan.tribouharet@gmail.com" }
  s.platform     = :ios, '8.0'
  s.source       = { :git => "https://github.com/jonathantribouharet/JTMaterialTransition.git", :tag => s.version.to_s }
  s.source_files  = 'JTMaterialTransition/*'
  s.requires_arc = true
  s.screenshots   = ["https://raw.githubusercontent.com/jonathantribouharet/JTMaterialTransition/master/Screens/example.gif"]
  s.swift_version = '4.2'
end
