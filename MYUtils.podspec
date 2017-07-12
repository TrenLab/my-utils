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
    :git => 'https://github.com/damonthecricket/my-utils.git',
    :tag => spec.version
  }
  spec.pod_target_xcconfig = {
        'SWIFT_VERSION' => '3.0'
  }
  spec.source_files = 'Source/*.{h,swift}'
  spec.subspec 'UI' do |ui|
    ui.subspec 'Classes' do |classes|
     classes.subspec 'StoryboardSegue' do |storyboard_segue|
       storyboard_segue.source_files = 'Source/UI/Classes/StoryboardSegue/*.{h,swift}'
       storyboard_segue.dependency 'MYUtils/UI/Extensions/ViewController'
     end
    end

   ui.subspec 'Extensions' do |ext|
     ext.subspec 'CoreGraphics' do |core_graphics|
       core_graphics.source_files = 'Source/UI/Extensions/CoreGraphics/*.{h,swift}'
       core_graphics.dependency 'MYUtils/Foundation/Extensions'
     end

     ext.subspec 'Image' do |image| 
       image.source_files = 'Source/UI/Extensions/Image/*.{h,swift}'
       image.dependency 'MYUtils/Foundation/Classes'
     end

     ext.subspec 'View' do |view|
       view.source_files = 'Source/UI/Extensions/View/*.{h,swift}'
     end

     ext.subspec 'ViewController' do |view_cotroller|
       view_cotroller.source_files = 'Source/UI/Extensions/ViewController/*.{h,swift}'
     end
   end
 end

 spec.subspec 'Foundation' do |foundation|
   foundation.subspec 'Classes' do |classes|
     classes.source_files = 'Source/Foundation/Classes/*.{h,swift}'
     classes.dependency 'MYUtils/Foundation/Extensions'
   end

   foundation.subspec 'Extensions' do |extensions|
     extensions.source_files = 'Source/Foundation/Extensions/*.{h,swift}'
   end
 end
end