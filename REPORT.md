## Báo cáo kết quả Gradle Dependency Caching

Workflow GitHub Actions được cấu hình sử dụng `cache: 'gradle'` trong `actions/setup-java@v5`.

**Kết quả thực nghiệm:**

- Lần chạy thứ nhất: Chưa có cache, tổng thời gian 47 giây, JUnit Test mất 36 giây. Cache được lưu sau khi Job hoàn thành.
- Lần chạy thứ hai: Khôi phục cache thành công, tổng thời gian 33 giây, JUnit Test mất 24 giây.

**So sánh:** Tổng thời gian giảm 14 giây, tương đương khoảng 29,8%. Thời gian thực thi bước JUnit Test giảm 12 giây, tương đương 33,3%.

**Kết luận:** Gradle Dependency Caching hoạt động thành công, giúp giảm thời gian thực thi CI trong hai lần chạy được kiểm tra.
