# Countdown khi app đang chạy dùng monotonic clock, không dùng wall clock

Kiến trúc §17.3 minh họa `remaining = deadline - clock.now()` mà không chỉ rõ dùng clock nào, trong khi `ForcedBreakContext`/`FocusContext` lưu deadline dưới dạng `Date` (wall clock). Điều này mở lỗ hổng: người dùng chỉnh giờ hệ thống lùi lại có thể vô hiệu hóa forced break vĩnh viễn (remaining time không bao giờ về 0), hoặc chỉnh tới để skip break ngay lập tức — đi ngược mục đích "mandatory" của sản phẩm. Đây cũng là nguyên nhân của edge case "người dùng chỉnh đồng hồ hệ thống" (PRD §18) mà chưa có hướng xử lý.

**Quyết định:** trong một process run liên tục (app không restart), remaining time được tính bằng **monotonic clock**: tại thời điểm bắt đầu (focus/warning/forced break), lưu một `ContinuousClock.Instant` mốc và một `Duration` mục tiêu; remaining = `duration - (monotonicNow() - startInstant)`. Wall-clock `Date` deadline chỉ được lưu để:
1. Hiển thị/log cho người dùng (ví dụ "kết thúc lúc 14:32").
2. Phục hồi sau khi app restart hoặc crash — khi đó monotonic instant cũ không còn ý nghĩa (reference bị reset), nên buộc phải dùng lại wall-clock deadime đã persist trong checkpoint.

Vì vậy mỗi context thời gian cần **cả hai**: `monotonicStartedAt: ContinuousClock.Instant` (chỉ dùng trong RAM, không persist) và `wallClockDeadline: Date` (persist, dùng cho recovery/hiển thị). Việc chỉnh giờ hệ thống giữa lúc app đang chạy không ảnh hưởng đến remaining time; nó chỉ ảnh hưởng đến giá trị wall-clock hiển thị và đến kết quả recovery nếu app khởi động lại ngay sau khi giờ bị chỉnh (rủi ro dư này chấp nhận được vì phạm vi hẹp hơn nhiều so với lỗ hổng ban đầu).

**Trade-off đã bỏ qua:** dùng thuần wall clock như minh họa gốc trong §17.3 — bị loại vì tạo lỗ hổng lách mandatory break.
