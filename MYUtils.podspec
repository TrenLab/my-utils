Pod::Spec.new do |spec|
  spec.name = "MYUtils"
  spec.version = "1.0.0"
  spec.summary = "Simple Swift framework, that extends strandatd Apple frameworks."
  spec.homepage = "https://github.com/damonthecricket/my-utils"
  spec.license = { 
     type: 'MIT', file: 'LICENSE' 
  }
  spec.authors = { 
    "Damon Cricket" => 'damon.the.cricket@gmail.com' 
  }
  spec.social_media_url = "https://www.facebook.com/damonthecricket/"

  spec.ios.deployment_target = "8.0"
  spec.osx.deployment_target = "10.10"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"

  spec.requires_arc = true
  spec.source = { 
    :git => "https://github.com/damonthecricket/my-json.git",
    :tag => spec.version,
  }
  spec.source_files = "Source/*.{h,swift}"
  spec.pod_target_xcconfig = {
        'SWIFT_VERSION' => '3.0',
  }
end