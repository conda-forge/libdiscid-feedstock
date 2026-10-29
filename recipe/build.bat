:: Configure using the CMakeFiles
cmake %CMAKE_ARGS% -G Ninja -S . -B build ^
  -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
  -DCMAKE_BUILD_TYPE:STRING=Release
if errorlevel 1 exit 1

:: Build!
cmake --build build --parallel %CPU_COUNT%
if errorlevel 1 exit 1

:: Install!
cmake --install build
if errorlevel 1 exit 1

:: The upstream CMake installs the DLL into lib, move it to bin
move /Y "%LIBRARY_LIB%\discid.dll" "%LIBRARY_BIN%\"
if errorlevel 1 exit 1
