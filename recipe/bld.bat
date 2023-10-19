setlocal EnableDelayedExpansion

:: Make a build folder and change to it.
mkdir build
cd build

:: Configure using the CMakeFiles
cmake -G "NMake Makefiles" ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_INSTALL_LIBDIR="Library/lib" ^
    -DCMAKE_INSTALL_BINDIR="Library/bin" ^
    -DCMAKE_INSTALL_INCLUDEDIR="Library/include" ^
    -DCMAKE_INSTALL_DATAROOTDIR="Library/share" ^
    -DCMAKE_INSTALL_PREFIX="%PREFIX%" ^
    -DCMAKE_PROGRAM_PATH=$BUILD_PREFIX/bin ^
      ..
if errorlevel 1 exit 1

:: Build!
nmake VERBOSE=1
if errorlevel 1 exit 1

nmake discid discisrc
if errorlevel 1 exit 1
:: Install!
nmake install VERBOSE=1
mv  %LIBRARY_LIB%\discid.dll %LIBRARY_BIN%\discid.dll -v 
if errorlevel 1 exit
