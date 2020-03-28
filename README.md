# sem4-major-excerciser
BTL kỳ 4 JSP Servlet

* Bước 1 : máy đã cài git, cd vào 1 thư mục muốn clone project, mở cmd rồi copy và paste dòng sau : git clone https://github.com/phongdn89/sem4-major-excerciser.git
* Bước 2 : import file sem4_major_exercises_student.sql hoặc copy paste từng đoạn nhập dữ liệu vào mysql (bước quan trọng vì chứa user và pass đăng nhập)
* BƯớc 3 : sửa url kết nối JDBC, username, pass, driver tại máy local cần deploy trong file \src\main\resources\META-INF\persistence.xml
* Bước 4 : dùng intelliJ hoặc Netbean IDE 8.2 để import project và build, deploy (IntelliJ cần cấu hình Tomcat mới hoàn toàn, netbean thì cài có tùy chọn thêm tomcat)
* Bước 5 : sau khi deploy thì vào trình duyệt gõ : localhost:[port-tomcat]/[context-path] và test bằng user 'admin' và pass 'quantri'
** Code này chạy tốt nhưng chưa hoàn thiện, cần tối ưu thêm
