# "Inactive" đổi nghĩa thành pha-mandatory-break, tách khỏi trạng thái Pomodoro

PRD §10.1 định nghĩa `Inactive` là "không có Pomodoro đang chạy" — một định nghĩa hợp lý khi `SessionState` còn coi Pomodoro và mandatory-break là các case loại trừ nhau. Nhưng ADR-0001 đã biến Pomodoro thành field con, orthogonal với state cấp cao. Hệ quả: state cấp cao (nay gọi là **mandatory-break phase**: idle/warning/forcedBreak/completing/suspended) không còn mang nghĩa "có Pomodoro hay không" — một Pomodoro có thể đang chạy trong khi phase là `idle`.

Điều này lộ ra khi xét state diagram cũ (`ForcedBreak --> Inactive: Emergency exit`): nếu Pomodoro đang bị đóng băng lúc forced break bắt đầu, sau emergency exit phase quay về `idle`, nhưng câu hỏi là Pomodoro có resume hay bị hủy?

**Quyết định:**
1. Đổi tên khái niệm: state cấp cao là **mandatory-break phase**, không còn gọi là "Inactive = không Pomodoro". `idle` phase chỉ nói về mandatory-break, không nói gì về Pomodoro.
2. Sau emergency exit, Pomodoro sub-field (nếu có) **resume** từ đúng điểm bị đóng băng — nhất quán với hành vi khi forced break hoàn thành bình thường. Emergency exit chỉ đóng overlay, không hủy Pomodoro; FR-10 không đề cập việc hủy Pomodoro.

**Trade-off đã bỏ qua:** hủy/reset Pomodoro khi emergency exit (vì đây là tình huống bất thường) — bị loại vì tạo hành vi bất ngờ (người dùng bị "phạt" thêm bằng việc mất luôn phiên focus đang làm), không có cơ sở trong PRD.
