use internship;

-- câu 1 Đưa ra thông tin gồm mã số, họ tên và tên khoa của tất cả các giảng viên
select i.instructor_id , i.instructor_name, f.faculty_name from instructor i
join faculty f on f.faculty_id = i.faculty_id ;

-- câu 2 Đưa ra thông tin gồm mã số, họ tên và tên khoa của các giảng viên của khoa ‘DIA LY va QLTN’
select i.instructor_id , i.instructor_name, f.faculty_name from instructor i
join faculty f on f.faculty_id = i.faculty_id 
where f.faculty_name = "Dia ly va QLTN";

-- câu 3 Cho biết số sinh viên của khoa ‘CONG NGHE SINH HOC’
select count(s.faculty_id) as so_luong from student s 
join faculty f on f.faculty_id = s.faculty_id 
GROUP BY f.faculty_name
having f.faculty_name ="Cong Nghe Sinh Hoc";

-- câu 4 Đưa ra danh sách gồm mã số, họ tên và tuổi của các sinh viên khoa ‘TOAN’
select s.student_id, s.student_name,
year(curdate()) - s.date_of_birth age
from student s
join faculty f on f.faculty_id = s.faculty_id
where f.faculty_name ='TOAN';
-- câu 5 
select count(f.faculty_name) so_luong_giao_vien from instructor i
join faculty f  on i.faculty_id = f.faculty_id
group by f.faculty_name
having f.faculty_name = 'Cong nghe Sinh hoc';
-- câu 6 
select * from student s
where not exists(SELECT i.student_id FROM instructor_student i where s.student_id = i.student_id);
-- câu 7 Đưa ra mã khoa, tên khoa và số giảng viên của mỗi khoa	
SELECT f.faculty_id,f.faculty_name, COUNT(f.faculty_id) So_GV
FROM instructor i JOIN faculty f
ON i.faculty_id = f.faculty_id
GROUP BY f.faculty_id;
-- câu 8 Cho biết số điện thoại của khoa mà sinh viên có tên ‘Le van son’ đang theo học
SELECT f.faculty_name, f.phone
FROM faculty f join student s
ON f.faculty_id = s.faculty_id
WHERE s.student_name = 'Le Van Son'
