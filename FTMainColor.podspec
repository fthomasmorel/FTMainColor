Pod::Spec.new do |s|
  s.name         = "FTMainColor"
  s.version      = "0.0.1"
  s.summary      = "Usefull pod designed in Swift to get the main color from an UIImage"

  s.license      = { :type => 'MIT' }
  s.author       = "fthomasmorel"

  s.homepage     = 'https://github.com/fthomasmorel/FTMainColor'

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/fthomasmorel/FTMainColor.git", :tag => "v0.0.1" }

  s.source_files  = "FTMainColor/*"
  s.framework        = 'UIKit'
  s.requires_arc     = true

end
