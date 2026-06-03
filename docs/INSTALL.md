# Hướng dẫn cài đặt Antigravity Harness

Công cụ **Harness** được thiết kế dưới dạng một meta-skill chạy trực tiếp trên Antigravity. Quá trình cài đặt cực kỳ đơn giản: bạn chỉ cần đưa mã nguồn của kỹ năng này vào thư mục skills toàn cục của Antigravity (`.agent/skills/`) trên hệ điều hành của bạn.

Chúng tôi đã chuẩn bị sẵn các script cài đặt nhanh cho từng hệ điều hành.

---

## 🍎 🐧 Cài đặt trên macOS và Linux

1. Mở Terminal và di chuyển vào thư mục dự án `antigravity-harness`.
2. Cấp quyền thực thi cho file script:
   ```bash
   chmod +x install.sh
   ```
3. Chạy script cài đặt:
   ```bash
   ./install.sh
   ```

*Sau khi chạy, Harness sẽ được chép vào `~/.agent/skills/harness/`.*

---

## 🪟 Cài đặt trên Windows

1. Mở **PowerShell** (nhấn Windows, gõ `powershell`).
2. Di chuyển vào thư mục dự án `antigravity-harness`.
3. Chạy script cài đặt:
   ```powershell
   .\install.ps1
   ```
*(Lưu ý: Nếu bạn gặp lỗi Execution Policy, hãy chạy lệnh này trước: `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass`)*

*Sau khi chạy, Harness sẽ được chép vào `C:\Users\Ten_Cua_Ban\.agent\skills\harness\`.*

---

## 🛠 Cài đặt thủ công (Nếu bạn không dùng script)

Nếu script không hoạt động, bạn hoàn toàn có thể tự copy bằng tay:

- **macOS/Linux**:
  ```bash
  mkdir -p ~/.agent/skills/harness
  cp -r skills/harness/* ~/.agent/skills/harness/
  ```

- **Windows**:
  Copy toàn bộ nội dung trong thư mục `skills/harness/` của dự án này vào thư mục `%USERPROFILE%\.agent\skills\harness\`.

---

## ✅ Xác minh cài đặt thành công

Mở công cụ dòng lệnh (hoặc IDE đang tích hợp Antigravity) và gõ thử lệnh gọi kỹ năng:

```bash
/harness build a harness for a fintech risk-assessment team
```

Nếu Antigravity bắt đầu đọc Prompt và tiến hành sinh mã, xin chúc mừng, bạn đã cài đặt thành công L3 Meta-Factory Harness!
