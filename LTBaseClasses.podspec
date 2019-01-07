

Pod::Spec.new do |s|

  #
  s.name         = "LTBaseClasses"
  s.version      = "0.0.5"
  s.summary      = "LTBaseClass"
  s.description  = "iOS Project Base Classes For Objective-C"
  s.homepage     = "https://github.com/hongfenglt/LTBaseClasses"
  s.license      = "MIT"
  s.platform     = :ios, "8.0"
  s.author             = { "洪峰" => "hongfengkt@gmail.com" }
  s.source       = { :git => "https://github.com/hongfenglt/LTBaseClasses.git", :tag => "#{s.version}" }
  # s.source_files = 'LTBaseClasses/', 'LTBaseClasses/*/*.{h,m}'

  s.dependency "LTCategories"
  s.dependency "YYCategories"
  s.dependency "IQKeyboardManager"
  s.dependency "Reachability"


  s.subspec 'Helper' do |h|
    h.source_files = 'LTBaseClasses/Helper/**/*.{h,m}'
  end

  s.subspec 'BaseViews' do |v|
       v.source_files = 'LTBaseClasses/BaseViews/**/*.{h,m}'
       v.dependency "LTBaseClasses/Helper"
       v.dependency "LTBaseClasses/BaseModels"
  end

  s.subspec 'BaseControllers' do |c|
       c.source_files = 'LTBaseClasses/BaseControllers/**/*.{h,m}'
       c.dependency "LTBaseClasses/BaseViews"
       c.dependency "LTBaseClasses/Helper"
  end

  s.subspec 'BaseModels' do |m|
       m.source_files = 'LTBaseClasses/BaseModels/**/*.{h,m}'
  end

  s.subspec 'LTResources' do |ss|
    ss.resource = 'LTBaseClasses/LTResources/*.bundle'
  end

end
