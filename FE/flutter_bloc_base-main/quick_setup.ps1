# Quick Setup and Build Script
# This script sets up virtual drive, installs packages, and runs the app

$ProjectPath = "D:\Code lung tung\Yoga Detection\FE\flutter_bloc_base-main"
$VirtualDrive = "Y:"

Write-Host "====================================" -ForegroundColor Cyan
Write-Host "  Flutter Project Quick Setup" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Create virtual drive
Write-Host "[1/4] Creating virtual drive mapping..." -ForegroundColor Yellow
subst $VirtualDrive /D 2>$null
subst $VirtualDrive $ProjectPath

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Virtual drive created: $VirtualDrive" -ForegroundColor Green
} else {
    Write-Host "✗ Failed to create virtual drive" -ForegroundColor Red
    exit 1
}

# Step 2: Change to virtual drive
Write-Host ""
Write-Host "[2/4] Changing to virtual drive..." -ForegroundColor Yellow
Set-Location $VirtualDrive
Write-Host "✓ Current directory: $(Get-Location)" -ForegroundColor Green

# Step 3: Install packages
Write-Host ""
Write-Host "[3/4] Installing Flutter packages..." -ForegroundColor Yellow
flutter pub get

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Packages installed successfully" -ForegroundColor Green
} else {
    Write-Host "✗ Failed to install packages" -ForegroundColor Red
    Write-Host ""
    Write-Host "To cleanup, run: subst $VirtualDrive /D" -ForegroundColor Gray
    exit 1
}

# Step 4: Clean build
Write-Host ""
Write-Host "[4/4] Cleaning build artifacts..." -ForegroundColor Yellow
flutter clean

Write-Host ""
Write-Host "====================================" -ForegroundColor Cyan
Write-Host "  Setup Complete!" -ForegroundColor Green
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "You are now working in: $VirtualDrive" -ForegroundColor Yellow
Write-Host ""
Write-Host "Recent Updates:" -ForegroundColor Cyan
Write-Host "  ✓ YouTube video player with thumbnail" -ForegroundColor Green
Write-Host "  ✓ Orientation lock fix (no more stuck in landscape)" -ForegroundColor Green
Write-Host "  ✓ Gradle 8.7 + AGP 8.6.0 compatibility" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "  • Run the app:          flutter run" -ForegroundColor White
Write-Host "  • Build APK:            flutter build apk" -ForegroundColor White
Write-Host "  • Run code generation:  flutter pub run build_runner build --delete-conflicting-outputs" -ForegroundColor White
Write-Host ""
Write-Host "Documentation:" -ForegroundColor Cyan
Write-Host "  • Orientation fix details: .\ORIENTATION_FIX.md" -ForegroundColor White
Write-Host ""
Write-Host "When finished, cleanup with:" -ForegroundColor Gray
Write-Host "  subst $VirtualDrive /D" -ForegroundColor Gray
Write-Host ""
