@echo off
cd /d "%~dp0"
echo Starting Mega Sweets ^& Bakers demo on http://localhost:8080 ...
start "" http://localhost:8080
where python >nul 2>nul && (python -m http.server 8080 & goto :eof)
where py >nul 2>nul && (py -m http.server 8080 & goto :eof)
powershell -NoProfile -Command "$l=New-Object Net.HttpListener;$l.Prefixes.Add('http://localhost:8080/');$l.Start();Write-Host 'Serving on http://localhost:8080 (close this window to stop)';$m=@{'.html'='text/html';'.webp'='image/webp';'.js'='application/javascript';'.css'='text/css';'.png'='image/png';'.jpg'='image/jpeg';'.txt'='text/plain'};while($l.IsListening){$c=$l.GetContext();$p=$c.Request.Url.LocalPath;if($p -eq '/'){$p='/index.html'};$f=Join-Path (Get-Location) ($p -replace '/','\');if(Test-Path $f){$b=[IO.File]::ReadAllBytes($f);$e=[IO.Path]::GetExtension($f);$c.Response.ContentType=$m[$e];$c.Response.OutputStream.Write($b,0,$b.Length)}else{$c.Response.StatusCode=404};$c.Response.Close()}"
