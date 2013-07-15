MRuby::Build.new do |conf|
  # load specific toolchain settings
  toolchain :gcc
  
  conf.bins = %w(mrbc)
  # include the default GEMs
  conf.gembox 'simple'
end

MRuby::CrossBuild.new('android-armeabi') do |conf|
  toolchain :androideabi
  
  conf.cc.defines = %w(ANDROID)
  conf.bins = []
  conf.gembox 'simple'
end
