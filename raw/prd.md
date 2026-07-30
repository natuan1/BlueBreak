# PRODUCT REQUIREMENTS DOCUMENT

# BlueBreak for macOS

**Tên tạm thời:** BlueBreak
**Phiên bản tài liệu:** 1.0
**Nền tảng:** macOS
**Trạng thái:** Draft for Development
**Mô hình sản phẩm:** Menu bar application
**Định hướng:** Native macOS, local-first, privacy-first
**Tech stack dự kiến:** Swift, SwiftUI, AppKit
**Ngôn ngữ MVP:** English
**Ngôn ngữ bổ sung:** Vietnamese

---

# 1. Tổng quan sản phẩm

BlueBreak là một ứng dụng Pomodoro và nhắc nghỉ dành cho macOS.

Ứng dụng theo dõi thời gian người dùng thực sự hoạt động trên máy. Khi người dùng làm việc liên tục hoặc tích lũy đủ một khoảng thời gian được cấu hình, BlueBreak hiển thị một màn hình nghỉ toàn màn hình theo phong cách “system crash parody”.

Màn hình này thông báo rằng người dùng đã ngồi hoặc làm việc quá lâu và cần đứng dậy vận động.

Điểm khác biệt chính của BlueBreak là cơ chế “troll có kiểm soát”:

* Màn hình nghỉ được thiết kế giống một lỗi hệ thống giả.
* Nếu người dùng tiếp tục click chuột hoặc thao tác trong thời gian nghỉ, thời gian nghỉ sẽ bị cộng thêm.
* Mỗi thao tác chống đối sẽ tạo animation, âm thanh và thông báo hài hước.
* Người dùng được cảnh báo trước để có thời gian lưu công việc hoặc chủ động nghỉ.
* Ứng dụng không khóa hệ thống, không ngăn Task Manager tương đương trên macOS và không can thiệp vào các chức năng bảo mật của hệ điều hành.

BlueBreak không phải phần mềm kiểm soát người dùng. Đây là một ứng dụng productivity mang tính giải trí, giúp người dùng hình thành thói quen nghỉ ngơi bằng một trải nghiệm đẹp, hài hước và có tính lan truyền.

---

# 2. Tuyên bố vấn đề

Nhiều người dùng máy tính làm việc liên tục trong nhiều giờ mà không đứng dậy, uống nước hoặc nghỉ mắt.

Các ứng dụng Pomodoro hiện tại thường gặp một trong các vấn đề sau:

* Giao diện đơn giản, thiếu cảm xúc.
* Thông báo quá dễ bỏ qua.
* Không phân biệt thời gian ứng dụng chạy và thời gian người dùng thực sự hoạt động.
* Trải nghiệm nhắc nghỉ nhàm chán.
* Không tạo đủ động lực để người dùng thực sự rời khỏi máy.
* Không có yếu tố giải trí hoặc khả năng chia sẻ trên mạng xã hội.

BlueBreak giải quyết vấn đề này bằng cách biến việc nghỉ giải lao thành một sự kiện trực quan, khó bỏ qua nhưng vẫn an toàn và cho phép người dùng kiểm soát.

---

# 3. Tầm nhìn sản phẩm

BlueBreak trở thành ứng dụng nhắc nghỉ đẹp nhất trên macOS, kết hợp giữa:

* Productivity.
* Digital wellbeing.
* Humor.
* Premium animation.
* Native macOS experience.

Ứng dụng phải tạo được phản ứng:

> “Ứng dụng này đang troll tôi, nhưng nó đẹp đến mức tôi không muốn gỡ.”

---

# 4. Mục tiêu sản phẩm

## 4.1. Mục tiêu chính

* Giúp người dùng chủ động nghỉ sau một khoảng thời gian làm việc.
* Tạo trải nghiệm Pomodoro trực quan và hấp dẫn.
* Khiến thông báo nghỉ khó bị bỏ qua hơn notification thông thường.
* Tạo một sản phẩm có khả năng viral thông qua video và screenshot.
* Hoạt động ổn định dưới dạng menu bar application.
* Không yêu cầu tài khoản trong MVP.
* Không gửi dữ liệu hoạt động ra khỏi máy.
* Không làm mất dữ liệu hoặc ảnh hưởng đến công việc đang mở.

## 4.2. Chỉ số thành công ban đầu

* Tỷ lệ người dùng hoàn thành onboarding lớn hơn 80%.
* Tỷ lệ người dùng bật Launch at Login lớn hơn 40%.
* Tỷ lệ người dùng hoàn thành ít nhất một phiên nghỉ mỗi ngày lớn hơn 30%.
* Tỷ lệ crash-free session lớn hơn 99,5%.
* CPU trung bình khi chạy nền nhỏ hơn 2%.
* Memory khi chạy nền nhỏ hơn 150 MB.
* Màn hình nghỉ xuất hiện đúng thời điểm trong ít nhất 99% trường hợp kiểm thử.
* Không có trường hợp ứng dụng gây mất dữ liệu người dùng.

---

# 5. Ngoài phạm vi MVP

Phiên bản MVP không bao gồm:

* Đồng bộ cloud.
* Đăng nhập tài khoản.
* Team workspace.
* Quản lý nhân viên.
* Theo dõi ứng dụng hoặc website mà người dùng sử dụng.
* Ghi lại nội dung bàn phím.
* Chụp màn hình.
* Phân tích năng suất bằng AI.
* Mobile application.
* Apple Watch application.
* Windows version.
* Social feed.
* Marketplace theme.
* Hệ thống achievement phức tạp.
* Subscription server-side.
* Remote configuration.
* Chặn hoàn toàn việc thoát ứng dụng.
* Ngăn người dùng mở Activity Monitor.
* Ngăn Force Quit.
* Giả lập chính xác kernel panic thật của macOS.

---

# 6. Đối tượng người dùng

## 6.1. Lập trình viên

Đặc điểm:

* Làm việc trên máy nhiều giờ.
* Thường quên nghỉ.
* Có xu hướng bỏ qua notification.
* Thích sản phẩm có thiết kế đẹp và yếu tố hài hước.

Nhu cầu:

