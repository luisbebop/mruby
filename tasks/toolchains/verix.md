#Compilation instructions do VeriFone Verix

##About
The mruby compilation structure has a little incompatibility with the VeriFone ARM linker armar.exe, because it uses C files with the same name in multiple places. The mentioned linker instead of add the object file to the lib, replace the old one if the file has a name of a previous linked library. It was resolved with this patch: a529bc844501f774aae704b7ffff5ba4d77ce173

To compile the mruby for VeriFone Verix you have to use our default virtual box that has all compilations tools. In addition you have to install VC++ 2010 and Bison. We have a little problem with paths with space on the rake used in this project to compile the sources. Because that you have to change the Bison's patch from "C:\Program Files" to "C:\" and adds it on the Window's path.

##Compilation instructions
You can have to do a manual copy of the following include to the VFSDK includes:
copy C:\Program Files\ARM\RVCT\Data\4.0\902\include\windows\stdint.h C:\VerixVAps\VFSDK\include

0. Open the "Visual Studio Command Prompt (2010)" on Window's start menu.
1. Go to the mruby directory
2. copy build_config_verix.rb build_config.rb
3. make clean
4. make all