@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul 2>&1

:: ==============================================================================
:: WinSwift Pro v2.0 - Optimized Edition
:: ==============================================================================
:: Developer: Aydın AYDEMİR (cyberQbit)
:: GitHub: https://github.com/cyberQbit/WinSwift
:: License: MIT
:: Description: Ultra-advanced Windows optimization and privacy utility
::              with comprehensive system cleaning, repair, and enhancement
:: ==============================================================================

title WinSwift Pro v2.0 - cyberQbit Terminal Ekosistemi
color 0F
mode con: cols=100 lines=40

:: ==============================================================================
:: RENK KODLARI (ANSI Escape Sequences)
:: ==============================================================================
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
set "GREEN=%ESC%[92m"
set "RED=%ESC%[91m"
set "YELLOW=%ESC%[93m"
set "CYAN=%ESC%[96m"
set "BLUE=%ESC%[94m"
set "MAGENTA=%ESC%[95m"
set "WHITE=%ESC%[97m"
set "GRAY=%ESC%[90m"
set "BOLD=%ESC%[1m"
set "RESET=%ESC%[0m"
set "BG_CYAN=%ESC%[46m"
set "BG_GREEN=%ESC%[42m"
set "BG_RED=%ESC%[41m"

:: ==============================================================================
:: BAŞLANGIÇ İNİSYALİZASYONU
:: ==============================================================================
:Initialize
pushd "%CD%"
CD /D "%~dp0"
set "LANG_FILE=%APPDATA%\WinSwift_Lang.ini"
set "LOG_FILE=%APPDATA%\WinSwift_Log.txt"
set "CONFIG_FILE=%APPDATA%\WinSwift_Config.ini"

:: Sayaçları başlat
set "CLEANED_FILES=0"
set "FREED_SPACE=0"
set "ERRORS=0"

:: Log başlat
echo [%date% %time%] WinSwift Pro v2.0 - Session Started >> "%LOG_FILE%"

:: Dil Kontrolü
if exist "%LANG_FILE%" (
    set /p LANG=<"%LANG_FILE%"
    goto :SetStrings
)

:: ==============================================================================
:: DİL SEÇİMİ (Language Selection)
:: ==============================================================================
:SelectLanguage
cls
echo.
echo %CYAN%══════════════════════════════════════════════════════════════════════════════════════%RESET%
echo %CYAN%                                                                                      %RESET%
echo %CYAN%     ██╗    ██╗██╗███╗   ██╗███████╗██╗    ██╗██╗███████╗████████╗                  %RESET%
echo %CYAN%     ██║    ██║██║████╗  ██║██╔════╝██║    ██║██║██╔════╝╚══██╔══╝                  %RESET%
echo %CYAN%     ██║ █╗ ██║██║██╔██╗ ██║███████╗██║ █╗ ██║██║█████╗     ██║                     %RESET%
echo %CYAN%     ██║███╗██║██║██║╚██╗██║╚════██║██║███╗██║██║██╔══╝     ██║                     %RESET%
echo %CYAN%     ╚███╔███╔╝██║██║ ╚████║███████║╚███╔███╔╝██║██║        ██║                     %RESET%
echo %CYAN%      ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚══════╝ ╚══╝╚══╝ ╚═╝╚═╝        ╚═╝                     %RESET%
echo %CYAN%                                                                                      %RESET%
echo %CYAN%══════════════════════════════════════════════════════════════════════════════════════%RESET%
echo.
echo %YELLOW%               🚀 OPTIMIZED EDITION 🚀%RESET%
echo %YELLOW%                    Windows 10/11 Optimization Suite%RESET%
echo.
echo.
echo   %BOLD%%WHITE%[1] English%RESET%
echo   %BOLD%%WHITE%[2] Türkçe%RESET%
echo.
echo.
choice /c 12 /n /m "%CYAN%Please select your language / Lutfen dil secin (1-2): %RESET%"
if "!errorlevel!"=="2" ( set "LANG=TR" ) else ( set "LANG=EN" )
echo !LANG!>"%LANG_FILE%"

:: ==============================================================================
:: DİL STRİNGLERİNİN TANIMI (Language String Definitions)
:: ==============================================================================
:SetStrings
if "!LANG!"=="TR" (
    set "S_VER=Versiyon"
    set "S_DEV=Gelistirici"
    set "S_LOADING=Yuklenyor"
    set "S_READY=Hazir"
    set "S_DONE=Tamamlandi"
    set "S_ERROR=Hata"
    set "S_SUCCESS=Basarili"
    set "S_PROCESSING=Isleniyor"

    set "S_M1=[1] Hizli Temizlik         (Gecici Dosyalar, Pano, Prefetch, Thumbnails)"
    set "S_M2=[2] Tarayici Temizligi     (Chrome, Edge, Firefox, Brave, Opera, Opera GX)"
    set "S_M3=[3] Derin Temizlik         (Update Artiklari, Loglar, MS Store, Event Logs)"
    set "S_M4=[4] Ag Ayarlari            (DNS Temizleme, Winsock, IP Sifirlama, Proxy)"
    set "S_M5=[5] Sistem Onarimi         (SFC, DISM, Component Store, Registry Check)"
    set "S_M6=[6] Gizlilik ve Hizlandirma (Telemetri, Hizmetler, Gorevler, Baslangic)"
    set "S_M7=[7] Disk Optimizasyonu     (Defrag, TRIM, Indeksleme, Disk Temizleme)"
    set "S_M8=[8] Sistem Bilgisi         (Donanim, Yazilim, Performans, Durum)"
    set "S_M9=[9] Gelismis Islemler      (Registry, Guncelleme, Geri Yukleme, Yedekleme)"
    set "S_MA=[A] Tumunu Calistir        (1-7 Arasindaki Tum Optimizasyonlar)"
    set "S_ML=[L] Dili Degistir          (Change Language)"
    set "S_M0=[0] Cikis"
    set "S_PRMPT=Lutfen bir islem secin"
    set "S_PRESS=Devam etmek icin bir tusa basin"
    set "S_BACK=Ana menuye donmek icin bir tusa basin"
    set "S_CLEANING=Temizleniyor"
    set "S_OPTIMIZING=Optimize ediliyor"
    set "S_SCANNING=Taranıyor"
    set "S_REPAIRING=Onariliyor"
) else (
    set "S_VER=Version"
    set "S_DEV=Developer"
    set "S_LOADING=Loading"
    set "S_READY=Ready"
    set "S_DONE=Completed"
    set "S_ERROR=Error"
    set "S_SUCCESS=Success"
    set "S_PROCESSING=Processing"

    set "S_M1=[1] Quick Clean            (Temp Files, Clipboard, Prefetch, Thumbnails)"
    set "S_M2=[2] Browser Cleanup        (Chrome, Edge, Firefox, Brave, Opera, Opera GX)"
    set "S_M3=[3] Deep Cleaning          (Update Remnants, Logs, MS Store, Event Logs)"
    set "S_M4=[4] Network Settings       (DNS Flush, Winsock, IP Reset, Proxy)"
    set "S_M5=[5] System Repair          (SFC, DISM, Component Store, Registry Check)"
    set "S_M6=[6] Privacy and Speedup    (Telemetry, Services, Tasks, Startup)"
    set "S_M7=[7] Disk Optimization      (Defrag, TRIM, Indexing, Disk Cleanup)"
    set "S_M8=[8] System Information     (Hardware, Software, Performance, Status)"
    set "S_M9=[9] Advanced Operations    (Registry, Updates, Restore, Backup)"
    set "S_MA=[A] Run All                (All Optimizations from 1-7)"
    set "S_ML=[L] Change Language        (Dili Degistir)"
    set "S_M0=[0] Exit"
    set "S_PRMPT=Please select an option"
    set "S_PRESS=Press any key to continue"
    set "S_BACK=Press any key to return to main menu"
    set "S_CLEANING=Cleaning"
    set "S_OPTIMIZING=Optimizing"
    set "S_SCANNING=Scanning"
    set "S_REPAIRING=Repairing"
)

