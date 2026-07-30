# BlueBreak

Ứng dụng menu bar macOS nhắc nghỉ theo phong cách "system crash parody". Theo dõi thời gian người dùng thực sự hoạt động, rồi ép nghỉ toàn màn hình khi vượt ngưỡng; chống đối trong lúc nghỉ sẽ bị cộng thêm thời gian.

## Language

**Mandatory-break system**:
Hệ thống ép nghỉ dựa trên active time. Đây là hệ **sở hữu state machine cấp cao** và là thứ duy nhất chiếm màn hình.
_Avoid_: break engine (quá rộng)

**Mandatory-break phase**:
Case cấp cao của state machine (idle / preBreakWarning / forcedBreak / completing / suspended). Chỉ mô tả trạng thái của mandatory-break system — **không** mô tả Pomodoro có đang chạy hay không. Ví dụ: phase có thể là `idle` trong khi Pomodoro vẫn đang chạy.
_Avoid_: Inactive, SessionState (tên cũ, ngầm giả định phase = có/không Pomodoro — không còn đúng sau ADR-0001)

**Pomodoro**:
Đồng hồ đếm ngược focus do người dùng chủ động bật. Là **dữ liệu con**, orthogonal với mandatory-break phase, không tự điều khiển phase cấp cao. Bị đóng băng khi forced break bắt đầu, resume khi overlay đóng (kể cả qua emergency exit). Không đồng hồ nào reset đồng hồ kia.
_Avoid_: Focus session (dùng khi nói tới một lần chạy Pomodoro cụ thể thì được, nhưng không dùng như một top-level state)

**Active time**:
Thời gian người dùng thực sự tương tác với máy (chuột/trackpad/bàn phím). Không tính khi idle, sleep, hoặc màn hình khóa.

**Active cycle**:
Khoảng tích lũy active time từ lần reset gần nhất đến forced break kế tiếp. Reset theo reset policy.

**Mandatory break threshold**:
Tổng active time cần đạt để kích hoạt forced break. Mặc định 120 phút.

**Forced break**:
Phiên nghỉ bắt buộc, overlay toàn màn hình. Khác với "break" của Pomodoro.
_Avoid_: Break (một mình chữ "break" quá nhập nhằng — luôn nói rõ "forced break" hay "Pomodoro break")

**Pomodoro break**:
Short break / long break trong chu kỳ Pomodoro. Nhẹ, không chiếm màn hình.

**Natural break**:
Một khoảng liên tục ở status `.idle`, `.locked` hoặc `.sleeping` (không phải `.active`) dài ≥ **natural break minimum** (mặc định 10 phút) — phát hiện qua activity tracking, không phụ thuộc Pomodoro. Khác với `SleepBreakPolicy` (chi phối việc sleep/lock có hoàn thành một forced break *đang diễn ra* hay không): natural break trả lời câu hỏi riêng — có được reset active cycle khi *chưa* có forced break nào xảy ra hay không.
_Avoid_: Pomodoro break (không đồng nghĩa — một Pomodoro break chỉ tính là natural break nếu người dùng thực sự idle trong lúc đó)

**Idle threshold** (vs **Natural break minimum**):
Hai ngưỡng khác mục đích, dễ nhầm. **Idle threshold** (mặc định 5 phút, chọn 1–15 phút): cắt một đoạn active time thành "kết thúc" khi không có input — dùng để tính active time chính xác. **Natural break minimum** (mặc định 10 phút): ngưỡng riêng, dài hơn, quyết định một khoảng idle có "đủ nghỉ" để reset active cycle hay không. Đừng dùng chung một giá trị cho cả hai mục đích.

**Emergency exit cooldown**:
Khoảng thời gian (mặc định 5 phút) sau emergency exit trong đó mandatory-break phase giữ ở `idle`, không tự kích hoạt lại `preBreakWarning` dù active time đã vượt threshold. Hết cooldown mà vẫn vượt threshold thì nhảy thẳng vào `forcedBreak`, bỏ qua warning.

**Penalty interaction**:
Thao tác chuột/trackpad/phím bị tính là chống đối trong forced break, làm cộng thêm thời gian nghỉ.
