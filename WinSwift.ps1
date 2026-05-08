$ErrorActionPreference = 'SilentlyContinue'
Clear-Host
Write-Host "`n   [🔧] WINSWIFT PRO - DYNAMIC TWEAK ENGINE (RAM EDITION)" -ForegroundColor Green
Write-Host "   ===============================================================" -ForegroundColor DarkGray
Write-Host "   [*] Bulut veritabanina baglaniliyor (tweaks.json)..." -ForegroundColor Cyan
Write-Host ""

try {
    $jsonUrl = "https://raw.githubusercontent.com/cyberQbit/WinSwift/main/tweaks.json?t=$((Get-Date).Ticks)"
    $wc = New-Object System.Net.WebClient
    $wc.Encoding = [System.Text.Encoding]::UTF8
    $jsonStr = $wc.DownloadString($jsonUrl)
    $jsonResponse = $jsonStr | ConvertFrom-Json
    
    $categories = $jsonResponse.psobject.properties.name
    $allTweaks = @()
    $counter = 1
    
    foreach ($cat in $categories) {
        Write-Host "   --- $cat ---" -ForegroundColor Yellow
        foreach ($tweak in $jsonResponse."$cat") {
            Write-Host "   [$counter] $($tweak.Name)" -ForegroundColor White
            $allTweaks += [PSCustomObject]@{ Index = $counter; Name = $tweak.Name; Script = $tweak.Script }
            $counter++
        }
        Write-Host ""
    }
    
    Write-Host "   ===============================================================" -ForegroundColor DarkGray
    Write-Host "   [+] Sisteme enjekte etmek istediginiz ayarlarin numaralarini boslukla yazin." -ForegroundColor Yellow
    Write-Host "       (Ornek: 1 3 4 7)" -ForegroundColor DarkGray
    Write-Host "   [0] Iptal ve Ana Menuye Don" -ForegroundColor Red
    Write-Host ""
    
    $choices = Read-Host "   Seciminiz"
    if ($choices -eq '0') { return }
    
    Write-Host ""
    $selectedNumbers = $choices -split ' ' | Where-Object { $_ -match '^\d+$' }
    $toApply = $allTweaks | Where-Object { $selectedNumbers -contains $_.Index }
    
    if ($toApply.Count -gt 0) {
        Write-Host "   [!] Secilen $($toApply.Count) ayar sisteme isleniyor... Lutfen bekleyin.`n" -ForegroundColor Cyan
        foreach ($item in $toApply) {
            Write-Host "   [-] Uygulaniyor: $($item.Name)" -ForegroundColor Blue
            try { 
                Invoke-Expression $item.Script 
                Write-Host "   [OK] Basarili!`n" -ForegroundColor Green 
            } catch { 
                Write-Host "   [X] Hata: $($_.Exception.Message)`n" -ForegroundColor Red 
            }
        }
        Write-Host "   [+] TUM AYARLAR KUSURSUZCA SISTEME ENJEKTE EDILDI!" -ForegroundColor Yellow
    } else {
        Write-Host "   [X] Gecerli bir secim yapilamadi." -ForegroundColor Red
    }
} catch {
    Write-Host "   [X] JSON OKUMA HATASI: tweaks.json dosyasinda muhtemelen bir virgul veya tirnak eksik!" -ForegroundColor Red
    Write-Host "   [Sistem Logu] $($_.Exception.Message)" -ForegroundColor DarkGray
}

Write-Host "`n   Devam etmek icin [ENTER] tusuna basin..." -ForegroundColor DarkGray
Read-Host