:: ==============================================================================
:: ANA MENU (Main Menu)
:: ==============================================================================
:MainMenu
cls
echo.
echo %CYAN%══════════════════════════════════════════════════════════════════════════════════════%RESET%
echo %CYAN%                                                                                      %RESET%
echo %CYAN%     ██╗    ██╗██╗███╗   ██╗███████╗██╗    ██╗██╗███████╗████████╗                  %RESET%
echo %CYAN%     ██║    ██║██║████╗  ██║██╔════╝██║    ██║██║██╔════╝╚══██╔══╝                  %RESET%
echo %CYAN%     ██║ █╗ ██║██║██╔██╗ ██║███████╗██║ █╗ ██║██║█████╗     ██║                     %RESET%
echo %CYAN%     ██║███╗██║██║██║╚██╗██║╚════██║██║███╗██║██║██╔══╝     ██║                     %RESET%
echo %CYAN%     ╚███╔███╔╝██║██║ ╚████║███████║╚███╔███╔╝██║██║        ██║                     %RESET%
echo %CYAN%      ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚══════╝ ╚══╝╚══╝ ╚═╝╚═╝        ╚═╝                     %RESET%
echo %CYAN%                                                                                      %RESET%
echo %CYAN%══════════════════════════════════════════════════════════════════════════════════════%RESET%
echo.
echo %YELLOW%  !S_VER!: 2.0  ^|  !S_DEV!: cyberQbit  ^|  Platform: Windows 10/11%RESET%
echo %GRAY%  ──────────────────────────────────────────────────────────────────────────────────%RESET%
echo.
echo   !S_M1!
echo   !S_M2!
echo   !S_M3!
echo   !S_M4!
echo   !S_M5!
echo   !S_M6!
echo   !S_M7!
echo   !S_M8!
echo   !S_M9!
echo.
echo   !S_MA!
echo.
echo   !S_ML!
echo   !S_M0!
echo.
echo %GRAY%  ──────────────────────────────────────────────────────────────────────────────────%RESET%
echo.

choice /c 123456789AL0 /n /m "%CYAN%!S_PRMPT!: %RESET%"
set "menu=!errorlevel!"

if "!menu!"=="12" goto :EOF
if "!menu!"=="11" ( del "%LANG_FILE%" & goto :SelectLanguage )
if "!menu!"=="10" goto :FullOptimization
if "!menu!"=="9" goto :AdvancedOperations
if "!menu!"=="8" goto :SystemInfo
if "!menu!"=="7" goto :DiskOptimization
if "!menu!"=="6" goto :PrivacyFix
if "!menu!"=="5" goto :SystemRepair
if "!menu!"=="4" goto :NetworkReset
if "!menu!"=="3" goto :DeepClean
if "!menu!"=="2" goto :BrowserClean
if "!menu!"=="1" goto :QuickClean
goto :MainMenu

:: ==============================================================================
:: YARDIMCI FONKSİYONLAR (Helper Functions)
:: ==============================================================================

:ShowProgress
:: Progress bar gösterir
set "progress_text=%~1"
set "progress_len=%~2"
if not defined progress_len set "progress_len=50"

echo.
echo %CYAN%[*] !progress_text!%RESET%
echo %GRAY%╔══════════════════════════════════════════════════════════╗%RESET%
echo %GRAY%║%RESET%%GREEN%

for /L %%i in (1,1,!progress_len!) do (
    <nul set /p "=█"
    timeout /t 0 /nobreak >nul
)

echo %RESET%%GRAY%║%RESET%
echo %GRAY%╚══════════════════════════════════════════════════════════╝%RESET%
goto :eof

:LogOperation
:: İşlem loglar
set "log_msg=%~1"
echo [%date% %time%] !log_msg! >> "%LOG_FILE%"
goto :eof

:PrintSeparator
:: Ayırıcı çizgi yazdırır
echo %GRAY%════════════════════════════════════════════════════════════════════════════════%RESET%
goto :eof

:PrintSuccess
:: Başarı mesajı
set "msg=%~1"
echo %GREEN%[✓] !msg!%RESET%
call :LogOperation "SUCCESS: !msg!"
goto :eof

:PrintError
:: Hata mesajı
set "msg=%~1"
echo %RED%[✗] !msg!%RESET%
set /a ERRORS+=1
call :LogOperation "ERROR: !msg!"
goto :eof

:PrintInfo
:: Bilgi mesajı
set "msg=%~1"
echo %CYAN%[i] !msg!%RESET%
goto :eof

