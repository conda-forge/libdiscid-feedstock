setlocal EnableDelayedExpansion

:: Make a build folder and change to it.
mkdir build
cd build

:: Configure using the CMakeFiles
cmake -G "NMake Makefiles" ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_INSTALL_BINDIR="%LIBRARY_BIN%" ^
      -DCMAKE_INSTALL_LIBDIR="%LIBRARY_LIB%" ^
      -DBUILD_SHARED_LIBS:BOOL=ON ^
      -DCMAKE_BUILD_TYPE:STRING=Release ^
      ..
if errorlevel 1 exit 1

:: Build!
nmake
if errorlevel 1 exit 1

:: Install!
nmake install
if errorlevel 1 exit