* Timer không làm gián đoạn quá nhiều.
* Theo dõi thời gian hoạt động chính xác.
* Có cảnh báo trước khi màn hình nghỉ xuất hiện.
* Có thể tạm hoãn khi đang deploy hoặc xử lý sự cố.

## 6.2. Designer và content creator

Đặc điểm:

* Làm việc tập trung trong thời gian dài.
* Có nhiều màn hình.
* Quan tâm mạnh đến UI và animation.

Nhu cầu:

* Ứng dụng phải có visual chất lượng cao.
* Không ảnh hưởng đến phần mềm thiết kế hoặc render.
* Có thể tạm dừng khi trình chiếu hoặc export.

## 6.3. Người làm việc tại nhà

Đặc điểm:

* Không có đồng nghiệp nhắc nghỉ.
* Thường ngồi liên tục nhiều giờ.
* Muốn tạo thói quen vận động.

Nhu cầu:

* Thiết lập đơn giản.
* Có lịch sử sử dụng cơ bản.
* Có thể tùy chỉnh thời gian làm việc và nghỉ.

---

# 7. Nguyên tắc sản phẩm

## 7.1. Troll nhưng phải an toàn

Ứng dụng được phép gây bất ngờ và tạo cảm giác bị “phạt”, nhưng không được:

* Giả mạo hoàn toàn thông báo hệ thống thật.
* Khóa hệ điều hành.
* Ngăn người dùng truy cập chức năng bảo mật.
* Gây mất dữ liệu.
* Làm hỏng tiến trình đang chạy.
* Thu thập nội dung thao tác.
* Cố tình ngăn người dùng gỡ ứng dụng.
* Gây âm thanh lớn đột ngột theo mặc định.

## 7.2. Luôn cho người dùng biết đây là BlueBreak

Màn hình nghỉ bắt buộc phải hiển thị ít nhất một trong các thành phần:

* Logo BlueBreak.
* Tên BlueBreak.
* Dòng chữ “Break enforced by BlueBreak”.
* Nút trợ giúp giải thích đây là màn hình nghỉ giả.

## 7.3. Local-first

MVP phải lưu toàn bộ dữ liệu trên máy:

* Cài đặt.
* Lịch sử phiên.
* Số lần bị phạt.
* Thống kê theo ngày.
* Trạng thái onboarding.

Không gửi dữ liệu ra ngoài nếu chưa có sự đồng ý rõ ràng của người dùng.

## 7.4. Native macOS

Ứng dụng phải:

* Tôn trọng Dark Mode và Light Mode.
* Hoạt động tốt trên Retina display.
* Hỗ trợ nhiều màn hình.
* Tương thích với Spaces.
* Tương thích với Stage Manager.
* Hỗ trợ Reduce Motion.
* Hỗ trợ Reduce Transparency khi có thể.
* Có menu bar interaction đúng hành vi macOS.

---

# 8. Thuật ngữ nghiệp vụ

## Active time

Khoảng thời gian người dùng thực sự tương tác với máy thông qua chuột, trackpad hoặc bàn phím.

## Idle time

Khoảng thời gian không có tương tác từ người dùng vượt quá ngưỡng được cấu hình.

## Focus session

Phiên Pomodoro do người dùng chủ động bắt đầu.

## Mandatory break threshold

Tổng active time cần đạt trước khi kích hoạt phiên nghỉ bắt buộc.

Mặc định: 120 phút.

## Pre-break warning

Thông báo xuất hiện trước khi phiên nghỉ bắt buộc bắt đầu.

## Forced break

Màn hình nghỉ toàn màn hình xuất hiện trong một khoảng thời gian được cấu hình.

## Penalty interaction

Thao tác chuột, trackpad hoặc bàn phím được tính là hành vi chống đối trong phiên nghỉ.

## Penalty duration

Số thời gian được cộng thêm sau mỗi penalty interaction.

Mặc định: 1 phút.

## Maximum penalty

Tổng thời gian phạt tối đa có thể được cộng trong một phiên nghỉ.

Mặc định: 10 phút.

## Emergency exit

Cơ chế cho phép người dùng thoát khỏi màn hình nghỉ trong tình huống cần thiết.

---

# 9. Luồng người dùng tổng quát

```text
Khởi động ứng dụng
        ↓
Chưa onboarding?
        ↓ Có
Hiển thị onboarding
        ↓
Cấu hình thời gian làm việc và mức độ troll
        ↓
Yêu cầu quyền cần thiết
        ↓
Ứng dụng chạy ở menu bar
        ↓
Theo dõi active time
        ↓
Sắp đạt mandatory break threshold
        ↓
Hiển thị pre-break warning
        ↓
Người dùng nghỉ ngay / hoãn / không phản hồi
        ↓
Forced break xuất hiện
        ↓
Người dùng không thao tác
        ↓
Countdown kết thúc
        ↓
Overlay biến mất
        ↓
Active time được reset
```

Trường hợp chống đối:

```text
Forced break đang hoạt động
        ↓
Người dùng click hoặc nhấn phím
        ↓
Penalty hợp lệ?
        ↓ Có
Cộng thêm thời gian
        ↓
Hiển thị animation + troll message
        ↓
Tiếp tục countdown
```

---

# 10. State machine

Ứng dụng phải có một state machine trung tâm.

```swift
enum SessionState {
    case inactive
    case focusing
    case focusPaused
    case preBreakWarning
    case forcedBreak
    case breakPaused
    case completing
    case suspended
}
```

## 10.1. Inactive

Trạng thái mặc định khi:

* Không có Pomodoro đang chạy.
* Không có warning.
* Không có forced break.

Ứng dụng vẫn có thể theo dõi active time nền.

## 10.2. Focusing

Một Pomodoro đang chạy.

Dữ liệu cần có:

* Thời điểm bắt đầu.
* Thời lượng đã cấu hình.
* Thời gian còn lại.
* Active time.
* Tổng thời gian pause.

## 10.3. FocusPaused

Pomodoro được tạm dừng thủ công.

Trong trạng thái này:

* Pomodoro countdown dừng.
* Mandatory active time có thể tiếp tục hoặc dừng tùy cấu hình.
* Mặc định: mandatory active time vẫn tiếp tục.

