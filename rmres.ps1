$src = ".\Downloads"
$dest = ".\Documents\Resume"

Move-Item -Path "$src\*resume*" -Destination $dest

foreach ($file in Get-ChildItem -Path $dest | Where-Object { $_.Name -match "resume" }) {
    if ($file.CreationTime -lt (Get-Date).AddDays(-30)) {
        Write-Host "Deleting: $($file.FullName)"
        Remove-Item -Path $file.FullName -Force
    }
}

