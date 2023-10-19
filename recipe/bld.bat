setlocal EnableDelayedExpansion

:: Make a build folder and change to it.
mkdir build
cd build

:: Configure using the CMakeFiles
cmake -G "NMake Makefiles" ^
        -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON ^
        -DALE_BUILD_TESTS=OFF ^
        -DCMAKE_BUILD_TYPE=Release ^
        -DCMAKE_INSTALL_PREFIX="%PREFIX%" ^
        -DCMAKE_INSTALL_LIBDIR="%LIBRARY_LIB%" ^
        -DCMAKE_INSTALL_INCLUDEDIR="%LIBRARY_INC%" ^
        -DCMAKE_INSTALL_BINDIR="%LIBRARY_BIN%" ^
        -DCMAKE_INSTALL_DATADIR="%LIBRARY_PREFIX%" ^
        ..
if errorlevel 1 exit 1

:: Build!
nmake
if errorlevel 1 exit 1

:: Install!
nmake install
if errorlevel 1 exit