## 10.4. PreBreakWarning

Người dùng đã gần đạt ngưỡng nghỉ bắt buộc.

Người dùng có thể:

* Bắt đầu nghỉ ngay.
* Hoãn.
* Tắt riêng cảnh báo hiện tại.
* Mở settings.

## 10.5. ForcedBreak

Overlay nghỉ đang hiển thị.

Trong trạng thái này:

* Hiển thị countdown.
* Ghi nhận penalty interaction.
* Chặn tương tác với desktop bằng overlay, nhưng không chặn các chức năng hệ thống cấp cao.
* Cho phép emergency exit.

## 10.6. Completing

Animation hoàn thành phiên nghỉ đang chạy.

Thời lượng khuyến nghị: 1–3 giây.

## 10.7. Suspended

Sử dụng khi:

* Máy sleep.
* Người dùng logout.
* Fast user switching.
* Ứng dụng bị macOS suspend.
* Màn hình đang khóa.

---

# 11. Yêu cầu chức năng

# FR-01: Onboarding

Ứng dụng phải có onboarding cho lần chạy đầu tiên.

## Màn hình 1: Giới thiệu

Hiển thị:

* Tên sản phẩm.
* Mô tả ngắn.
* Preview animation.
* Nút Continue.

Nội dung gợi ý:

> BlueBreak helps you focus, then forces you to remember that you have a body.

## Màn hình 2: Chọn chế độ

Cho phép chọn:

### Gentle

* Chỉ cảnh báo.
* Không cộng thời gian khi click.
* Có thể bỏ qua break.

### Annoying

* Full-screen break.
* Click cộng thời gian.
* Animation troll.
* Có emergency exit.

### Unhinged

* Full-screen break.
* Glitch effect mạnh hơn.
* Troll message đa dạng.
* Có âm thanh.
* Mouse và keyboard có thể tạo penalty.

### Custom

Người dùng tự cấu hình.

Mặc định đề xuất: Annoying.

## Màn hình 3: Thiết lập thời gian

Các giá trị:

* Focus duration: 25 phút.
* Short break: 5 phút.
* Long break: 15 phút.
* Mandatory break threshold: 120 phút.
* Forced break duration: 5 phút.
* Warning before break: 10 phút.
* Penalty per interaction: 1 phút.
* Maximum penalty: 10 phút.

## Màn hình 4: Quyền truy cập

Ứng dụng phải giải thích rõ từng quyền trước khi yêu cầu.

MVP ưu tiên không yêu cầu Accessibility nếu overlay có thể nhận input trực tiếp.

Có thể cần:

* Notifications.
* Launch at Login.
* Quyền input monitoring nếu phiên bản sau sử dụng global event tap.

## Màn hình 5: Hoàn tất

Hiển thị:

* Cấu hình tóm tắt.
* Nút Start BlueBreak.
* Tùy chọn Launch at Login.

## Acceptance criteria

* Người dùng có thể hoàn tất onboarding mà không cần tài khoản.
* Người dùng có thể quay lại bước trước.
* Cài đặt được lưu ngay sau khi hoàn tất.
* Onboarding không xuất hiện lại trừ khi reset settings.

---

# FR-02: Menu bar application

BlueBreak phải chạy dưới dạng menu bar application.

Menu bar icon cần thể hiện các trạng thái:

* Idle.
* Focus đang chạy.
* Gần đến break.
* Forced break.
* Paused.

Khi click icon, hiển thị popover gồm:

* Thời gian Pomodoro còn lại.
* Active time hôm nay.
* Thời gian còn lại đến mandatory break.
* Start Focus.
* Pause hoặc Resume.
* Take Break Now.
* Open Dashboard.
* Settings.
* Quit BlueBreak.

## Acceptance criteria

* Popover mở trong vòng 200 ms sau khi click.
* Trạng thái timer cập nhật tối thiểu mỗi giây.
* Menu bar không làm tăng CPU đáng kể.
* Có thể điều khiển phiên focus mà không cần mở dashboard.

---

# FR-03: Dashboard

Dashboard là cửa sổ chính của ứng dụng.

Dashboard cần hiển thị:

* Timer chính.
* Trạng thái phiên.
* Active time hôm nay.
* Thời gian còn lại đến forced break.
* Nút Start, Pause, Resume và Stop.
* Cài đặt nhanh.
* Số phiên nghỉ đã hoàn thành hôm nay.
* Số penalty interaction hôm nay.

Dashboard không được giống một bảng điều khiển doanh nghiệp. Giao diện phải tối giản, tập trung vào timer và animation trung tâm.

## Timer visual

Có thể sử dụng một trong các hình thức:

* Liquid orb.
* Energy sphere.
* Mesh gradient ring.
* Animated glass object.

Timer visual phải:

* Phản ứng theo trạng thái.
* Không gây phân tâm quá mức.
* Chạy ổn định ở 60 FPS.
* Hỗ trợ Reduce Motion.

---

# FR-04: Pomodoro timer

Người dùng có thể:

* Bắt đầu phiên focus.
* Pause.
* Resume.
* Stop.
* Skip sang break.
* Điều chỉnh thời gian trước khi bắt đầu.

Các preset:

* 25/5.
* 50/10.
* 90/20.
* Custom.

Khi focus kết thúc:

* Phát âm báo nếu được bật.
* Hiển thị notification.
* Chuyển sang break thường hoặc forced break tùy trạng thái active time.

Pomodoro và mandatory break threshold là hai hệ thống liên quan nhưng độc lập.

Ví dụ:

* Người dùng không sử dụng Pomodoro vẫn có thể bị kích hoạt forced break.
* Người dùng hoàn thành Pomodoro nhưng bỏ qua break nhiều lần vẫn có thể đạt mandatory threshold.

## Acceptance criteria

* Timer không sai lệch quá 1 giây trong một phiên 60 phút.
* Timer phục hồi chính xác sau sleep/wake.
* Timer không dựa hoàn toàn vào việc cộng hoặc trừ mỗi giây.
* Timer phải tính từ timestamp thực tế để tránh drift.

---

# FR-05: Activity tracking