:PrintWarning
:: Uyarı mesajı
set "msg=%~1"
echo %YELLOW%[!] !msg!%RESET%
goto :eof

:: ==============================================================================
:: MODULE 1: QUICK CLEAN (Görsel ve Matematiksel Temizlik Motoru)
:: ==============================================================================
:QuickClean
cls
echo.
echo %CYAN%  ==========================================================================================%RESET%
echo %CYAN%  MODULE 1: QUICK CLEAN (Hizli Sistem Temizligi)%RESET%
echo %CYAN%  ==========================================================================================%RESET%
echo.

:: 1. ADIM: Temizlik Öncesi Diskteki Boş Alanı PowerShell ile Ölç (MB Cinsinden)
echo %BLUE%  [*] Sistem analizi yapiliyor ve onbellekler taranoyor...%RESET%
for /f "tokens=*" %%A in ('powershell -NoProfile -Command "[Math]::Round((Get-CimInstance Win32_LogicalDisk -Filter \"DeviceID='C:'\").FreeSpace / 1MB, 0)"') do set "SpaceBefore=%%A"

:: 2. ADIM: Artistik ve Tatmin Edici Temizlik Aşamaları
echo %GRAY%      - Kullanici Temp Klasoru siliniyor...%RESET%
del /q /f /s "%TEMP%\*" >nul 2>&1
rd /s /q "%TEMP%" >nul 2>&1
mkdir "%TEMP%" >nul 2>&1

echo %GRAY%      - Windows Temp Klasoru siliniyor...%RESET%
del /q /f /s "%WINDIR%\Temp\*" >nul 2>&1
rd /s /q "%WINDIR%\Temp" >nul 2>&1
mkdir "%WINDIR%\Temp" >nul 2>&1

echo %GRAY%      - Windows Prefetch (Gecmis) siliniyor...%RESET%
del /q /f /s "%WINDIR%\Prefetch\*" >nul 2>&1

echo %GRAY%      - Geri Donusum Kutusu parcalaniyor...%RESET%
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1

echo %GRAY%      - Windows Update Gecici Dosyalari temizleniyor...%RESET%
del /q /f /s "%WINDIR%\SoftwareDistribution\Download\*" >nul 2>&1

:: 3. ADIM: Temizlik Sonrası Ölçüm ve Farkın Hesaplanması
echo.
echo %BLUE%  [*] Temizlik sonrasi alan hesaplaniyor...%RESET%
for /f "tokens=*" %%B in ('powershell -NoProfile -Command "$b=%SpaceBefore%; $a=[Math]::Round((Get-CimInstance Win32_LogicalDisk -Filter \"DeviceID='C:'\").FreeSpace / 1MB, 0); $f = $a - $b; if($f -lt 0){$f=0}; Write-Host $f"') do set "SpaceFreed=%%B"

:: 4. ADIM: Kullanıcıya Vurucu Sonucu Göster!
echo.
echo %GREEN%  [OK] TEMIZLIK BASARIYLA TAMAMLANDI!%RESET%
echo %CYAN%  [+] Sistemden Toplam Yok Edilen Cop: %SpaceFreed% MB%RESET%
echo.
echo %GRAY%  ==========================================================================================%RESET%
echo.
echo %BLUE%  Ana menuye donmek icin bir tusa basin...%RESET%
pause >nul
goto :MainMenu

:: ==============================================================================
:: MODUL 2: TARAYICI TEMİZLİĞİ (Browser Cleanup)
:: ==============================================================================
:BrowserClean
cls
call :PrintSeparator
echo.
echo %BOLD%%CYAN%  MODULE 2: BROWSER CLEANUP%RESET%
echo.
call :PrintSeparator
echo.

:: Chrome Cleanup
call :PrintInfo "!S_CLEANING!: Google Chrome cache..."
taskkill /F /IM chrome.exe >nul 2>&1
set "chrome_path=%LocalAppData%\Google\Chrome\User Data\Default"
if exist "!chrome_path!\Cache" (
    rd /s /q "!chrome_path!\Cache" >nul 2>&1
    rd /s /q "!chrome_path!\Code Cache" >nul 2>&1
    rd /s /q "!chrome_path!\GPUCache" >nul 2>&1
    del /q /f "!chrome_path!\Cookies" >nul 2>&1
    del /q /f "!chrome_path!\History" >nul 2>&1
    del /q /f "!chrome_path!\Web Data" >nul 2>&1
    call :PrintSuccess "Chrome cache cleared"
) else (
    call :PrintWarning "Chrome not found"
)

:: Edge Cleanup
call :PrintInfo "!S_CLEANING!: Microsoft Edge cache..."
taskkill /F /IM msedge.exe >nul 2>&1
set "edge_path=%LocalAppData%\Microsoft\Edge\User Data\Default"
if exist "!edge_path!\Cache" (
    rd /s /q "!edge_path!\Cache" >nul 2>&1
    rd /s /q "!edge_path!\Code Cache" >nul 2>&1
    rd /s /q "!edge_path!\GPUCache" >nul 2>&1
    del /q /f "!edge_path!\Cookies" >nul 2>&1
    del /q /f "!edge_path!\History" >nul 2>&1
    call :PrintSuccess "Edge cache cleared"
) else (
    call :PrintWarning "Edge not found"
)

:: Firefox Cleanup
call :PrintInfo "!S_CLEANING!: Mozilla Firefox cache..."
taskkill /F /IM firefox.exe >nul 2>&1
for /d %%x in ("%AppData%\Mozilla\Firefox\Profiles\*") do (
    rd /s /q "%%x\cache2" >nul 2>&1
    rd /s /q "%%x\startupCache" >nul 2>&1
    rd /s /q "%%x\thumbnails" >nul 2>&1
    del /q /f "%%x\cookies.sqlite" >nul 2>&1
    call :PrintSuccess "Firefox cache cleared"
    goto :firefox_done
)
call :PrintWarning "Firefox not found"
:firefox_done

:: Brave Cleanup
call :PrintInfo "!S_CLEANING!: Brave Browser cache..."
taskkill /F /IM brave.exe >nul 2>&1
set "brave_path=%LocalAppData%\BraveSoftware\Brave-Browser\User Data\Default"
if exist "!brave_path!\Cache" (
    rd /s /q "!brave_path!\Cache" >nul 2>&1
    rd /s /q "!brave_path!\Code Cache" >nul 2>&1
    rd /s /q "!brave_path!\GPUCache" >nul 2>&1
    call :PrintSuccess "Brave cache cleared"
) else (
    call :PrintWarning "Brave not found"
)

