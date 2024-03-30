param (
    [bool]$nanobind = $false,
    [int]$clean = 0 # Before building, delete the build directory entirely
)
$buildtype = "Release"

function check_command {
    param([string]$command)
    if ($null -eq (get-command $command -ea silentlycontinue)) { return 1; }
    return 0;
}

if (check_command("cl") -e 0) {
    ./vcvars2019.ps1
}

$build_dir = "$psscriptroot/build/win32"

if ($clean -ne 0) {
    write-host "-- Cleaning.."
    remove-item -r -force -ea silentlycontinue $build_dir
}
write-host "Building $buildtype to $build_dir"
push-location # Store current path

try {
    mkdir -ea silentlycontinue $build_dir
    cd $build_dir

    cmake ../.. -DCMAKE_BUILD_TYPE="$buildtype" -DUSE_NANOBIND="$nanobind"
    cmake --build . --config $buildtype
}
finally {
    $success = $?
    pop-location # Restore current path
}

exit $LastExitCode