Ứng dụng phải đo active time dựa trên tương tác của người dùng.

Không được ghi lại:

* Nội dung phím.
* Vị trí click chi tiết cho mục đích analytics.
* Nội dung ứng dụng đang sử dụng.
* Tên tài liệu đang mở.
* Website đang truy cập.

## Quy tắc mặc định

* Nếu không có input trong 5 phút, người dùng được xem là idle.
* Thời gian idle không được tính vào mandatory active time.
* Khi người dùng hoạt động trở lại, active time tiếp tục.
* Khi màn hình khóa, active time tạm dừng.
* Khi máy sleep, active time tạm dừng.

## Cấu hình

Người dùng có thể đặt idle threshold:

* 1 phút.
* 3 phút.
* 5 phút.
* 10 phút.
* 15 phút.

Mặc định: 5 phút.

## Acceptance criteria

* Không tính thời gian sleep.
* Không tính thời gian màn hình khóa.
* Không tăng active time khi không có tương tác.
* Activity tracking không yêu cầu ghi lại nội dung bàn phím.

---

# FR-06: Mandatory break threshold

Ứng dụng phải theo dõi tổng active time kể từ forced break hợp lệ gần nhất.

Mặc định:

* Threshold: 120 phút.
* Minimum: 20 phút.
* Maximum: 480 phút.

Người dùng có thể lựa chọn:

* Reset active time sau forced break hoàn thành.
* Reset sau bất kỳ break nào dài hơn một khoảng thời gian.
* Không reset nếu break bị emergency exit.

Mặc định:

* Chỉ reset khi forced break hoàn thành.
* Break tự nhiên dài ít nhất 10 phút có thể reset threshold nếu người dùng bật tùy chọn.

---

# FR-07: Pre-break warning

Ứng dụng phải cảnh báo trước forced break.

Các mốc mặc định:

* 10 phút trước.
* 5 phút trước.
* 1 phút trước.

Không nhất thiết hiển thị cả ba nếu người dùng đã tương tác với cảnh báo đầu tiên.

Cảnh báo có thể xuất hiện dưới dạng:

* macOS notification.
* Floating mini-window.
* Menu bar animation.
* Countdown pill ở góc màn hình.

Nội dung ví dụ:

> Mandatory human maintenance begins in 10 minutes.

Các hành động:

* Take Break Now.
* Snooze.
* Dismiss Warning.
* Open Settings.

## Snooze

Người dùng có thể hoãn forced break.

Cấu hình:

* 5 phút.
* 10 phút.
* 15 phút.
* Custom.

Giới hạn mặc định:

* Tối đa 2 lần snooze cho mỗi chu kỳ.
* Tổng snooze không vượt quá 30 phút.

Nếu hết số lần snooze, nút Snooze bị vô hiệu hóa và giải thích lý do.

## Tắt cảnh báo trước

Người dùng có thể:

* Tắt riêng âm thanh cảnh báo.
* Tắt floating warning.
* Giữ notification.
* Tắt toàn bộ warning.

Nếu tắt toàn bộ warning, settings phải hiển thị cảnh báo rằng forced break có thể xuất hiện bất ngờ.

---

# FR-08: Forced break overlay

Khi forced break bắt đầu, ứng dụng phải tạo một overlay riêng cho mỗi màn hình đang kết nối.

Overlay phải:

* Borderless.
* Bao phủ toàn màn hình.
* Xuất hiện trên tất cả Spaces phù hợp.
* Hoạt động trên màn hình Retina.
* Phản ứng khi cắm hoặc rút màn hình.
* Hiển thị cùng countdown trên tất cả màn hình.
* Có animation xuất hiện.
* Không sao chép chính xác kernel panic thật.

## Nội dung bắt buộc

* Tên hoặc logo BlueBreak.
* Countdown.
* Thông điệp yêu cầu đứng dậy.
* Giải thích thao tác sẽ cộng thời gian nếu penalty đang bật.
* Tổng thời gian đã bị cộng.
* Cách sử dụng emergency exit.

## Nội dung trang trí

Ví dụ:

```text
Your body encountered a fatal exception.

Reason:
TooMuchSittingException

Recovery action:
Stand up and move for 04:38
```

Thông số giả:

```text
Spine Integrity        14%
Eye Comfort             3%
Hydration Driver     Missing
Outside Exposure       0 min
```

## Khi forced break kết thúc

* Countdown về 0.
* Input penalty bị tắt ngay lập tức.
* Chạy completion animation.
* Đóng toàn bộ overlay.
* Reset active time theo policy.
* Lưu session history.
* Hiển thị thông báo hoàn thành tùy cấu hình.

---

# FR-09: Penalty interaction

Khi forced break đang hoạt động, ứng dụng có thể ghi nhận các thao tác sau:

* Left click.
* Right click.
* Trackpad tap.
* Scroll.
* Key press.
* Trackpad gesture.

MVP mặc định chỉ tính:

* Left click.
* Right click.
* Trackpad tap.

Keyboard penalty mặc định bị tắt.

## Quy tắc penalty

Mặc định:

* Mỗi thao tác hợp lệ cộng 1 phút.
* Debounce: 500 ms.
* Maximum penalty: 10 phút.
* Không cộng thêm khi đã đạt maximum penalty.
* Không cộng penalty cho emergency shortcut.
* Không cộng nhiều lần cho một lần giữ phím.
* Không cộng theo từng pixel scroll.

## Phản hồi khi bị phạt

Ứng dụng phải:

* Hiển thị `+1:00`.
* Làm timer animation thay đổi.
* Hiển thị một troll message.
* Có thể phát sound effect.
* Rung hoặc glitch nhẹ.
* Cập nhật tổng penalty.

Troll message ví dụ:

* Nice try.
* Resistance detected.
* Every click makes me stronger.
* You could have been stretching.
* Mouse privileges revoked.
* This could have ended one minute earlier.
* Your productivity has been converted into cardio debt.
* The keyboard cannot save you.

## Acceptance criteria

* Một double-click không được tạo quá hai penalty.
* Giữ chuột không tạo penalty liên tục.
* Penalty không vượt maximum.
* Countdown mới được cập nhật ngay lập tức.
* Không ghi lại phím người dùng đã nhấn.