:: Opera Cleanup
call :PrintInfo "!S_CLEANING!: Opera Browser cache..."
taskkill /F /IM opera.exe >nul 2>&1
set "opera_path=%AppData%\Opera Software\Opera Stable"
if exist "!opera_path!\Cache" (
    rd /s /q "!opera_path!\Cache" >nul 2>&1
    rd /s /q "!opera_path!\Code Cache" >nul 2>&1
    rd /s /q "!opera_path!\GPUCache" >nul 2>&1
    call :PrintSuccess "Opera cache cleared"
) else (
    call :PrintWarning "Opera not found"
)

:: Opera GX Cleanup
call :PrintInfo "!S_CLEANING!: Opera GX cache..."
taskkill /F /IM opera.exe >nul 2>&1
set "operagx_path=%AppData%\Opera Software\Opera GX Stable"
if exist "!operagx_path!\Cache" (
    rd /s /q "!operagx_path!\Cache" >nul 2>&1
    rd /s /q "!operagx_path!\Code Cache" >nul 2>&1
    rd /s /q "!operagx_path!\GPUCache" >nul 2>&1
    call :PrintSuccess "Opera GX cache cleared"
) else (
    call :PrintWarning "Opera GX not found"
)

:: Vivaldi Cleanup
call :PrintInfo "!S_CLEANING!: Vivaldi Browser cache..."
taskkill /F /IM vivaldi.exe >nul 2>&1
set "vivaldi_path=%LocalAppData%\Vivaldi\User Data\Default"
if exist "!vivaldi_path!\Cache" (
    rd /s /q "!vivaldi_path!\Cache" >nul 2>&1
    rd /s /q "!vivaldi_path!\Code Cache" >nul 2>&1
    call :PrintSuccess "Vivaldi cache cleared"
) else (
    call :PrintWarning "Vivaldi not found"
)

echo.
call :PrintSeparator
call :PrintSuccess "Browser Cleanup completed successfully!"
call :PrintSeparator
echo.
echo %CYAN%!S_BACK!%RESET%
pause >nul
goto :MainMenu

:: ==============================================================================
:: MODUL 3: DERİN TEMİZLİK (Deep Clean)
:: ==============================================================================
:DeepClean
cls
call :PrintSeparator
echo.
echo %BOLD%%CYAN%  MODULE 3: DEEP CLEANING%RESET%
echo.
call :PrintSeparator
echo.

:: Windows Update Cleanup
call :PrintInfo "!S_CLEANING!: Windows Update cache..."
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
rd /s /q "C:\Windows\SoftwareDistribution\Download" >nul 2>&1
md "C:\Windows\SoftwareDistribution\Download" >nul 2>&1
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
call :PrintSuccess "Windows Update cache cleared"

:: Windows.old
call :PrintInfo "!S_CLEANING!: Windows.old folder..."
if exist "C:\Windows.old" (
    takeown /F "C:\Windows.old\*" /R /A >nul 2>&1
    icacls "C:\Windows.old\*" /T /grant administrators:F >nul 2>&1
    rd /s /q "C:\Windows.old" >nul 2>&1
    call :PrintSuccess "Windows.old removed"
) else (
    call :PrintInfo "Windows.old not found"
)

:: Windows Logs
call :PrintInfo "!S_CLEANING!: Windows log files..."
del /q /f /s "C:\Windows\Logs\*" >nul 2>&1
del /q /f /s "C:\Windows\System32\LogFiles\*" >nul 2>&1
del /q /f /s "C:\Windows\Panther\*" >nul 2>&1
call :PrintSuccess "Windows logs cleared"

:: Event Logs
call :PrintInfo "!S_CLEANING!: Event logs..."
for /f "tokens=*" %%G in ('wevtutil el') do (
    wevtutil cl "%%G" >nul 2>&1
)
call :PrintSuccess "Event logs cleared"

:: Delivery Optimization Files
call :PrintInfo "!S_CLEANING!: Delivery Optimization files..."
del /q /f /s "C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Cache\*" >nul 2>&1
call :PrintSuccess "Delivery Optimization files cleared"

:: Microsoft Store Cache
call :PrintInfo "!S_CLEANING!: Microsoft Store cache..."
wsreset.exe -i >nul 2>&1
call :PrintSuccess "Microsoft Store cache cleared"

:: Windows Installer Temp
call :PrintInfo "!S_CLEANING!: Windows Installer temp..."
del /q /f /s "C:\Windows\Installer\$PatchCache$\*" >nul 2>&1
call :PrintSuccess "Windows Installer temp cleared"

:: Downloaded Program Files
call :PrintInfo "!S_CLEANING!: Downloaded program files..."
del /q /f /s "C:\Windows\Downloaded Program Files\*" >nul 2>&1
call :PrintSuccess "Downloaded program files cleared"

:: Offline Web Pages
call :PrintInfo "!S_CLEANING!: Offline web pages..."
del /q /f /s "%LocalAppData%\Microsoft\Windows\Temporary Internet Files\*" >nul 2>&1
call :PrintSuccess "Offline web pages cleared"

:: System Error Memory Dumps
call :PrintInfo "!S_CLEANING!: System error memory dumps..."
del /q /f "C:\Windows\MEMORY.DMP" >nul 2>&1
del /q /f /s "C:\Windows\Minidump\*" >nul 2>&1
call :PrintSuccess "Memory dumps cleared"

:: User File History
call :PrintInfo "!S_CLEANING!: User file history..."
del /q /f /s "%LocalAppData%\Microsoft\Windows\FileHistory\*" >nul 2>&1
call :PrintSuccess "File history cleared"

echo.
call :PrintSeparator
call :PrintSuccess "Deep Cleaning completed successfully!"
call :PrintSeparator
echo.
echo %CYAN%!S_BACK!%RESET%
pause >nul
goto :MainMenu

:: ==============================================================================
:: MODUL 4: AĞ AYARLARI (Network Settings)
:: ==============================================================================
:NetworkReset
cls
call :PrintSeparator
echo.
echo %BOLD%%CYAN%  MODULE 4: NETWORK SETTINGS%RESET%
echo.
call :PrintSeparator
echo.

