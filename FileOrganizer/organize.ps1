# organize.ps1 - Move files into folders by type
$sourcePath = "$HOME\Downloads"
$destPath = "$HOME\Downloads\Organized"

if (-Not (Test-Path $destPath)) {
    New-Item -Path $destPath -ItemType Directory
}

Get-ChildItem -Path $sourcePath -File | ForEach-Object {
    $ext = $_.Extension.TrimStart(".")
    $target = Join-Path $destPath $ext
    if (-Not (Test-Path $target)) {
        New-Item -Path $target -ItemType Directory
    }
    Move-Item -Path $_.FullName -Destination $target
}