---

# FR-10: Emergency exit

Ứng dụng phải có emergency exit.

Mục đích:

* Cho phép xử lý cuộc gọi khẩn cấp.
* Cho phép thực hiện công việc quan trọng.
* Tránh cảm giác ứng dụng đang khóa máy.
* Tuân thủ nguyên tắc an toàn.

Phương thức đề xuất:

* Giữ tổ hợp `Command + Shift + Escape` trong 5 giây.
* Hoặc nhấn một nút nhỏ được hiển thị sau khi giữ phím Option.
* Có thể yêu cầu xác nhận.

Khi emergency exit được sử dụng:

* Overlay đóng.
* Phiên được đánh dấu `aborted`.
* Active time không reset theo mặc định.
* Có thể áp dụng cooldown 5 phút trước khi nhắc lại.
* Không được cộng penalty từ thao tác emergency exit.

Ứng dụng không được:

* Chặn Force Quit.
* Chặn đăng xuất.
* Chặn khóa màn hình.
* Chặn Restart hoặc Shut Down.

---

# FR-11: Pause và chế độ đặc biệt

Người dùng có thể tạm dừng mandatory break system trong các tình huống:

* Presentation.
* Screen sharing.
* Meeting.
* Gaming.
* Rendering.
* Watching full-screen video.
* Manual pause.

Các preset:

* 15 phút.
* 30 phút.
* 1 giờ.
* 2 giờ.
* Until tomorrow.
* Custom.

Khi pause:

* Menu bar icon phải hiển thị trạng thái pause.
* Người dùng phải thấy thời gian còn lại.
* Ứng dụng tự động resume khi hết thời gian.
* Active time trong pause có thể vẫn được tính hoặc bỏ qua theo cấu hình.

Mặc định:

* Manual pause không tính active time.
* Presentation mode không tính active time.
* Không tự động phát hiện meeting trong MVP.

---

# FR-12: Multi-display

Ứng dụng phải hỗ trợ:

* MacBook display.
* External monitor.
* Nhiều external monitor.
* Màn hình có scale khác nhau.
* Display rotation.
* Display connect/disconnect trong khi break đang chạy.

Mỗi display có một overlay riêng.

Overlay phụ có thể hiển thị:

* Countdown đầy đủ.
* Hoặc visual đơn giản hơn để giảm GPU.

Mặc định tất cả display hiển thị cùng nội dung.

Khi một display mới được kết nối trong forced break:

* Overlay phải xuất hiện trên display đó trong vòng 1 giây.

Khi display bị ngắt:

* Overlay tương ứng được giải phóng.
* Countdown chung không bị ảnh hưởng.

---

# FR-13: Settings

Settings phải được chia thành các nhóm.

## General

* Launch at Login.
* Show Dock icon.
* Show menu bar icon.
* Start minimized.
* Language.
* Theme.
* Sound volume.

## Pomodoro

* Focus duration.
* Short break duration.
* Long break duration.
* Number of focus sessions before long break.
* Auto-start break.
* Auto-start focus.

## Mandatory Break

* Enable mandatory break.
* Active time threshold.
* Forced break duration.
* Idle threshold.
* Reset policy.
* Snooze duration.
* Maximum snooze count.

## Penalty

* Enable click penalty.
* Enable keyboard penalty.
* Penalty duration.
* Debounce duration.
* Maximum penalty.
* Sound effect.
* Troll message intensity.

## Warning

* Enable notifications.
* Enable floating warning.
* Warning milestones.
* Warning sound.
* Allow Snooze.

## Appearance

* Overlay theme.
* Animation intensity.
* Glitch intensity.
* Reduce flashing.
* Reduce Motion.
* Timer visual.
* Font size.

## Privacy

* View stored data.
* Export local data.
* Delete history.
* Reset application.
* Privacy explanation.

## Advanced

* Emergency shortcut.
* Debug information.
* Reset onboarding.
* Export diagnostics.
* Disable overlays temporarily.

---

# FR-14: Themes

MVP cần tối thiểu ba theme.

## Theme 1: Blue Screen

Phong cách:

* Xanh đậm.
* Monospace typography.
* Fake error details.
* Glitch nhẹ.
* Scanline nhẹ.

## Theme 2: Kernel Panic for Humans

Phong cách:

* Đen và xám.
* Log hệ thống giả.
* Typographic animation.
* Ít màu.
* Mang cảm giác macOS parody.

## Theme 3: Biological System Failure

Phong cách:

* Gradient đỏ, cam hoặc tím.
* Các chỉ số cơ thể giả.
* Hình ảnh dạng medical HUD.
* Có thể dùng fluid animation.

Theme phải dùng chung layout nghiệp vụ:

* Countdown.
* Message.
* Penalty information.
* Emergency exit.
* BlueBreak branding.

---

# FR-15: Sound

Ứng dụng có thể phát các nhóm âm thanh:

* Focus start.
* Focus complete.
* Warning.
* Forced break start.
* Penalty.
* Break complete.

Yêu cầu:

* Âm lượng riêng trong ứng dụng.
* Có nút mute.
* Mặc định không phát âm thanh quá lớn.
* Không phát âm thanh gây hoảng sợ.
* Tôn trọng Reduce Loud Sounds khi có thể.
* Không phát penalty sound liên tục nếu người dùng spam click.

Có rate limit cho sound effect:

* Tối đa một penalty sound mỗi 500 ms.

---

# FR-16: Statistics

MVP chỉ cần thống kê local cơ bản.

Hiển thị theo ngày:

* Tổng active time.
* Số Pomodoro hoàn thành.
* Số break hoàn thành.
* Số forced break.
* Số penalty interaction.
* Tổng penalty duration.
* Số emergency exit.
* Longest uninterrupted work period.

Không sử dụng các thông điệp gây tội lỗi quá mức.

Ví dụ tốt:

> You completed 4 breaks today.

Không nên:

> You failed to protect your health three times.

---

# FR-17: Session history

Mỗi session cần lưu:

```text
id
type
startedAt
endedAt
plannedDuration
actualDuration
activeDuration
penaltyCount
penaltyDuration
snoozeCount
completionStatus
theme
emergencyExitUsed
```

`completionStatus` gồm:

* completed.
* skipped.
* aborted.
* interrupted.
* crashed.

Lịch sử mặc định lưu tối đa 90 ngày.

Người dùng có thể:

* Xóa toàn bộ.
* Chọn retention period.
* Tắt lưu history.

---

# FR-18: Launch at Login

Người dùng có thể bật hoặc tắt Launch at Login.

Yêu cầu:

* Không tự bật khi chưa được người dùng đồng ý.
* Cho phép bật trong onboarding.
* Có thể thay đổi trong settings.
* Hiển thị trạng thái chính xác.
* Nếu đăng ký thất bại, hiển thị hướng dẫn xử lý.

---

# FR-19: Sleep, wake và lock screen

Khi máy sleep:

* Lưu state hiện tại.
* Dừng animation.
* Không tính active time.
* Không tính countdown dựa trên tick loop.

Khi máy wake:

* Tính toán lại state theo timestamp.
* Nếu forced break đang chạy trước khi sleep, áp dụng policy.

Policy mặc định:

* Thời gian sleep được xem là thời gian nghỉ.
* Nếu sleep dài hơn forced break remaining time, phiên nghỉ được hoàn thành.
* Nếu sleep ngắn hơn, trừ thời gian sleep khỏi countdown nếu tùy chọn này được bật.

Khi màn hình lock:

* Không hiển thị overlay phía trên lock screen.
* Không tính penalty.
* Có thể xem thời gian lock là thời gian nghỉ.

---

# FR-20: Crash recovery

Nếu ứng dụng crash trong khi:

## Focus session

* Phục hồi timer dựa trên timestamp.
* Không reset active time.

## Pre-break warning

* Phục hồi warning nếu vẫn còn hợp lệ.

## Forced break

Mặc định:

* Không tự động áp overlay ngay lập tức khi mở lại.
* Hiển thị thông báo giải thích phiên trước bị gián đoạn.
* Cho người dùng chọn Resume Break hoặc Dismiss.
* Ghi session là `crashed`.

Ứng dụng không được rơi vào vòng lặp overlay sau crash.

---

# 12. Yêu cầu UI/UX

# 12.1. Visual direction

Phong cách đề xuất:

**Premium Neo-Retro System Failure**

Đặc điểm:

* Dark background.
* Mesh gradient.
* Glass material.
* Monospace kết hợp sans-serif.
* Motion có chiều sâu.
* Glow vừa phải.
* High contrast.
* Không lạm dụng neon.
* Không giống giao diện dashboard doanh nghiệp.

## Typography

* Sans-serif chính: SF Pro.
* Monospace: SF Mono.
* Timer sử dụng tabular numbers.
* Countdown phải đọc được từ khoảng cách xa.

## Spacing

* Khoảng trắng rộng.
* Hạn chế nhiều card nhỏ.
* Mỗi màn hình chỉ có một hành động chính.
* Các control phụ ẩn bớt khi không hover.

---

# 12.2. Animation principles

Animation phải đáp ứng các nguyên tắc:

* Có mục đích.
* Không cản trở thao tác.
* Không kéo dài không cần thiết.
* Không gây chóng mặt.
* Có phiên bản Reduce Motion.
* Không tạo flashing nhanh.

## Animation duration

* Button feedback: 100–180 ms.
* Popover transition: 150–250 ms.
* Scene transition: 400–800 ms.
* Forced break entrance: tối đa 1,5 giây.
* Completion animation: tối đa 3 giây.

## Forced break entrance

Luồng animation đề xuất:

1. Màu màn hình giảm saturation nhẹ.
2. Glitch hoặc distortion chạy trong 300–500 ms.
3. Overlay mở từ tâm hoặc quét từ trên xuống.
4. Countdown xuất hiện.
5. Fake diagnostic text bắt đầu chạy.

Không làm người dùng tưởng GPU hoặc màn hình bị hỏng thật.

---

# 12.3. Accessibility

Ứng dụng phải hỗ trợ:

* VoiceOver cho dashboard và settings.
* Keyboard navigation.
* Dynamic Type ở mức phù hợp cho macOS.
* Reduce Motion.
* Reduce Transparency.
* Increase Contrast.
* Không chỉ dùng màu để biểu thị trạng thái.
* Troll message không chứa ngôn ngữ xúc phạm.
* Không có hiệu ứng flash vượt ngưỡng an toàn.

Forced break overlay cần có chế độ accessibility:

* Không glitch.
* Không rung.
* Font lớn.
* Tương phản cao.
* Chỉ có countdown và hướng dẫn.

---

# 13. Quyền riêng tư

Ứng dụng phải có privacy statement rõ ràng.

BlueBreak có thể theo dõi:

* Thời điểm có hoạt động input.
* Tổng active time.
* Idle duration.
* Số lần tương tác trong overlay.

BlueBreak không theo dõi:

* Phím cụ thể.
* Nội dung người dùng nhập.
* Tọa độ click để phân tích hành vi.
* Tên ứng dụng đang dùng.
* Website.
* Tài liệu.
* Screenshot.
* Microphone.
* Camera.

Nếu sau này thêm analytics:

* Phải opt-in.
* Không gửi session history chi tiết.
* Không gửi dữ liệu input.
* Phải có cách tắt và xóa dữ liệu.

---

# 14. Yêu cầu phi chức năng

# NFR-01: Hiệu năng

Khi chạy nền:

* CPU trung bình dưới 2%.
* Không giữ GPU liên tục.
* Không chạy animation khi dashboard đóng.
* Không polling input với tần suất không cần thiết.

Khi overlay hoạt động:

* Mục tiêu 60 FPS.
* Không tụt dưới 30 FPS trên máy hỗ trợ tối thiểu.
* Có thể giảm effect trên nhiều màn hình.

# NFR-02: Memory

* Chạy nền: mục tiêu dưới 150 MB.
* Overlay nhiều màn hình: mục tiêu dưới 350 MB.
* Không leak window hoặc animation resource.

# NFR-03: Reliability