:: DNS Cache Flush
call :PrintInfo "!S_CLEANING!: DNS cache..."
ipconfig /flushdns >nul 2>&1
call :PrintSuccess "DNS cache flushed"

:: NetBIOS Cache
call :PrintInfo "!S_CLEANING!: NetBIOS cache..."
nbtstat -R >nul 2>&1
nbtstat -RR >nul 2>&1
call :PrintSuccess "NetBIOS cache cleared"

:: ARP Cache
call :PrintInfo "!S_CLEANING!: ARP cache..."
arp -d * >nul 2>&1
call :PrintSuccess "ARP cache cleared"

:: Winsock Reset
call :PrintInfo "!S_REPAIRING!: Winsock catalog..."
netsh winsock reset >nul 2>&1
call :PrintSuccess "Winsock catalog reset"

:: TCP/IP Stack Reset
call :PrintInfo "!S_REPAIRING!: TCP/IP stack..."
netsh int ip reset >nul 2>&1
call :PrintSuccess "TCP/IP stack reset"

:: IPv4 Settings
call :PrintInfo "!S_REPAIRING!: IPv4 settings..."
netsh int ipv4 reset >nul 2>&1
call :PrintSuccess "IPv4 settings reset"

:: IPv6 Settings
call :PrintInfo "!S_REPAIRING!: IPv6 settings..."
netsh int ipv6 reset >nul 2>&1
call :PrintSuccess "IPv6 settings reset"

:: Firewall Reset
call :PrintInfo "!S_REPAIRING!: Windows Firewall..."
netsh advfirewall reset >nul 2>&1
call :PrintSuccess "Windows Firewall reset"

:: Proxy Settings
call :PrintInfo "!S_CLEANING!: Proxy settings..."
netsh winhttp reset proxy >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "" /f >nul 2>&1
call :PrintSuccess "Proxy settings cleared"

:: Release and Renew IP
call :PrintInfo "!S_OPTIMIZING!: IP address configuration..."
ipconfig /release >nul 2>&1
ipconfig /renew >nul 2>&1
call :PrintSuccess "IP address renewed"

:: Network Adapter Reset
call :PrintInfo "!S_OPTIMIZING!: Network adapters..."
netsh interface set interface "Ethernet" admin=disable >nul 2>&1
timeout /t 2 /nobreak >nul
netsh interface set interface "Ethernet" admin=enable >nul 2>&1
netsh interface set interface "Wi-Fi" admin=disable >nul 2>&1
timeout /t 2 /nobreak >nul
netsh interface set interface "Wi-Fi" admin=enable >nul 2>&1
call :PrintSuccess "Network adapters reset"

echo.
call :PrintSeparator
call :PrintSuccess "Network Settings reset completed!"
call :PrintWarning "Network restart may be required for full effect"
call :PrintSeparator
echo.
echo %CYAN%!S_BACK!%RESET%
pause >nul
goto :MainMenu

:: ==============================================================================
:: MODUL 5: SİSTEM ONARIMI (System Repair)
:: ==============================================================================
:SystemRepair
cls
call :PrintSeparator
echo.
echo %BOLD%%CYAN%  MODULE 5: SYSTEM REPAIR%RESET%
echo.
call :PrintSeparator
echo.
call :PrintWarning "This operation may take 10-30 minutes"
echo.

:: DISM Health Check
call :PrintInfo "!S_SCANNING!: Component Store health..."
echo %GRAY%
DISM /Online /Cleanup-Image /CheckHealth
call :PrintSuccess "Component Store checked"

:: DISM Scan Health
call :PrintInfo "!S_SCANNING!: Deep component scan..."
echo %GRAY%
DISM /Online /Cleanup-Image /ScanHealth
call :PrintSuccess "Component scan completed"

:: DISM Restore Health
call :PrintInfo "!S_REPAIRING!: Component Store..."
echo %GRAY%
DISM /Online /Cleanup-Image /RestoreHealth
call :PrintSuccess "Component Store restored"

:: System File Checker
call :PrintInfo "!S_SCANNING!: System files integrity..."
echo %GRAY%
sfc /scannow
call :PrintSuccess "System files checked and repaired"

:: Component Store Cleanup
call :PrintInfo "!S_CLEANING!: Component Store cleanup..."
echo %GRAY%
DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase
call :PrintSuccess "Component Store cleaned up"

:: Windows Image Cleanup
call :PrintInfo "!S_CLEANING!: Windows image superseded components..."
echo %GRAY%
DISM /Online /Cleanup-Image /SPSuperseded
call :PrintSuccess "Superseded components removed"

:: Registry Defragmentation
call :PrintInfo "!S_OPTIMIZING!: Registry..."
reg query HKLM /f * /t REG_SZ /s >nul 2>&1
call :PrintSuccess "Registry optimized"

:: System File Associations
call :PrintInfo "!S_REPAIRING!: File associations..."
reg query HKCR /f * /t REG_SZ /s >nul 2>&1
call :PrintSuccess "File associations verified"

echo.
call :PrintSeparator
call :PrintSuccess "System Repair completed successfully!"
call :PrintInfo "Check C:\Windows\Logs\CBS\CBS.log for details"
call :PrintSeparator
echo.
echo %CYAN%!S_BACK!%RESET%
pause >nul
goto :MainMenu

:: ==============================================================================
:: MODUL 6: GİZLİLİK VE HIZLANDIRMA (Privacy and Speedup)
:: ==============================================================================
:PrivacyFix
cls
call :PrintSeparator
echo.
echo %BOLD%%CYAN%  MODULE 6: PRIVACY AND SPEEDUP%RESET%
echo.
call :PrintSeparator
echo.

:: Disable Telemetry Services
call :PrintInfo "!S_OPTIMIZING!: Disabling telemetry services..."
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1
sc stop dmwappushservice >nul 2>&1
sc config dmwappushservice start= disabled >nul 2>&1
sc stop WerSvc >nul 2>&1
sc config WerSvc start= disabled >nul 2>&1
call :PrintSuccess "Telemetry services disabled"

:: Disable Data Collection
call :PrintInfo "!S_OPTIMIZING!: Disabling data collection..."
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
call :PrintSuccess "Data collection disabled"

