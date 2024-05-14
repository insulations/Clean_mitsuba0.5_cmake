# A clean Mitsuba 0.5 with CMake and dependencies that can be easily compiled.


## How to build
**If using dependencies given by this repository, the VS2013 is needed.**

Run `cmake -B build -G "Visual Studio 12 2013" -A x64`

After compiling, copy the files from the **'dll_dependencies'** directory to the generated directory of 'mitsuba.exe'.

### The original Mitsuba repository

https://github.com/mitsuba-renderer/mitsuba
