# Emergency exit tạo cooldown window chặn tái kích hoạt ngay lập tức

FR-10 quy định active time không reset sau emergency exit (mặc định), nhưng mandatory-break phase tự kiểm tra active threshold độc lập theo thời gian thực (ADR-0001). Nếu không có cơ chế chặn, ngay khi overlay đóng, threshold vẫn bị vượt → `preBreakWarning`/`forcedBreak` kích hoạt lại ngay → người dùng emergency-exit lần nữa → vòng lặp vô hạn. PRD nhắc "cooldown 5 phút" nhưng không định nghĩa nó chặn gì.

**Quyết định:**
1. Emergency exit ghi `emergencyExitCooldownUntil = now + 5min` vào mandatory-break context.
2. Trong lúc cooldown còn hiệu lực, phase giữ ở `idle` — **không** tự kích hoạt `preBreakWarning` dù active time đã vượt threshold.
3. Khi cooldown hết hạn, nếu active time vẫn vượt threshold, phase nhảy **thẳng vào `forcedBreak`**, bỏ qua `preBreakWarning` — vì người dùng đã nhận đủ một chu kỳ cảnh báo trước khi emergency-exit; lặp lại cảnh báo chỉ trì hoãn thêm, đi ngược tinh thần "mandatory".
4. Cooldown không chặn Pomodoro — Pomodoro (nếu có) đã resume ngay từ lúc emergency exit theo ADR-0003.

**Trade-off đã bỏ qua:** reset active time khi emergency exit (giải quyết vòng lặp đơn giản hơn) — bị loại vì PRD FR-10 nêu rõ mặc định không reset.