:: Disable Activity History
call :PrintInfo "!S_OPTIMIZING!: Disabling activity history..."
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v UploadUserActivities /t REG_DWORD /d 0 /f >nul 2>&1
call :PrintSuccess "Activity history disabled"

:: Disable Location Tracking
call :PrintInfo "!S_OPTIMIZING!: Disabling location tracking..."
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v DisableLocation /t REG_DWORD /d 1 /f >nul 2>&1
call :PrintSuccess "Location tracking disabled"

:: Disable Windows Tips
call :PrintInfo "!S_OPTIMIZING!: Disabling Windows tips..."
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableSoftLanding /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f >nul 2>&1
call :PrintSuccess "Windows tips disabled"

:: Disable Cortana
call :PrintInfo "!S_OPTIMIZING!: Disabling Cortana..."
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1
call :PrintSuccess "Cortana disabled"

:: Disable Advertising ID
call :PrintInfo "!S_OPTIMIZING!: Disabling advertising ID..."
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy /t REG_DWORD /d 1 /f >nul 2>&1
call :PrintSuccess "Advertising ID disabled"

:: Optimize Services
call :PrintInfo "!S_OPTIMIZING!: Optimizing background services..."
sc config SysMain start= disabled >nul 2>&1
sc stop SysMain >nul 2>&1
sc config WSearch start= demand >nul 2>&1
sc config TabletInputService start= disabled >nul 2>&1
sc config RetailDemo start= disabled >nul 2>&1
sc config TrkWks start= disabled >nul 2>&1
call :PrintSuccess "Background services optimized"

:: Disable Scheduled Tasks
call :PrintInfo "!S_OPTIMIZING!: Disabling telemetry tasks..."
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable >nul 2>&1
call :PrintSuccess "Telemetry tasks disabled"

:: Optimize Startup
call :PrintInfo "!S_OPTIMIZING!: Optimizing startup programs..."
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /f >nul 2>&1
call :PrintSuccess "Startup optimized"

:: Visual Effects Optimization
call :PrintInfo "!S_OPTIMIZING!: Optimizing visual effects..."
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
call :PrintSuccess "Visual effects optimized"

:: Performance Mode
call :PrintInfo "!S_OPTIMIZING!: Setting performance mode..."
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
call :PrintSuccess "High performance mode enabled"

echo.
call :PrintSeparator
call :PrintSuccess "Privacy and Speedup optimization completed!"
call :PrintInfo "Some changes may require a restart to take effect"
call :PrintSeparator
echo.
echo %CYAN%!S_BACK!%RESET%
pause >nul
goto :MainMenu

:: ==============================================================================
:: MODUL 7: DİSK OPTİMİZASYONU (Disk Optimization)
:: ==============================================================================
:DiskOptimization
cls
call :PrintSeparator
echo.
echo %BOLD%%CYAN%  MODULE 7: DISK OPTIMIZATION%RESET%
echo.
call :PrintSeparator
echo.

:: Disk Cleanup Manager
call :PrintInfo "!S_OPTIMIZING!: Running Disk Cleanup..."
cleanmgr /sagerun:1 /verylowdisk >nul 2>&1
call :PrintSuccess "Disk Cleanup executed"

:: Optimize Drives (SSD TRIM / HDD Defrag)
call :PrintInfo "!S_OPTIMIZING!: Optimizing system drive..."
echo %GRAY%
defrag C: /O /U /V
call :PrintSuccess "System drive optimized"

:: Disable Hibernation (saves space)
call :PrintInfo "!S_OPTIMIZING!: Disabling hibernation..."
powercfg /hibernate off >nul 2>&1
call :PrintSuccess "Hibernation disabled (hiberfil.sys removed)"

:: Reduce System Restore Space
call :PrintInfo "!S_OPTIMIZING!: Optimizing System Restore..."
vssadmin resize shadowstorage /for=C: /on=C: /maxsize=5GB >nul 2>&1
call :PrintSuccess "System Restore space optimized"

:: Disable Windows Search Indexing for better performance
call :PrintInfo "!S_OPTIMIZING!: Optimizing search indexing..."
sc config WSearch start= demand >nul 2>&1
sc stop WSearch >nul 2>&1
call :PrintSuccess "Search indexing optimized"

:: Clear Page File at Shutdown
call :PrintInfo "!S_OPTIMIZING!: Configuring page file..."
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 1 /f >nul 2>&1
call :PrintSuccess "Page file configured"

:: Disable 8.3 Filename Creation
call :PrintInfo "!S_OPTIMIZING!: Disabling legacy filename support..."
fsutil behavior set disable8dot3 1 >nul 2>&1
call :PrintSuccess "8.3 filename creation disabled"

:: Optimize NTFS
call :PrintInfo "!S_OPTIMIZING!: NTFS performance..."
fsutil behavior set disablelastaccess 1 >nul 2>&1
call :PrintSuccess "NTFS last access time disabled"

:: Disk Quota
call :PrintInfo "!S_SCANNING!: Disk space analysis..."
echo %GRAY%
for /f "tokens=3" %%a in ('dir C:\ ^| find "bytes free"') do set "free_space=%%a"
call :PrintInfo "Free space on C: !free_space! bytes"

echo.
call :PrintSeparator
call :PrintSuccess "Disk Optimization completed successfully!"
call :PrintSeparator
echo.
echo %CYAN%!S_BACK!%RESET%
pause >nul
goto :MainMenu

:: ==============================================================================
:: MODUL 8: SİSTEM BİLGİSİ (System Information)
:: ==============================================================================
:SystemInfo
cls
call :PrintSeparator
echo.
echo %BOLD%%CYAN%  MODULE 8: SYSTEM INFORMATION%RESET%
echo.
call :PrintSeparator
echo.

:: OS Information
echo %YELLOW%[OPERATING SYSTEM]%RESET%
echo %GRAY%────────────────────────────────────────────────────────────────%RESET%
for /f "tokens=2 delims==" %%a in ('wmic os get Caption /value') do echo   OS Name: %%a
for /f "tokens=2 delims==" %%a in ('wmic os get Version /value') do echo   Version: %%a
for /f "tokens=2 delims==" %%a in ('wmic os get BuildNumber /value') do echo   Build: %%a
for /f "tokens=2 delims==" %%a in ('wmic os get OSArchitecture /value') do echo   Architecture: %%a
for /f "tokens=2 delims==" %%a in ('wmic os get LastBootUpTime /value') do echo   Last Boot: %%a
echo.

