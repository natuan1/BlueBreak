# Module boundary rules được enforce bằng test, không phải bằng package graph

Issue #1 giả định rằng module graph tự enforce §8: "a `Domain` package that simply cannot import AppKit because it doesn't depend on it". Giả định này **sai**. AppKit, SwiftUI và SwiftData là framework của macOS SDK — mọi target build cho macOS đều import được, bất kể `Package.swift` khai báo dependency gì. SPM chỉ chặn được phần *inter-package* của §8 (Domain không thấy Application, Platform không thấy Features), còn toàn bộ danh sách "Không cho phép" liên quan tới framework hệ thống thì không có gì giữ.

**Quyết định:** Phần §8 mà module graph không giữ được sẽ do một test giữ: `Tests/ArchitectureTests/` quét `import` trong source của từng module và fail khi gặp module bị cấm. Đây là một Xcode test target ở top level, không nằm trong package nào — vì nó khẳng định điều *xuyên qua* cả sáu package, và không package nào có quyền nhìn sang package bên cạnh.

## Sửa đổi so với `raw/architecture.md`

ADR này amend §7 và §8 ở bốn điểm:

1. **Thêm hai luật §8 không liệt kê.** `BlueBreakApplication` bị cấm `AppKit` và `SwiftUI` (§8 chỉ ghi `Application → SwiftData`), và `BlueBreakMac` bị cấm `BlueBreakDomain`, `BlueBreakDesignSystem`. Lý do: Application nằm *dưới* Platform trong graph, ports của nó là thứ giữ domain platform-neutral (§4, §6.3) — một import UI ở đây phá vỡ toàn bộ cách bố trí dù §8 không nói ra. Còn §8 cho app shell đúng bốn dependency; Domain và DesignSystem tới qua Application và Features.

2. **`MenuBar/` nằm ở cả hai tầng.** §7 đặt `MenuBar/` dưới `BlueBreakFeatures`. Nhưng status item là `NSStatusItem` + `NSPopover`, tức AppKit, mà §8 cấm `Feature → NSWindow`. Nên: `BlueBreakFeatures/Sources/MenuBar/` giữ *nội dung* popover (SwiftUI), `BlueBreakPlatformMac/Sources/MenuBar/` giữ *vật chứa* nó. Content đi từ app shell xuống Platform dưới dạng `NSViewController` mờ, nên Platform vẫn không thấy Features. `BlueBreakPlatformMac/Sources/Lifecycle/` là thư mục thêm cùng lý do (§7 không liệt kê nó).

3. **Thư mục con của §7 mọc dần, không tạo trước.** §7 vẽ ~40 thư mục con (`Entities/`, `States/`, `Policies/`, …). Git không track thư mục rỗng, nên tạo trước nghĩa là commit ~40 file placeholder. Thư mục xuất hiện khi code đầu tiên của nó xuất hiện.

4. **`DependencyContainer.swift` và `AppCommands.swift` chưa tồn tại.** §7 liệt kê cả hai trong `App/BlueBreakMac/`. Việc wiring hiện nằm trong `AppCoordinator.swift` — chưa đủ nhiều để tách container, và chưa có menu command nào để `AppCommands` giữ.

## Hệ quả

* §7 vẫn là "cấu trúc **đề xuất**" như chính nó ghi; bốn điểm trên là chỗ code cố tình khác.
* Test này phải **fail được**, không chỉ pass. Nó đã được kiểm chứng bằng cách tạm thêm `import SwiftUI` vào `BlueBreakDomain` và xác nhận test đỏ, chỉ đúng file và dòng.
* Scanner đọc `import` theo dòng, không parse Swift: nó không phân biệt import trong comment hay trong `#if`. Chọn over-report thay vì phải kéo cả một Swift parser vào để giữ đúng.
* Thêm một luật mới vào §8 nghĩa là sửa `ModuleBoundary.all` — bảng luật đó là chỗ duy nhất §8 được encode.
