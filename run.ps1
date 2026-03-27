# ==============================================================================
# WinSwift Pro - Yönetici Yetkisi Kontrolü ve UAC İstemi
# ==============================================================================

Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                                        ║" -ForegroundColor Cyan
Write-Host "║                    WinSwift Pro - Başlatılıyor                         ║" -ForegroundColor Cyan
Write-Host "║                                                                        ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Yönetici yetkisi kontrolü
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "[!] WinSwift Pro yönetici yetkileri gerektiriyor!" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "    Sistem optimizasyonu için aşağıdaki izinler gereklidir:" -ForegroundColor Gray
    Write-Host "    • Geçici dosyaların temizlenmesi" -ForegroundColor Gray
    Write-Host "    • Tarayıcı önbelleklerinin silinmesi" -ForegroundColor Gray
    Write-Host "    • Ağ ayarlarının sıfırlanması" -ForegroundColor Gray
    Write-Host "    • Sistem dosyalarının onarımı" -ForegroundColor Gray
    Write-Host "    • Gizlilik ve telemetri ayarlarının yapılandırılması" -ForegroundColor Gray
    Write-Host ""
    Write-Host "[*] Yönetici izni isteniyor..." -ForegroundColor Cyan
    Write-Host "    Lütfen UAC penceresinde 'Evet' seçeneğini tıklayın." -ForegroundColor White
    Write-Host ""

    try {
        Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"irm https://raw.githubusercontent.com/cyberQbit/WinSwift/main/run.ps1 | iex`"" -Verb RunAs
    } catch {
        Write-Host "[X] Yönetici yetkileri alınamadı!" -ForegroundColor Red
        Write-Host "    Program sadece yönetici yetkileriyle çalışabilir." -ForegroundColor Red
        Write-Host ""
        Write-Host "Çıkmak için bir tuşa basın..." -ForegroundColor Gray
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
    exit
}

Write-Host "[✓] Yönetici yetkileri doğrulandı!" -ForegroundColor Green
Write-Host "[*] WinSwift Pro indiriliyor..." -ForegroundColor Cyan

# Eğer buraya geldiysek zaten yöneticiyiz demektir, aracı indirip çalıştırabiliriz
$batPath = "$env:TEMP\WinSwift.bat"
try {
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/cyberQbit/WinSwift/main/WinSwift.bat" -OutFile $batPath -UseBasicParsing
    I# === LINUX (LF) FORMATINI WINDOWS (CRLF) FORMATINA ZORLA VE BOM'U YOK ET ===
    $content = Get-Content $batPath -Raw
    $utf8NoBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText($batPath, $content, $utf8NoBom)
    
    Write-Host "[OK] Motor basariyla hazirlandi!" -ForegroundColor Green
    Write-Host "[*] Arayuz aciliyor..." -ForegroundColor Cyan
    Start-Sleep -Milliseconds 400
    
    # ==============================================================================
    # 🚀 EFSANEVİ WINDOWS TERMINAL (WT) ENTEGRASYONU VE MAVİ EKRAN KATİLİ
    # ==============================================================================
    # Dikkat: -Wait komutunu sildik! Mavi PowerShell uygulamayı açtığı milisaniye kapanacak.
    
    if (Get-Command wt.exe -ErrorAction SilentlyContinue) {
        # Eğer sistemde modern Windows Terminal varsa, CAM GİBİ arayüzle onda aç
        Start-Process wt.exe -ArgumentList "cmd.exe /c `"$batPath`""
    } else {
        # Eski bir Windows 10 ise ve Terminal yoksa standart CMD ile aç
        Start-Process cmd.exe -ArgumentList "/c `"$batPath`""
    }
    
} catch {
    Write-Host "[X] Indirme basarisiz! Baglantinizi kontrol edin." -ForegroundColor Red
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}
} catch {
    Write-Host "[X] WinSwift Pro indirilemedi!" -ForegroundColor Red
    Write-Host "    Hata: $_" -ForegroundColor Red
    Write-Host ""
    Write-Host "Çıkmak için bir tuşa basın..." -ForegroundColor Gray
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}