* Crash-free session lớn hơn 99,5%.
* Settings không bị mất sau update.
* Timer phục hồi sau sleep.
* Overlay không bị kẹt sau khi countdown hoàn thành.

# NFR-04: Security

* Không tải hoặc thực thi code từ xa.
* Không cần quyền administrator.
* Không thu thập key content.
* Dữ liệu local phải nằm trong Application Support.
* Không lưu secret trong UserDefaults.

# NFR-05: Compatibility

MVP đề xuất hỗ trợ:

* macOS 14 Sonoma trở lên.
* Apple Silicon.
* Intel có thể hỗ trợ nếu chi phí không quá lớn.

Khuyến nghị ưu tiên:

* Apple Silicon trước.
* Xác định sau về Intel dựa trên thị trường mục tiêu.

# NFR-06: Offline

Toàn bộ chức năng MVP phải hoạt động khi không có internet.

---

# 15. Dữ liệu và persistence

## UserDefaults hoặc AppStorage

Sử dụng cho:

* Toggle.
* Thời lượng.
* Theme được chọn.
* Trạng thái onboarding.
* Cấu hình UI đơn giản.

## SwiftData hoặc SQLite

Sử dụng cho:

* Session history.
* Daily statistics.
* Migration dữ liệu.
* Dữ liệu cần truy vấn theo thời gian.

Không lưu session history lớn trong UserDefaults.

---

# 16. Kiến trúc logic dự kiến

```text
BlueBreakApp
    |
    +-- SessionStateMachine
    |
    +-- PomodoroEngine
    |
    +-- ActivityTrackingService
    |
    +-- MandatoryBreakEngine
    |
    +-- PenaltyEngine
    |
    +-- OverlayWindowManager
    |
    +-- DisplayManager
    |
    +-- NotificationService
    |
    +-- SoundService
    |
    +-- SettingsRepository
    |
    +-- SessionRepository
```

## Quy tắc

* Domain không phụ thuộc SwiftUI.
* Timer logic không nằm trong View.
* View không trực tiếp lưu settings.
* OverlayWindowManager chịu trách nhiệm quản lý AppKit windows.
* State machine là nguồn sự thật duy nhất cho trạng thái phiên.
* Mọi time calculation dựa trên timestamp thay vì tick count.

---

# 17. Telemetry nội bộ tùy chọn

MVP không bắt buộc gửi analytics.

Có thể tạo local diagnostic event:

* app_launched.
* onboarding_completed.
* focus_started.
* focus_completed.
* warning_shown.
* forced_break_started.
* penalty_triggered.
* forced_break_completed.
* emergency_exit_used.
* overlay_creation_failed.

Diagnostics export phải:

* Không chứa nội dung bàn phím.
* Không chứa tên file.
* Không chứa website.
* Không chứa thông tin nhạy cảm.

---

# 18. Edge cases

Ứng dụng phải xử lý các tình huống:

* Người dùng đổi timezone.
* Người dùng chỉnh đồng hồ hệ thống.
* Máy sleep trong forced break.
* Máy wake khi countdown đã hết.
* Cắm thêm màn hình trong forced break.
* Rút màn hình chính.
* Thay đổi scale display.
* Stage Manager được bật hoặc tắt.
* Người dùng chuyển Space.
* Một ứng dụng khác đang full-screen.
* Người dùng mở Mission Control.
* Người dùng Force Quit BlueBreak.
* BlueBreak crash trong overlay.
* Notification permission bị từ chối.
* Launch at Login bị từ chối.
* Sound output thay đổi.
* Không có audio device.
* Settings database bị lỗi.
* Timer đang chạy khi ứng dụng update.
* Người dùng spam click hàng trăm lần.
* Người dùng giữ phím.
* Người dùng dùng nhiều thiết bị chuột.
* Người dùng khóa màn hình ngay khi forced break bắt đầu.

---

# 19. Tiêu chí hoàn thành MVP

MVP được xem là hoàn thành khi đáp ứng toàn bộ các điều kiện:

## Core

* Có Pomodoro timer hoạt động chính xác.
* Có activity tracking.
* Có mandatory break threshold.
* Có pre-break warning.
* Có forced break overlay.
* Có penalty click.
* Có maximum penalty.
* Có emergency exit.
* Có settings.
* Có menu bar application.
* Có Launch at Login.

## Platform

* Hỗ trợ ít nhất hai màn hình.
* Hoạt động sau sleep/wake.
* Không bị kẹt overlay.
* Không chặn chức năng hệ thống.
* Không yêu cầu quyền không cần thiết.

## UI

* Có onboarding hoàn chỉnh.
* Có dashboard.
* Có ít nhất một theme production-ready.
* Animation đạt 60 FPS trên máy mục tiêu.
* Có Reduce Motion.
* Có Dark Mode.

## Quality

* Không có warning nghiêm trọng trong build.
* Unit test state machine.
* Unit test penalty logic.
* Unit test timer restoration.
* Integration test overlay lifecycle.
* Kiểm thử display connect/disconnect.
* Kiểm thử sleep/wake.
* Kiểm thử emergency exit.
* Không có crash blocker.

## Distribution

* App được code signed.
* App được notarized.
* Có DMG cài đặt.
* Có privacy policy.
* Có hướng dẫn uninstall.
* Có version và build number.

---

# 20. Acceptance test tổng quát

## Scenario 1: Forced break bình thường

Given:

* Threshold là 120 phút.
* Active time đã đạt 119 phút.
* Warning trước 1 phút đang bật.

When:

* Người dùng tiếp tục hoạt động thêm 1 phút.

Then:

* Warning được hiển thị đúng.
* Forced break bắt đầu.
* Overlay xuất hiện trên tất cả màn hình.
* Countdown bắt đầu từ thời lượng cấu hình.
* Sau khi countdown kết thúc, overlay đóng.
* Active time được reset.

## Scenario 2: Click penalty

Given:

* Forced break duration là 5 phút.
* Penalty là 1 phút.
* Maximum penalty là 10 phút.

When:

* Người dùng click một lần.

Then:

* Countdown tăng thêm 1 phút.
* Hiển thị `+1:00`.
* Hiển thị troll message.
* Penalty count tăng 1.

