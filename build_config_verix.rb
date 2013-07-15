MRuby::Build.new do |conf|
  # load specific toolchain settings
  toolchain :vs2012
  
  conf.bins = %w(mrbc)
  # include the default GEMs
  conf.gembox 'simple'
end

MRuby::CrossBuild.new('verix') do |conf|
  toolchain :verix
  
  conf.cc.defines = %w(VERIX)
  conf.bins = []
  conf.gembox 'simple'
end
