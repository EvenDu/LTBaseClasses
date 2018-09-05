

Pod::Spec.new do |s|

  #

  s.name         = "LTBaseClasses"
  s.version      = "0.0.1"
  s.summary      = "LTBaseClass"
  s.description  = "iOS Project Base Classes For Objective-C"
  s.homepage     = "https://github.com/hongfenglt/LTBaseClasses"
  s.license      = "MIT"
  s.platform     = :ios, "8.0"
  s.author             = { "洪峰" => "hongfengkt@gmail.com" }
  s.source       = { :git => "https://github.com/hongfenglt/LTBaseClasses.git", :tag => "#{s.version}" }
  s.source_files = 'LTBaseClasses/', 'LTBaseClasses/**/*.{h,m}'
  s.resources    = "LTBaseClasses/Source/LTBaseClasses.bundle"

  s.dependency "LTCategories"
  s.dependency "YYCategories"
  s.dependency "IQKeyboardManager"
  s.dependency "Reachability"


  s.subspec 'BaseControllers' do |ss|
       ss.source_files = 'PodName/ViewController/*.{h,m}'
       ss.dependency 'LTBaseClasses/BaseViews'
  end

  s.subspec 'BaseViews' do |ss|
       ss.source_files = 'LTBaseClasses/View/*.{h,m}'
  end


  s.subspec 'BaseModels' do |ss|
    ss.resource = 'LTBaseClasses/BaseModels/*.{h,m}'
  end

  s.subspec 'Helper' do |ss|
    ss.resource = 'LTBaseClasses/Helper/*.{h,m}'
  end

  s.subspec 'LTResources' do |ss|
    ss.resource = 'LTBaseClasses/LTResources/*.bundle'
  end

end
