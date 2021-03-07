$appname = "mandelbrot-lua"
$love_dir = "..\love-11.3-win64"
$build_dir = ".\pkg"

# create ./pkg directory if it not exists
if(!(Test-Path -Path $build_dir )){
    New-Item -ItemType directory -Path $build_dir
}

# Compress game
$exclude = @(".*","pkg","*.exe","*.love","*.zip","*.ps1")
$files = Get-ChildItem -Path $path -Exclude $exclude
Compress-Archive -Force -Path $files -DestinationPath $build_dir\$appname -CompressionLevel Fastest

# Rename .zip -> .love
move "$build_dir\$appname.zip" "$build_dir\$appname.love" -Force

# Fuse into .exe
cmd /c copy /b "$love_dir\love.exe"+"$build_dir\$appname.love" "$build_dir\$appname.exe"

# Get all LOVE libs and our game
$redist_files  = Get-ChildItem -Path $love_dir\* -Include @("*.dll","license.txt")
$redist_files += Get-ChildItem -Path "$build_dir\$appname.exe"
$redist_files += Get-ChildItem -Path "README.md"

# Pack into final redistributable
Compress-Archive -Force -Path $redist_files -DestinationPath $build_dir\$appname -CompressionLevel Fastest
pause