## Scenario 3: Maximum penalty

Given:

* Người dùng đã nhận đủ 10 phút penalty.

When:

* Người dùng click thêm.

Then:

* Countdown không tăng.
* Có thể hiển thị thông báo đã đạt maximum.
* Không phát animation cộng thời gian sai.

## Scenario 4: Sleep

Given:

* Forced break còn 4 phút.

When:

* Máy sleep trong 10 phút.

Then:

* Khi wake, forced break được đánh dấu hoàn thành theo policy mặc định.
* Không hiện overlay bị kẹt.
* Session history được ghi đúng.

## Scenario 5: Emergency exit

Given:

* Forced break đang chạy.

When:

* Người dùng giữ emergency shortcut đủ 5 giây.

Then:

* Overlay đóng.
* Không tính thao tác này là penalty.
* Session được đánh dấu aborted.
* Active time không reset.

## Scenario 6: Display được kết nối

Given:

* Forced break đang chạy trên MacBook display.

When:

* Người dùng cắm external monitor.

Then:

* Overlay xuất hiện trên màn hình mới trong vòng 1 giây.
* Countdown đồng bộ với màn hình chính.

---

# 21. Kế hoạch phát triển đề xuất

## Phase 1: Core prototype

* App skeleton.
* Menu bar.
* Timer engine.
* Activity tracking.
* State machine.
* Settings cơ bản.
* Overlay một màn hình.
* Click penalty.

Mục tiêu: chứng minh toàn bộ nghiệp vụ hoạt động.

## Phase 2: Platform hardening

* Multi-display.
* Spaces.
* Sleep/wake.
* Lock screen.
* Launch at Login.
* Notification.
* Emergency exit.
* Crash recovery.

Mục tiêu: ứng dụng ổn định trên macOS.

## Phase 3: Premium UI

* Design system.
* Timer orb.
* Overlay theme.
* Glitch shader.
* Sound design.
* Onboarding animation.
* Reduce Motion.
* Accessibility.

Mục tiêu: tạo sự khác biệt và khả năng viral.

## Phase 4: Production readiness

* Unit test.
* Integration test.
* Performance profiling.
* Memory profiling.
* Code signing.
* Notarization.
* DMG packaging.
* Privacy policy.
* Website landing page.

---

# 22. Ưu tiên backlog

## P0 — Bắt buộc

* State machine.
* Pomodoro.
* Activity tracking.
* Mandatory threshold.
* Warning.
* Overlay.
* Penalty.
* Emergency exit.
* Multi-display.
* Settings.
* Sleep/wake.
* Local persistence.

## P1 — Quan trọng

* Three troll levels.
* Statistics.
* Sound.
* Multiple themes.
* Launch at Login.
* Session history.
* Reduce Motion.
* Crash recovery.

## P2 — Có thể làm sau

* Theme marketplace.
* Cloud sync.
* Achievements.
* Shareable summary.
* AI-generated troll messages.
* Windows version.
* Apple Watch companion.
* Team mode.

---

# 23. Rủi ro sản phẩm

## Rủi ro: Người dùng nghĩ máy bị lỗi thật

Giải pháp:

* Hiển thị BlueBreak branding.
* Không sao chép chính xác kernel panic.
* Cảnh báo trước.
* Onboarding giải thích rõ.
* Có emergency exit.

## Rủi ro: Ứng dụng bị xem là malware

Giải pháp:

* Không chặn Force Quit.
* Không yêu cầu quyền không cần thiết.
* Privacy policy rõ ràng.
* Source hoặc tài liệu kỹ thuật minh bạch.
* Code signing và notarization.

## Rủi ro: Overlay không hoạt động trên mọi Space

Giải pháp:

* Dùng AppKit cho window management.
* Kiểm thử nhiều chế độ full-screen.
* Tạo một window cho mỗi display.
* Có fallback notification nếu overlay thất bại.

## Rủi ro: Animation tiêu thụ GPU

Giải pháp:

* Dừng animation khi không nhìn thấy.
* Giảm effect trên màn hình phụ.
* Có Low Power Mode.
* Có Reduce Motion.
* Profile bằng Instruments.

## Rủi ro: Người dùng gỡ ứng dụng vì bị phạt quá nhiều

Giải pháp:

* Mặc định penalty có giới hạn.
* Có Gentle mode.
* Có snooze.
* Có pause.
* Có emergency exit.
* Không bật keyboard penalty theo mặc định.

---

# 24. Định nghĩa “Done”

Một hạng mục chỉ được xem là hoàn thành khi:

* Nghiệp vụ hoạt động đúng theo PRD.
* Có handling cho error state.
* Có unit test hoặc integration test phù hợp.
* Không có compiler warning mới.
* Không có crash blocker.
* UI hỗ trợ Dark Mode.
* UI hỗ trợ Reduce Motion nếu có animation.
* Không làm tăng quyền truy cập không cần thiết.
* Được kiểm thử trên ít nhất một máy Apple Silicon.
* Được kiểm thử với external display nếu liên quan overlay.
* Documentation được cập nhật.
* Không có TODO quan trọng bị bỏ lại trong production code.

---

# 25. Tóm tắt quyết định sản phẩm

BlueBreak for macOS sẽ là:

* Native macOS application.
* Menu bar-first.
* SwiftUI cho giao diện chính.
* AppKit cho overlay và window management.
* Local-first.
* Không cần tài khoản.
* Không cần internet.
* Không theo dõi nội dung người dùng.
* Có Pomodoro.
* Có mandatory active-time break.
* Có pre-break warning.
* Có full-screen parody overlay.
* Có click penalty.
* Có maximum penalty.
* Có emergency exit.
* Có trải nghiệm animation cao cấp.
* Troll nhưng không được trở thành phần mềm khóa máy hoặc gây mất dữ liệu.

Sự thành công của sản phẩm phụ thuộc chủ yếu vào ba yếu tố:

1. Overlay hoạt động ổn định trên macOS.
2. Giao diện và animation đạt chất lượng premium.
3. Cơ chế troll đủ vui nhưng vẫn tôn trọng quyền kiểm soát của người dùng.
