MRuby::Toolchain.new(:verix) do |conf|
  ENV["ARMLMD_LICENSE_FILE"] = "C:\\Program Files\\ARM\\Licenses\\license_evo.dat"
  ENV["RVCTBIN"] = "C:\\Program Files\\ARM\\RVCT\\Programs\\4.0\\902\\win_32-pentium"
  ENV["RVCTDIR"] = "C:\\Program Files\\ARM\\RVCT\\Programs\\4.0\\902\\win_32-pentium"
  ENV["RVCT40BIN"] = "C:\\Program Files\\ARM\\RVCT\\Programs\\4.0\\902\\win_32-pentium"
  ENV["RVCT40INC"] = "C:\\Program Files\\ARM\\RVCT\\Data\\4.0\\902\\include\\windows"
  ENV["RVCT40LIB"] = "C:\\Program Files\\ARM\\RVCT\\Data\\4.0\\902\\lib"
  ENV["DTKTOOLS"] = "C:\\VerixVAps\\Tools"
  ENV["VACT2000"] = "C:\\VerixVAps\\ACT2000"
  ENV["VCARDSLOT"] = "C:\\VerixVAps\\Cardslot"
  ENV["VRXSDK"] = "C:\\VerixVAps\\VFSDK"
  ENV["VTCPIP"] = "C:\\VerixVAps\\TCPIP"
  ENV["VUCL"] = "C:\\VerixVAps\\UCL"
  ENV["VIPDL"] = "C:\\VerixVAps\\IPDownload"
  ENV["VVXEMVAP"] = "C:\\VerixVAps\\VXEMVAP"
  
  [conf.cc, conf.cxx, conf.objc, conf.asm].each do |cc|
    cc.command = ENV['CC'] || 'c:\\VerixVAps\\VFSDK\\bin\\vrxcc'
    cc.flags = [ENV['CFLAGS'] || []]
    cc.include_paths = ["#{MRUBY_ROOT}/include", "c:\\VerixVAps\\ACT2000\\include", "c:\\VerixVAps\\UCL\\include", "c:\\VerixVAps\\TCPIP\\include", "c:\\VerixVAps\\CardSlot\\include"]
    cc.defines = %w()
    cc.option_include_path = '-I%s'
    cc.option_define = '-D%s'
    cc.compile_options = '%{flags} -o %{outfile} -c %{infile}'
  end

  conf.linker do |linker|
    linker.command = ENV['LD'] || 'c:\\VerixVAps\\VFSDK\\bin\\vrxcc'
    linker.flags = [ENV['LDFLAGS'] || []]
    linker.flags_before_libraries = []
    linker.libraries = %w()
    linker.flags_after_libraries = []
    linker.library_paths = []
    linker.option_library = '-l%s'
    linker.option_library_path = '-L%s'
    linker.link_options = "%{flags} -o %{outfile} %{objs} %{libs}"
  end
  
  conf.archiver do |archiver|
    archiver.command = ENV['AR'] || 'armar.exei'
    archiver.archive_options = '-rv %{outfile} %{objs}'
  end
  
  conf.exts do |exts|
    exts.object = '.o'
    exts.executable = '.out'
    exts.library = '.a'
  end
  
  conf.file_separator = '\\'
end