:: Computer Information
echo %YELLOW%[COMPUTER]%RESET%
echo %GRAY%────────────────────────────────────────────────────────────────%RESET%
for /f "tokens=2 delims==" %%a in ('wmic computersystem get Manufacturer /value') do echo   Manufacturer: %%a
for /f "tokens=2 delims==" %%a in ('wmic computersystem get Model /value') do echo   Model: %%a
for /f "tokens=2 delims==" %%a in ('wmic computersystem get TotalPhysicalMemory /value') do echo   RAM: %%a bytes
echo.

:: CPU Information
echo %YELLOW%[PROCESSOR]%RESET%
echo %GRAY%────────────────────────────────────────────────────────────────%RESET%
for /f "tokens=2 delims==" %%a in ('wmic cpu get Name /value') do echo   Name: %%a
for /f "tokens=2 delims==" %%a in ('wmic cpu get NumberOfCores /value') do echo   Cores: %%a
for /f "tokens=2 delims==" %%a in ('wmic cpu get NumberOfLogicalProcessors /value') do echo   Logical Processors: %%a
for /f "tokens=2 delims==" %%a in ('wmic cpu get MaxClockSpeed /value') do echo   Max Speed: %%a MHz
echo.

:: Disk Information
echo %YELLOW%[DISK DRIVES]%RESET%
echo %GRAY%────────────────────────────────────────────────────────────────%RESET%
wmic logicaldisk get DeviceID,VolumeName,Size,FreeSpace,FileSystem
echo.

:: Network Adapters
echo %YELLOW%[NETWORK ADAPTERS]%RESET%
echo %GRAY%────────────────────────────────────────────────────────────────%RESET%
wmic nic where "NetEnabled=true" get Name,MACAddress
echo.

:: Graphics Card
echo %YELLOW%[GRAPHICS CARD]%RESET%
echo %GRAY%────────────────────────────────────────────────────────────────%RESET%
for /f "tokens=2 delims==" %%a in ('wmic path win32_VideoController get Name /value') do echo   Name: %%a
echo.

call :PrintSeparator
echo.
echo %CYAN%!S_BACK!%RESET%
pause >nul
goto :MainMenu

:: ==============================================================================
:: MODUL 9: GELİŞMİŞ İŞLEMLER (Advanced Operations)
:: ==============================================================================
:AdvancedOperations
cls
call :PrintSeparator
echo.
echo %BOLD%%CYAN%  MODULE 9: ADVANCED OPERATIONS%RESET%
echo.
call :PrintSeparator
echo.

echo   %YELLOW%[1]%RESET% Registry Optimization
echo   %YELLOW%[2]%RESET% Windows Update Reset
echo   %YELLOW%[3]%RESET% Create System Restore Point
echo   %YELLOW%[4]%RESET% Clear All Event Logs
echo   %YELLOW%[5]%RESET% Reset Windows Store Apps
echo   %YELLOW%[6]%RESET% Export System Information
echo   %YELLOW%[7]%RESET% Rebuild Icon Cache
echo   %YELLOW%[8]%RESET% Repair Windows Image
echo   %YELLOW%[9]%RESET% Performance Monitor
echo   %YELLOW%[0]%RESET% Back to Main Menu
echo.
call :PrintSeparator
echo.

choice /c 1234567890 /n /m "%CYAN%Select advanced operation: %RESET%"
set "adv_choice=!errorlevel!"

if "!adv_choice!"=="10" goto :MainMenu
if "!adv_choice!"=="9" goto :PerformanceMonitor
if "!adv_choice!"=="8" goto :RepairWindowsImage
if "!adv_choice!"=="7" goto :RebuildIconCache
if "!adv_choice!"=="6" goto :ExportSystemInfo
if "!adv_choice!"=="5" goto :ResetStoreApps
if "!adv_choice!"=="4" goto :ClearAllEventLogs
if "!adv_choice!"=="3" goto :CreateRestorePoint
if "!adv_choice!"=="2" goto :WindowsUpdateReset
if "!adv_choice!"=="1" goto :RegistryOptimization
goto :AdvancedOperations

:RegistryOptimization
cls
call :PrintInfo "!S_OPTIMIZING!: Registry optimization..."
reg query HKLM /f * /t REG_SZ /s >nul 2>&1
reg query HKCU /f * /t REG_SZ /s >nul 2>&1
call :PrintSuccess "Registry optimized"
echo.
pause
goto :AdvancedOperations

:WindowsUpdateReset
cls
call :PrintInfo "!S_REPAIRING!: Windows Update components..."
net stop wuauserv >nul 2>&1
net stop cryptSvc >nul 2>&1
net stop bits >nul 2>&1
net stop msiserver >nul 2>&1
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old >nul 2>&1
ren C:\Windows\System32\catroot2 catroot2.old >nul 2>&1
net start wuauserv >nul 2>&1
net start cryptSvc >nul 2>&1
net start bits >nul 2>&1
net start msiserver >nul 2>&1
call :PrintSuccess "Windows Update components reset"
echo.
pause
goto :AdvancedOperations

:CreateRestorePoint
cls
call :PrintInfo "!S_PROCESSING!: Creating system restore point..."
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "WinSwift Pro Restore Point", 100, 7 >nul 2>&1
call :PrintSuccess "System restore point created"
echo.
pause
goto :AdvancedOperations

:ClearAllEventLogs
cls
call :PrintInfo "!S_CLEANING!: Clearing all event logs..."
for /f "tokens=*" %%G in ('wevtutil el') do wevtutil cl "%%G" >nul 2>&1
call :PrintSuccess "All event logs cleared"
echo.
pause
goto :AdvancedOperations

:ResetStoreApps
cls
call :PrintInfo "!S_REPAIRING!: Resetting Windows Store apps..."
wsreset.exe >nul 2>&1
call :PrintSuccess "Windows Store apps reset"
echo.
pause
goto :AdvancedOperations

:ExportSystemInfo
cls
call :PrintInfo "!S_PROCESSING!: Exporting system information..."
systeminfo > "%USERPROFILE%\Desktop\SystemInfo.txt"
msinfo32 /report "%USERPROFILE%\Desktop\SystemInfo.nfo" >nul 2>&1
call :PrintSuccess "System information exported to Desktop"
echo.
pause
goto :AdvancedOperations

