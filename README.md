# Spring Boot CI – Gradle Dependency Caching

## Giới thiệu

Dự án triển khai Continuous Integration cho ứng dụng Spring Boot với GitHub Actions, Gradle và JUnit 5. Workflow tự động kiểm thử, đóng gói JAR và lưu trữ artifact. Tính năng Gradle Dependency Caching được kích hoạt để tái sử dụng các thư viện đã tải giữa những lần chạy CI.

## Công nghệ

- Java 17 (Eclipse Temurin)
- Spring Boot 3
- Gradle 8
- JUnit 5
- GitHub Actions

## Chức năng

API `GET /hello` trả về `Hello CI!`.

## Quy trình CI

1. Checkout mã nguồn.
2. Thiết lập JDK 17 và Gradle dependency cache qua `actions/setup-java@v5`.
3. Cấp quyền thực thi cho Gradle.
4. Chạy kiểm thử JUnit bằng `./gradlew test`.
5. Đóng gói ứng dụng bằng `./gradlew bootJar`.
6. Lưu artifact `app-jar` từ `build/libs/*.jar`.

## Kiểm chứng cache

Kiểm tra log của bước thiết lập Java ở lần chạy tiếp theo để xác nhận cache đã được khôi phục. Thời gian thực thi phụ thuộc runner, trạng thái cache và môi trường mạng nên không phải lần chạy sau nào cũng nhanh hơn.

## Báo cáo

Kết quả thực tế và thời gian chạy được ghi trong `homework/session_11/ex3/report.md` sau khi thực hiện các lần chạy trên GitHub Actions.
