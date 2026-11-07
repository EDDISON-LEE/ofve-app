param([switch]$DryRun)
$ErrorActionPreference = "Stop"
$pattern = [regex]'\.withOpacity\(([^()?]+)\)'
$archivos = Get-ChildItem -Path "lib" -Recurse -Filter "*.dart"
$totalSimples = 0
$totalComplejos = 0
$archivosTocados = 0
foreach ($f in $archivos) {
    $contenido = Get-Content $f.FullName -Raw -Encoding UTF8
    if ($contenido -notmatch '\.withOpacity\(') { continue }
    $todos = [regex]::Matches($contenido, '\.withOpacity\(([^()]*(?:\([^()]*\)[^()]*)*)\)')
    $complejos = 0
    foreach ($m in $todos) {
        $arg = $m.Groups[1].Value
        if ($arg -match '[()]' -or $arg -match '\?') { $complejos++ }
    }
    $simples = $pattern.Matches($contenido).Count
    if ($simples -gt 0) {
        $archivosTocados++
        $totalSimples += $simples
        $totalComplejos += $complejos
        $rel = $f.FullName.Replace((Get-Location).Path + "\", "")
        if ($DryRun) {
            Write-Host "  [DRY] $rel -> $simples" -ForegroundColor Cyan
        } else {
            $nuevo = $pattern.Replace($contenido, '.withValues(alpha: $1)')
            Set-Content -Path $f.FullName -Value $nuevo -Encoding UTF8 -NoNewline
            Write-Host "  OK $rel -> $simples" -ForegroundColor Green
        }
    }
}
Write-Host ""
Write-Host "=================================" -ForegroundColor Magenta
if ($DryRun) { Write-Host "MODO DRY-RUN" -ForegroundColor Yellow }
Write-Host "Archivos tocados:   $archivosTocados"
Write-Host "Reemplazos simples: $totalSimples"
Write-Host "Complejos (manual): $totalComplejos" -ForegroundColor Yellow
Write-Host "=================================" -ForegroundColor Magenta