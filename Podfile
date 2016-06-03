# Uncomment this line to define a global platform for your project
# platform :ios, '8.0'
# Uncomment this line if you're using Swift
use_frameworks!

target 'Swimee_AdMob' do


pod 'Google-Mobile-Ads-SDK'


end

target 'Swimee_AdMobTests' do

end

target 'Swimee_AdMobUITests' do

end


post_install do | installer |
require 'fileutils'

#Pods-acknowledgements.plist下記の場所に移動（2015/10/15）
FileUtils.cp_r('Pods/Target Support Files/Pods-Swimee_AdMob/Pods-Swimee_AdMob-acknowledgements.plist', 'Swimee_AdMob/Settings.bundle/Acknowledgements.plist', :remove_destination => true)

end