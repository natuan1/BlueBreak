# Pomodoro là dữ liệu con trong state machine do mandatory-break sở hữu

PRD gọi Pomodoro và mandatory-break threshold là "hai hệ thống liên quan nhưng độc lập", điều này gợi ý hai state machine riêng. Nhưng mandatory-break là hệ thống duy nhất chiếm toàn màn hình (overlay, warning, recovery), nên nó phải là nguồn sự thật cho state machine cấp cao. Ta chọn giữ **một** `SessionState` do mandatory-break sở hữu (inactive → preBreakWarning → forcedBreak → …), và Pomodoro tồn tại như một field dữ liệu con (`PomodoroTimer?`) thread xuyên qua các context, không tự tạo case cấp cao riêng.

Khi forced break bắt đầu, Pomodoro (nếu đang chạy) bị đóng băng; khi overlay đóng, Pomodoro resume từ đúng thời điểm đóng băng (dựa trên deadline, không dựa trên tick). "Độc lập" được hiểu là: không đồng hồ nào reset đồng hồ kia — không phải là hai state machine tách biệt.

**Trade-off đã bỏ qua:** hai state machine độc lập (khớp nghĩa đen PRD hơn) — bị loại vì nhân đôi bề mặt checkpoint/recovery và cần thêm logic phối hợp hiển thị mà không giải quyết vấn đề nghiệp vụ nào mới.
