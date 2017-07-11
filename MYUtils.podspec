Pod::Spec.new do |spec|
  spec.name     = 'MYUtils'
  spec.version  = '1.0.0'
  spec.summary  = 'Simple Swift framework, that extends strandatd Apple frameworks.'
  spec.homepage = 'https://github.com/damonthecricket/my-utils'
  spec.license  = { 
     type: 'MIT', file: 'LICENSE' 
  }
  spec.authors = { 
    'Damon Cricket' => 'damon.the.cricket@gmail.com' 
  }
  spec.social_media_url = 'https://www.facebook.com/damonthecricket/'

  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.10'
  spec.watchos.deployment_target = '2.0'
  spec.tvos.deployment_target = '9.0'

  spec.requires_arc = true
  spec.source = { 
    :git => 'https://github.com/damonthecricket/my-json.git',
    :tag => spec.version
  }
  spec.pod_target_xcconfig = {
        'SWIFT_VERSION' => '3.0'
  }

  spec.ios.frameworks  = 'UIKit'
  spec.tvos.frameworks = 'UIKit'
  spec.osx.frameworks  = 'Cocoa'

  spec.source_files = [
    'Source/*.{h,m,swift}',
    'Source/UI/Classes/StoryboardSegue/*.{h,m,swift}',
    'Source/UI/Extensions/CoreGraphics/*.{h,m,swift}',
    'Source/UI/Extensions/Image/*.{h,m,swift}',
    'Source/UI/Extensions/View/*.{h,m,swift}',
    'Source/UI/Extensions/ViewController/*.{h,m,swift}',
    'Source/Foundation/Classes/*.{h,m,swift}',
    'Source/Foundation/Extensions/*.{h,m,swift}'
  ]

#  spec.subspec 'UI' do |ui|
    #ui.subspec 'Classes' do |classes|
    #  classes.subspec 'StoryboardSegue' do |storyboard_segue|

    #    storyboard_segue.ios.deployment_target  = '8.0'
    #    storyboard_segue.osx.deployment_target  = '10.10'
    #    storyboard_segue.osx.exclude_files      = 'Source/UI/Classes/StoryboardSegue/PopStoryboardSegue.{h, swift}'
    #    storyboard_segue.tvos.deployment_target = '9.0'

    #    storyboard_segue.dependency 'MYUtils/UI/Extensions/ViewController'
    #    storyboard_segue.dependency 'Source/UI/Classes/StoryboardSegue/StoryboardSegueTypes.{h,swift}'

    #    #'Source/UI/Classes/StoryboardSegue/StoryboardSegueTypes.{h,swift}',
    #    storyboard_segue.source_files = 'Source/UI/Classes/StoryboardSegue/*.{h,swift}'
    #  end
    #end

#    ui.subspec 'Extensions' do |ext|
#      ext.subspec 'CoreGraphics' do |core_graphics|

#        spec.ios.deployment_target     = '8.0'
#        spec.osx.deployment_target     = '10.10'
#        spec.watchos.deployment_target = '2.0'
#        spec.tvos.deployment_target    = '9.0'
#
#        core_graphics.source_files = 'Source/UI/Extensions/CoreGraphics/*.{h,swift}'
#      end
#
#      ext.subspec 'Image' do |image| 
#        spec.ios.deployment_target     = '8.0'
#        spec.osx.deployment_target     = '10.10'
#        spec.watchos.deployment_target = '2.0'
#        spec.tvos.deployment_target    = '9.0'
#
#        image.source_files = 'Source/UI/Extensions/Image/*.{h,swift}'
#      end
#
#      ext.subspec 'View' do |view|
#        spec.ios.deployment_target = '8.0'
#        spec.osx.deployment_target = '10.10'
#        spec.watchos.deployment_target = '2.0'
#        spec.tvos.deployment_target = '9.0'
#
#        view.source_files = 'Source/UI/Extensions/View/*.{h,swift}'
#      end

#      ext.subspec 'ViewController' do |view_cotroller|
#        view_cotroller.source_files = 'Source/UI/Extensions/ViewController/*.swift'
#
#        view_cotroller.osx.exclude_files     = 'ActivityViewController+Extensions.swift', 'Alert+Extensions.swift', 'NavigationController+Extensions.swift'
#        view_cotroller.watchos.exclude_files = 'ViewControllerTypes.swift', 'ActivityViewController+Extensions.swift', 'Alert+Extensions.swift', 'NavigationController+Extensions.swift', 'ViewController+Extensions.swift'
#        view_cotroller.tvos.exclude_files    = 'ActivityViewController+Extensions.swift'
#
#        view_cotroller.ios.frameworks  = 'UIKit'
#        view_cotroller.tvos.frameworks = 'UIKit'
#        view_cotroller.osx.frameworks  = 'Cocoa'
#      end
#    end
#  end

#  spec.subspec 'Foundation' do |foundation|
#    foundation.subspec 'Classes' do |classes|
#      classes.source_files = 'Source/Foundation/Classes/*.{h,swift}'
#      classes.dependency 'MYUtils/Foundation/Extensions'
#    end
#
#    foundation.subspec 'Extensions' do |extensions|
#      extensions.source_files = 'Source/Foundation/Extensions/*.{h,swift}'
#    end
#  end
end