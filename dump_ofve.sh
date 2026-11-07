# dump_ofve.ps1 — Genera OFVE_PROJECT_SNAPSHOT.md en la raíz del proyecto
# Uso: powershell -ExecutionPolicy Bypass -File .\dump_ofve.ps1

$ErrorActionPreference = "SilentlyContinue"
$Out     = "OFVE_PROJECT_SNAPSHOT.md"
$Fecha   = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# --- Validación: debe ejecutarse en la raíz del proyecto ---
if (-not (Test-Path "pubspec.yaml")) {
    Write-Host "❌ No encuentro pubspec.yaml. Ejecuta este script desde la raíz de ofve-app." -ForegroundColor Red
    exit 1
}

Set-Content -Path $Out -Value "# OFVE PROJECT SNAPSHOT" -Encoding UTF8
Add-Content -Path $Out -Value "Generado: $Fecha"
Add-Content -Path $Out -Value ""

# --- 1) Estructura lib/ ---
Add-Content -Path $Out -Value "## 📁 ESTRUCTURA lib/"
Add-Content -Path $Out -Value '```'
Get-ChildItem -Path "lib" -Recurse -Filter "*.dart" |
    ForEach-Object { $_.FullName.Replace((Get-Location).Path + "\", "").Replace("\", "/") } |
    Sort-Object | Add-Content -Path $Out
Add-Content -Path $Out -Value '```'
Add-Content -Path $Out -Value ""

# --- 2) pubspec.yaml ---
Add-Content -Path $Out -Value "## 📦 pubspec.yaml"
Add-Content -Path $Out -Value '```yaml'
Get-Content "pubspec.yaml" | Add-Content -Path $Out
Add-Content -Path $Out -Value '```'
Add-Content -Path $Out -Value ""

# --- 3) Código Dart ---
Add-Content -Path $Out -Value "## 💻 CÓDIGO DART"
Get-ChildItem -Path "lib" -Recurse -Filter "*.dart" |
    Sort-Object FullName |
    ForEach-Object {
        $rel = $_.FullName.Replace((Get-Location).Path + "\", "").Replace("\", "/")
        Add-Content -Path $Out -Value ""
        Add-Content -Path $Out -Value "### $rel"
        Add-Content -Path $Out -Value '```dart'
        Get-Content $_.FullName | Add-Content -Path $Out
        Add-Content -Path $Out -Value '```'
    }

# --- 4) SQL ---
Add-Content -Path $Out -Value ""
Add-Content -Path $Out -Value "## 🗄️ SQL"
Get-ChildItem -Recurse -Filter "*.sql" |
    Where-Object { $_.FullName -notmatch "\\(\.dart_tool|build|node_modules|\.git)\\" } |
    Sort-Object FullName |
    ForEach-Object {
        $rel = $_.FullName.Replace((Get-Location).Path + "\", "").Replace("\", "/")
        Add-Content -Path $Out -Value ""
        Add-Content -Path $Out -Value "### $rel"
        Add-Content -Path $Out -Value '```sql'
        Get-Content $_.FullName | Add-Content -Path $Out
        Add-Content -Path $Out -Value '```'
    }

# --- 5) Edge Functions ---
Add-Content -Path $Out -Value ""
Add-Content -Path $Out -Value "## 🚀 EDGE FUNCTIONS (supabase/functions/)"
if (Test-Path "supabase\functions") {
    Get-ChildItem -Path "supabase\functions" -Recurse -Filter "*.ts" |
        Sort-Object FullName |
        ForEach-Object {
            $rel = $_.FullName.Replace((Get-Location).Path + "\", "").Replace("\", "/")
            Add-Content -Path $Out -Value ""
            Add-Content -Path $Out -Value "### $rel"
            Add-Content -Path $Out -Value '```typescript'
            Get-Content $_.FullName | Add-Content -Path $Out
            Add-Content -Path $Out -Value '```'
        }
} else {
    Add-Content -Path $Out -Value "(no existe carpeta supabase/functions)"
}

# --- Resumen ---
$size = (Get-Item $Out).Length
$kb = [math]::Round($size / 1KB, 1)
Write-Host ""
Write-Host "✅ Snapshot generado: $Out ($kb KB)" -ForegroundColor Green
if ($kb -gt 200) {
    Write-Host "⚠️  Es grande. Pégame solo las secciones que necesitemos." -ForegroundColor Yellow
}