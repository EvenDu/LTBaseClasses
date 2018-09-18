

Pod::Spec.new do |s|

  #
  s.name         = "LTBaseClasses"
  s.version      = "0.0.2"
  s.summary      = "LTBaseClass"
  s.description  = "iOS Project Base Classes For Objective-C"
  s.homepage     = "https://github.com/hongfenglt/LTBaseClasses"
  s.license      = "MIT"
  s.platform     = :ios, "8.0"
  s.author             = { "洪峰" => "hongfengkt@gmail.com" }
  s.source       = { :git => "https://github.com/hongfenglt/LTBaseClasses.git", :tag => "#{s.version}" }
  # s.source_files = 'LTBaseClasses/', 'LTBaseClasses/*.h'

  s.dependency "LTCategories"
  s.dependency "YYCategories"
  s.dependency "IQKeyboardManager"
  s.dependency "Reachability"


  s.subspec 'BaseControllers' do |ss|
       ss.source_files = 'LTBaseClasses/BaseControllers/*.{h,m}'
       ss.public_header_files = 'LTBaseClasses/BaseControllers/*.h'
  end

  s.subspec 'BaseViews' do |ss|
       ss.source_files = 'LTBaseClasses/BaseViews/*.{h,m}'
       ss.public_header_files = 'LTBaseClasses/BaseViews/*.h'
  end


  s.subspec 'BaseModels' do |ss|
       ss.source_files = 'LTBaseClasses/BaseModels/*.{h,m}'
       ss.public_header_files = 'LTBaseClasses/BaseModels/*.h'
  end

  s.subspec 'Helper' do |ss|
    ss.source_files = 'LTBaseClasses/Helper/*.{h,m}'
    ss.public_header_files = 'LTBaseClasses/Helper/*.h'
  end

  s.subspec 'LTResources' do |ss|
    ss.resource = 'LTBaseClasses/LTResources/*.bundle'
  end

end
