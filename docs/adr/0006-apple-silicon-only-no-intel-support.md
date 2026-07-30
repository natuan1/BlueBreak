# Chỉ hỗ trợ Apple Silicon (ARM), không hỗ trợ Intel trong MVP

Architecture NFR-05 để ngỏ câu hỏi hỗ trợ Intel, ghi "xác định sau dựa trên thị trường mục tiêu". Đây là quyết định kinh doanh, không phải kiến trúc — nhưng nó tác động ngược lên kiến trúc: NFR-01 yêu cầu 60 FPS cho overlay và Metal shader (glitch, RGB separation, noise displacement — Docs §36 Tầng 3), và những hiệu ứng này khó đảm bảo ổn định trên Mac Intel dùng iGPU cũ hoặc dGPU yếu.

**Quyết định:** MVP chỉ hỗ trợ Apple Silicon. Không build, không test, không quảng cáo hỗ trợ Intel.

**Lý do:**
* Giảm ma trận test (Docs §49.5 Manual compatibility matrix bỏ dòng "Intel Mac nếu được hỗ trợ").
* Đảm bảo 60 FPS/GPU budget cho Metal shader mà không cần hai bộ effect-quality preset theo kiến trúc CPU.
* Thị trường mục tiêu (lập trình viên, designer/content creator — PRD §6) đã chuyển sang Apple Silicon phần lớn.

**Hệ quả:** NFR-05 không còn là "xác định sau" — đã chốt. Nếu nhu cầu thị trường thay đổi, việc mở lại hỗ trợ Intel là một quyết định riêng, cần đánh giá lại effect-quality preset theo GPU.