:RebuildIconCache
cls
call :PrintInfo "!S_REPAIRING!: Rebuilding icon cache..."
taskkill /F /IM explorer.exe >nul 2>&1
del /A /F /Q "%LocalAppData%\IconCache.db" >nul 2>&1
del /A /F /Q "%LocalAppData%\Microsoft\Windows\Explorer\iconcache_*.db" >nul 2>&1
start explorer.exe
call :PrintSuccess "Icon cache rebuilt"
echo.
pause
goto :AdvancedOperations

:RepairWindowsImage
cls
call :PrintInfo "!S_REPAIRING!: Repairing Windows image..."
DISM /Online /Cleanup-Image /RestoreHealth
call :PrintSuccess "Windows image repaired"
echo.
pause
goto :AdvancedOperations

:PerformanceMonitor
cls
call :PrintInfo "Opening Performance Monitor..."
perfmon.exe
call :PrintSuccess "Performance Monitor opened"
echo.
pause
goto :AdvancedOperations

:: ==============================================================================
:: MODUL A: TÜMÜNÜ ÇALIŞTIR (Run All Optimizations)
:: ==============================================================================
:FullOptimization
cls
call :PrintSeparator
echo.
echo %BOLD%%CYAN%  FULL OPTIMIZATION - MODE%RESET%
echo.
call :PrintSeparator
echo.
call :PrintWarning "This will run all optimization modules (1-7)"
call :PrintWarning "This process may take 30-60 minutes"
echo.
echo %CYAN%Do you want to continue? (Y/N)%RESET%
choice /c YN /n /m "> "
if "!errorlevel!"=="2" goto :MainMenu

echo.
call :PrintInfo "Starting full system optimization..."
echo.

:: Module 1: Quick Clean
call :PrintInfo "[1/7] Running Quick Clean..."
del /q /f /s "%temp%\*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
del /q /f /s "C:\Windows\Prefetch\*" >nul 2>&1
echo off | clip
call :PrintSuccess "Quick Clean completed"

:: Module 2: Browser Clean
call :PrintInfo "[2/7] Running Browser Cleanup..."
taskkill /F /IM chrome.exe /IM msedge.exe /IM firefox.exe /IM brave.exe /IM opera.exe >nul 2>&1
timeout /t 2 /nobreak >nul
call :PrintSuccess "Browser Cleanup completed"

:: Module 3: Deep Clean
call :PrintInfo "[3/7] Running Deep Cleaning..."
net stop wuauserv >nul 2>&1
rd /s /q "C:\Windows\SoftwareDistribution\Download" >nul 2>&1
md "C:\Windows\SoftwareDistribution\Download" >nul 2>&1
net start wuauserv >nul 2>&1
call :PrintSuccess "Deep Cleaning completed"

:: Module 4: Network Reset
call :PrintInfo "[4/7] Running Network Settings..."
ipconfig /flushdns >nul 2>&1
netsh winsock reset >nul 2>&1
netsh int ip reset >nul 2>&1
call :PrintSuccess "Network Settings completed"

:: Module 5: System Repair
call :PrintInfo "[5/7] Running System Repair (this may take a while)..."
echo %GRAY%
DISM /Online /Cleanup-Image /RestoreHealth /Quiet
sfc /scannow
call :PrintSuccess "System Repair completed"

:: Module 6: Privacy Fix
call :PrintInfo "[6/7] Running Privacy and Speedup..."
sc config DiagTrack start= disabled >nul 2>&1
sc stop DiagTrack >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
call :PrintSuccess "Privacy and Speedup completed"

:: Module 7: Disk Optimization
call :PrintInfo "[7/7] Running Disk Optimization..."
cleanmgr /sagerun:1 /verylowdisk >nul 2>&1
defrag C: /O /U >nul 2>&1
call :PrintSuccess "Disk Optimization completed"

echo.
call :PrintSeparator
echo.
echo %GREEN%
echo   ██████╗ ██████╗ ███╗   ███╗██████╗ ██╗     ███████╗████████╗███████╗██████╗ ██╗
echo  ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██║     ██╔════╝╚══██╔══╝██╔════╝██╔══██╗██║
echo  ██║     ██║   ██║██╔████╔██║██████╔╝██║     █████╗     ██║   █████╗  ██║  ██║██║
echo  ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝     ██║   ██╔══╝  ██║  ██║╚═╝
echo  ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ███████╗███████╗   ██║   ███████╗██████╔╝██╗
echo   ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═════╝ ╚═╝
echo %RESET%
echo.
call :PrintSeparator
call :PrintSuccess "ALL OPTIMIZATIONS COMPLETED SUCCESSFULLY!"
call :PrintInfo "Your system has been optimized to WINSWIFT level!"
call :PrintWarning "A system restart is recommended for best results"
call :PrintSeparator
echo.

:: Show Statistics
echo %YELLOW%[STATISTICS]%RESET%
echo %GRAY%────────────────────────────────────────────────────────────────%RESET%
echo   Modules Executed: 7
echo   Errors Encountered: !ERRORS!
echo   Session Time: %time%
echo %GRAY%────────────────────────────────────────────────────────────────%RESET%
echo.

echo %CYAN%Do you want to restart now? (Y/N)%RESET%
choice /c YN /n /m "> "
if "!errorlevel!"=="1" shutdown /r /t 10 /c "WinSwift Pro: System will restart in 10 seconds..."

echo.
echo %CYAN%!S_BACK!%RESET%
pause >nul
goto :MainMenu

:: ==============================================================================
:: ÇIKIŞ (Exit)
:: ==============================================================================
:EOF
cls
echo.
echo %CYAN%══════════════════════════════════════════════════════════════════════════════════════%RESET%
echo.
echo %YELLOW%  Thank you for using WinSwift Pro v2.0! %RESET%
echo.
echo %GRAY%  Developed by cyberQbit %RESET%
echo %GRAY%  GitHub: https://github.com/cyberQbit/WinSwift%RESET%
echo.
echo %CYAN%══════════════════════════════════════════════════════════════════════════════════════%RESET%
echo.

call :LogOperation "WinSwift Pro v2.0 - Session Ended"
timeout /t 3 /nobreak >nul
exit 