# "Natural break" được phát hiện qua idle stream, không qua trạng thái Pomodoro

PRD FR-06 cho phép một "break tự nhiên dài ít nhất 10 phút" reset active cycle nếu người dùng bật tùy chọn. Từ "tự nhiên" gợi ý gắn với Pomodoro break (short/long break), nhưng người dùng không dùng Pomodoro (ví dụ nhóm "làm việc tại nhà" trong PRD 6.1–6.3) cũng cần được hưởng cơ chế này.

**Quyết định:** natural break = một khoảng idle liên tục ≥ `naturalBreakMinimum` (mặc định 10 phút), phát hiện qua `ActivityObservation` stream sẵn có — độc lập với việc Pomodoro đang ở pha nào. Nếu người dùng "ở trong" Pomodoro break nhưng vẫn gõ phím, thời gian đó không được tính là natural break.

**Lý do:** tái dùng hạ tầng activity tracking đã có, không cần domain biết về Pomodoro; đúng với ADR-0001 (Pomodoro là dữ liệu con, không nên là điều kiện của policy cấp cao trong mandatory-break).
