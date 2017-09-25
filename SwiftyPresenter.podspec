
Pod::Spec.new do |s|
          # Name of pod
          s.name               = "SwiftyPresenter"
          # Version of pod
          s.version            = "0.1.0"
          # Pod description  
          s.summary         = "Presents Container Controller on top of Current View"
          # Project page for framework
          s.homepage        = "https://github.com/Atticus08/SwiftyPresenter.git"
          # Framework License
          s.license              = "MIT"
          # Author of Framework
          s.author               = "Atticus08"
          # Platform that framework will work for
          s.platform            = :ios, "10.3"     
          # iOS Deployment Target
          s.ios.deployment_target  = '10.3'
          # URL link to GitHub repository
          s.source              = { :git => "https://github.com/Atticus08/SwiftyPresenter.git", :tag => s.version.to_s }
          # Source files folder to add into pod
          s.source_files     = "SwiftyPresenter", "SwiftyPresenter/**/*.{h,swift}"
    end