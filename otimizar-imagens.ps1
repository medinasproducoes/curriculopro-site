Add-Type -AssemblyName System.Drawing

$base = 'E:\OFICIAL - PUBLICADO\Criador de curriculo\img'

function Otimizar-Jpg($entrada, $saida, $larguraMax, $qualidade) {
    $img = [System.Drawing.Image]::FromFile($entrada)
    $ratio = [Math]::Min(1.0, ($larguraMax / $img.Width))
    $w = [int]($img.Width * $ratio)
    $h = [int]($img.Height * $ratio)
    $bmp = New-Object System.Drawing.Bitmap($w, $h)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.DrawImage($img, 0, 0, $w, $h)
    $enc = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq 'image/jpeg' }
    $ep = New-Object System.Drawing.Imaging.EncoderParameters(1)
    $ep.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, [long]$qualidade)
    $bmp.Save($saida, $enc, $ep)
    $g.Dispose(); $bmp.Dispose(); $img.Dispose()
    $kb = [Math]::Round((Get-Item $saida).Length / 1KB)
    Write-Output ("OK {0} -> {1} KB ({2}x{3})" -f (Split-Path $saida -Leaf), $kb, $w, $h)
}

function Otimizar-Png($entrada, $saida, $larguraMax) {
    $img = [System.Drawing.Image]::FromFile($entrada)
    $ratio = [Math]::Min(1.0, ($larguraMax / $img.Width))
    $w = [int]($img.Width * $ratio)
    $h = [int]($img.Height * $ratio)
    $bmp = New-Object System.Drawing.Bitmap($w, $h)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.DrawImage($img, 0, 0, $w, $h)
    $bmp.Save($saida, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose(); $bmp.Dispose(); $img.Dispose()
    $kb = [Math]::Round((Get-Item $saida).Length / 1KB)
    Write-Output ("OK {0} -> {1} KB ({2}x{3})" -f (Split-Path $saida -Leaf), $kb, $w, $h)
}

Otimizar-Jpg "$base\hero-curriculo.png"  "$base\hero-curriculo-web.jpg"  1000 82
Otimizar-Jpg "$base\og-capa.png"         "$base\og-capa-web.jpg"         1200 82
Otimizar-Jpg "$base\avatar-lucas.png"    "$base\avatar-lucas-web.jpg"     256 82
Otimizar-Jpg "$base\avatar-mariana.png"  "$base\avatar-mariana-web.jpg"   256 82
Otimizar-Jpg "$base\avatar-juliana.png"  "$base\avatar-juliana-web.jpg"   256 82
Otimizar-Png "$base\favicon.png"         "$base\favicon-web.png"          128
Write-Output 'CONCLUIDO'
