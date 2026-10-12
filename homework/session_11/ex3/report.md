# Báo cáo Bài 3 – Gradle Dependency Caching

## Mục tiêu

Sử dụng `cache: 'gradle'` trong `actions/setup-java@v5` để lưu và khôi phục Gradle dependencies giữa các lần chạy GitHub Actions.

## Cấu hình

File workflow: `.github/workflows/ci.yml`.

```yaml
with:
  java-version: '17'
  distribution: 'temurin'
  cache: 'gradle'
```

## Kết quả thực nghiệm

| Chỉ số | Lần 1 (cache chưa có) | Lần 2 (khôi phục cache) |
|---|---|---|
| Commit / workflow run | Chưa điền | Chưa điền |
| Trạng thái cache trong log setup-java | Chưa điền | Chưa điền |
| Thời gian setup-java | Chưa điền | Chưa điền |
| Thời gian `./gradlew test` | Chưa điền | Chưa điền |
| Tổng thời gian Job | Chưa điền | Chưa điền |

## Nhận xét

Điền nhận xét sau khi kiểm tra thời gian thực tế. Cần xác nhận log `Cache restored successfully from key: gradle-...` ở lần chạy thứ hai; thời gian có thể dao động do runner và mạng.

## Minh chứng

Đính kèm ảnh log cache được khôi phục ở lần chạy thứ hai và ảnh thời gian chạy của hai lần trong thư mục bài nộp.
