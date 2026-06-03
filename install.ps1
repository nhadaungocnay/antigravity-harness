# Cài đặt nhanh Antigravity Harness cho Windows
Write-Host "🚀 Bat dau cai dat Antigravity Harness..." -ForegroundColor Cyan

# Xác định thư mục skills toàn cục của Antigravity
$SkillDir = "$env:USERPROFILE\.agent\skills\harness"

Write-Host "📂 Dang tao thu muc dich tai $SkillDir..."
New-Item -ItemType Directory -Force -Path $SkillDir | Out-Null

Write-Host "📦 Dang sao chep ma nguon ky nang (skills)..."
Copy-Item -Path "skills\harness\*" -Destination $SkillDir -Recurse -Force

Write-Host "✅ Cai dat hoan tat! Antigravity Harness da san sang." -ForegroundColor Green
Write-Host "💡 Ban co the bat dau bang lenh: /harness build a harness for..." -ForegroundColor Yellow
