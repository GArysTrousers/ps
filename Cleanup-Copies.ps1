$red = [System.Collections.ArrayList]@()
$yellow = [System.Collections.ArrayList]@()

Get-ChildItem | ForEach-Object {
  if ($_.BaseName -match "\(\d\)$") {
    $red.Add($_) | Out-Null
    $_.BaseName | Write-Host -ForegroundColor Red
  }
  elseif ($_.BaseName -match " - Copy$") {
    $yellow.Add($_) | Out-Null
    $_.BaseName | Write-Host -ForegroundColor Yellow
  }
  else {
    $_.BaseName | Write-Host -ForegroundColor White
  }
}

$input = Read-Host "Which to delete? (all/red/yellow)"
switch ($input) {
  "all" { 
    $red | Remove-Item
    $yellow | Remove-Item
  }
  "red" { $red | Remove-Item }
  "yellow" { $yellow | Remove-Item }
  Default { Write-Host "Ok I'll just do nothing" }
}

Write-Host "Done!" -ForegroundColor Green