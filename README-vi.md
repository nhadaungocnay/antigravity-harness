<p align="center">
  <img src="harness_banner.png" alt="Harness Banner" width="600">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Version-1.2.0-brightgreen.svg" alt="Version">
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-Apache_2.0-blue.svg" alt="License"></a>
  <img src="https://img.shields.io/badge/Antigravity-Agent_System-purple.svg" alt="Antigravity System">
  <img src="https://img.shields.io/badge/Patterns-6_Architectures-orange.svg" alt="6 Architecture Patterns">
  <img src="https://img.shields.io/badge/Mode-Hybrid_Execution-green.svg" alt="Hybrid Execution">
</p>

<p align="center">
  <a href="#category--where-harness-sits"><img src="https://img.shields.io/badge/Layer-L3%20Meta--Factory-orange" alt="Layer"></a>
  <a href="#category--where-harness-sits"><img src="https://img.shields.io/badge/Sub--layer-Team--Architecture%20Factory-teal" alt="Sub-layer"></a>
  <a href="#"><img src="https://img.shields.io/badge/README-EN%20%7C%20VI-lightgrey" alt="i18n"></a>
</p>

# Harness — Nhà máy Kiến trúc cho Antigravity

[English](README.md) | **Tiếng Việt**

> **Harness là một nhà máy tự động tạo kiến trúc cho Google Antigravity.** Bạn chỉ cần nói **"hãy tạo harness cho dự án này"** và nó sẽ biến mô tả tên miền/dự án của bạn thành một kế hoạch thực thi động (`task.md`), các mục Kiến thức về Vai trò/Persona (`.agent/knowledge/`), và các kỹ năng chuyên biệt (`.agent/skills/`) — sử dụng phương pháp tiếp cận Lai (Hybrid) giữa Chuyển đổi Vai trò Đơn Tác tử (Single-Agent Role Switching) và Gọi Tác tử Phụ (Subagent Spawning).

## Tổng quan

Harness tận dụng hệ thống thực thi dựa trên Artifact và Knowledge Items (KI) của Antigravity để phân rã các tác vụ phức tạp thành một chuỗi phối hợp nhịp nhàng. Nó tự động tạo các định nghĩa Persona (`.agent/knowledge/`) và kỹ năng (`.agent/skills/`) được thiết kế riêng cho lĩnh vực của bạn.

## Tính năng Chính

- **Kiến trúc Thực thi Lai (Hybrid)** — Tập trung vào **Chuyển đổi Vai trò Đơn Tác tử** (tải tuần tự các KI Persona) để đảm bảo độ ổn định, và sử dụng **Tác tử Phụ tường minh (Explicit Subagents)** cho các mẫu xử lý song song như Fan-out/Fan-in.
- **Mẫu Thiết kế Tác tử** — 6 mẫu kiến trúc: Pipeline (Đường ống), Fan-out/Fan-in (Song song), Expert Pool (Nhóm chuyên gia), Producer-Reviewer (Người tạo-Người duyệt), Supervisor (Người giám sát), và Hierarchical Delegation (Ủy quyền phân cấp).
- **Tạo Kỹ năng** — Tự động tạo các kỹ năng được tối ưu hóa cho khả năng thực thi qua terminal và mã kịch bản của Antigravity.
- **Điều phối bằng Artifact** — Việc điều phối luồng công việc được quản lý hoàn toàn thông qua `task.md` và các tệp Kiến thức (Knowledge Items) thay vì trạng thái bộ nhớ ẩn của tác tử.

## Quy trình làm việc (Workflow)

```
Giai đoạn 1: Phân tích Lĩnh vực (Domain Analysis)
    ↓
Giai đoạn 2: Thiết kế Kiến trúc Lai (Vai trò tuần tự vs Tác tử phụ song song)
    ↓
Giai đoạn 3: Tạo Kiến thức về Persona (.agent/knowledge/)
    ↓
Giai đoạn 4: Tạo Kỹ năng (.agent/skills/)
    ↓
Giai đoạn 5: Tích hợp Artifact (task.md & GEMINI.md)
    ↓
Giai đoạn 6: Kiểm thử & Xác thực
```

## Cài đặt

### Qua Antigravity CLI

```shell
# Tích hợp Harness vào môi trường Tác tử Antigravity của bạn
agy install harness
```

### Cài đặt Trực tiếp

Sao chép thư mục kỹ năng (skills) vào thư mục tác tử của bạn:
```shell
cp -r skills/harness ~/.agent/skills/harness
```

## Sử dụng

Kích hoạt Harness thông qua lệnh slash hoặc ngôn ngữ tự nhiên:

```
/harness Xây dựng harness cho dự án này
Thiết kế đội ngũ tác tử cho lĩnh vực này
Thiết lập harness
```

### Chế độ Thực thi (Tiếp cận Lai)

| Chế độ | Mô tả | Khuyên dùng cho |
|------|-------------|-----------------|
| **Chuyển đổi Vai trò Đơn Tác tử** (mặc định) | Tác tử Chính lần lượt thay đổi Persona bằng cách nạp Knowledge Items được chỉ định trong `task.md`. | Pipeline, Producer-Reviewer, Expert Pool. |
| **Gọi Tác tử Phụ (Subagents)** | Tác tử Chính đóng vai trò là Supervisor (Giám sát) và gọi ra các tác tử phụ xử lý song song. | Fan-out/Fan-in, các tác vụ độc lập cần tính song song cao. |

## Kết quả Đầu ra

Các tệp được tạo bởi Harness:

```
your-project/
├── task.md              # Máy trạng thái điều phối luồng công việc
├── GEMINI.md            # Các con trỏ ngữ cảnh toàn cục (Global context)
└── .agent/
    ├── knowledge/       # Định nghĩa Persona (KI)
    │   ├── analyst_persona.md
    │   ├── builder_persona.md
    │   └── qa_persona.md
    └── skills/          # Các công cụ tùy chỉnh
        ├── analyze/
        │   └── SKILL.md
        └── build/
            ├── SKILL.md
            └── references/
```

## Giấy phép (License)

Apache 2.0
