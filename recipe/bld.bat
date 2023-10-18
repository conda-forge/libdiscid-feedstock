setlocal EnableDelayedExpansion

:: Make a build folder and change to it.
mkdir build
cd build

:: Configure using the CMakeFiles
cmake -G "Ninja" -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%"   -DCMAKE_RUNTIME_OUTPUT_DIRECTORY:PATH="%LIBRARY_BIN%"  -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY:PATH="%LIBRARY_LIB%" -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE:STRING=Release ..
if errorlevel 1 exit 1

:: Build!
ninja
if errorlevel 1 exit 1

ninja install
if errorlevel 1 exit 1
