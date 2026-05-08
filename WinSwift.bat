:: ==============================================================================
:: 🔧 WINSWIFT PRO v3.1 - BULLETPROOF TWEAK ENGINE (Zero-Footprint)
:: ==============================================================================
@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

set "PSFILE=%PROGRAMDATA%\cyberQbit\winswift_engine.ps1"

>> "%PSFILE%" echo $ErrorActionPreference = 'SilentlyContinue'
>> "%PSFILE%" echo [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
>> "%PSFILE%" echo Clear-Host
>> "%PSFILE%" echo Write-Host "`n   [🔧] WINSWIFT PRO - DYNAMIC TWEAK ENGINE" -ForegroundColor Green
>> "%PSFILE%" echo Write-Host "   ===============================================================" -ForegroundColor DarkGray
>> "%PSFILE%" echo Write-Host "   [*] Bulut veritabanina baglaniliyor (tweaks.json)..." -ForegroundColor Cyan
>> "%PSFILE%" echo.
>> "%PSFILE%" echo try {
>> "%PSFILE%" echo     $jsonUrl = "https://raw.githubusercontent.com/cyberQbit/WinSwift/main/tweaks.json?t=$((Get-Date).Ticks)"
>> "%PSFILE%" echo     $wc = New-Object System.Net.WebClient
>> "%PSFILE%" echo     $wc.Encoding = [System.Text.Encoding]::UTF8
>> "%PSFILE%" echo     $jsonStr = $wc.DownloadString($jsonUrl)
>> "%PSFILE%" echo     $jsonResponse = $jsonStr ^| ConvertFrom-Json
>> "%PSFILE%" echo     $categories = $jsonResponse.psobject.properties.name
>> "%PSFILE%" echo.
>> "%PSFILE%" echo     $allTweaks = @()
>> "%PSFILE%" echo     $counter = 1
>> "%PSFILE%" echo     foreach ($cat in $categories) {
>> "%PSFILE%" echo         Write-Host "   --- $cat ---" -ForegroundColor Yellow
>> "%PSFILE%" echo         foreach ($tweak in $jsonResponse.$cat) {
>> "%PSFILE%" echo             Write-Host "   [$counter] $($tweak.Name)" -ForegroundColor White
>> "%PSFILE%" echo             $allTweaks += [PSCustomObject]@{ Index = $counter; Name = $tweak.Name; Script = $tweak.Script }
>> "%PSFILE%" echo             $counter++
>> "%PSFILE%" echo         }
>> "%PSFILE%" echo         Write-Host ""
>> "%PSFILE%" echo     }
>> "%PSFILE%" echo     Write-Host "   ===============================================================" -ForegroundColor DarkGray
>> "%PSFILE%" echo     Write-Host "   [+] Sisteme enjekte etmek istediginiz ayarlarin numaralarini boslukla yazin." -ForegroundColor Yellow
>> "%PSFILE%" echo     Write-Host "       (Ornek: 1 3 4 7)" -ForegroundColor DarkGray
>> "%PSFILE%" echo     Write-Host "   [0] Iptal ve Ana Menuye Don" -ForegroundColor Red
>> "%PSFILE%" echo     Write-Host ""
>> "%PSFILE%" echo     $choices = Read-Host "   Seciminiz"
>> "%PSFILE%" echo     if ($choices -eq '0') { exit }
>> "%PSFILE%" echo.
>> "%PSFILE%" echo     $selectedNumbers = $choices -split ' ' ^| Where-Object { $_ -match '^\d+$' }
>> "%PSFILE%" echo     $toApply = $allTweaks ^| Where-Object { $selectedNumbers -contains $_.Index }
>> "%PSFILE%" echo.
>> "%PSFILE%" echo     if ($toApply.Count -gt 0) {
>> "%PSFILE%" echo         Write-Host "   [!] Secilen $($toApply.Count) ayar sisteme isleniyor... Lutfen bekleyin.`n" -ForegroundColor Cyan
>> "%PSFILE%" echo         foreach ($item in $toApply) {
>> "%PSFILE%" echo             Write-Host "   [-] Uygulaniyor: $($item.Name)" -ForegroundColor Blue
>> "%PSFILE%" echo             try { 
>> "%PSFILE%" echo                 Invoke-Expression $item.Script 
>> "%PSFILE%" echo                 Write-Host "   [OK] Basarili!`n" -ForegroundColor Green 
>> "%PSFILE%" echo             } catch { 
>> "%PSFILE%" echo                 Write-Host "   [X] Hata: $($_.Exception.Message)`n" -ForegroundColor Red 
>> "%PSFILE%" echo             }
>> "%PSFILE%" echo         }
>> "%PSFILE%" echo         Write-Host "   [+] TUM AYARLAR KUSURSUZCA SISTEME ENJEKTE EDILDI!" -ForegroundColor Yellow
>> "%PSFILE%" echo         Write-Host "       (Bazi ayarlarin aktif olmasi icin Windows Gezginini yeniden baslatmaniz gerekebilir)" -ForegroundColor DarkGray
>> "%PSFILE%" echo     } else {
>> "%PSFILE%" echo         Write-Host "   [X] Gecerli bir secim yapilamadi." -ForegroundColor Red
>> "%PSFILE%" echo     }
>> "%PSFILE%" echo } catch {
>> "%PSFILE%" echo     Write-Host "   [X] Icerik Cekilemedi: Lutfen tweaks.json dosyasinin hatasiz oldugundan emin olun." -ForegroundColor Red
>> "%PSFILE%" echo }
>> "%PSFILE%" echo.
>> "%PSFILE%" echo Write-Host "   Devam etmek icin [ENTER] tusuna basin..." -ForegroundColor DarkGray
>> "%PSFILE%" echo Read-Host
>> "%PSFILE%" echo exit

powershell -NoProfile -ExecutionPolicy Bypass -File "%PSFILE%"
del /q "%PSFILE%" >nul 2>&1
exit