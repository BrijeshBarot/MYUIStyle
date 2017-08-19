Pod::Spec.new do |s|
  s.name             = 'MYUIStyle'
  s.version          = '0.1.0'
  s.summary          = 'By far the most fantastic view I have seen in my entire life. No joke.'
 
  s.description      = <<-DESC
This fantastic view changes its color gradually makes your app look fantastic!
                       DESC
 
  s.homepage         = 'https://github.com/BrijeshBarot/MYUIStyle'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Brijesh' => 'brijesh.renuka1993@gmail.com' }
  s.source           = { :git => 'https://github.com/BrijeshBarot/MYUIStyle.git', :tag => s.version.to_s }

  s.source_files = 'MYUIStyle/*.swift'
   s.platform = :ios, '10.0'

  s.ios.deployment_target = '10.0'
  s.source_files = 'MYUIStyle/MYUIStyle.swift'
 
end