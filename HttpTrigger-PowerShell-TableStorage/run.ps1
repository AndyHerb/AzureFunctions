$requestBody = Get-Content $req -Raw | ConvertFrom-Json
Write-Output "PowerShell script processed queue message '$requestBody'"

$entity = [PSObject]@{
  PartitionKey = $requestBody.room  
  RowKey = get-date -Format "yyyy-MM-dd H:m:s.ms"
  Temp = $requestBody.temp
}

$entity | ConvertTo-Json | Out-File -Encoding UTF8 $outputTable