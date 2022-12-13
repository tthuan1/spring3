use internship;

-- cau 1 Cho biết mã số và tên của các đề tài do giảng viên ‘Tran son’ hướng dẫn
select p.project_id, p.project_name from project p
join instructor_student i on i.project_id = p.project_id
join instructor ins on ins.instructor_id= i.instructor_id 
where ins.instructor_name = "Tran Son";

-- cau 2 Cho biết tên đề tài không có sinh viên nào thực tập
select p.project_name from project p
where not exists(
select project.project_id from project 
join instructor_student i on p.project_id = i.project_id
join student s on s.student_id = i.student_id
);

-- cau 3 Cho biết mã số, họ tên, tên khoa của các giảng viên hướng dẫn từ 3 sinh viên trở lên.
select i.instructor_id,i.instructor_name, f.faculty_name from instructor i
join faculty f on f.faculty_id = i.faculty_id
join instructor_student ins on ins.instructor_id = i.instructor_id
join student s on s.student_id = ins.student_id
group by i.instructor_name
having count(i.instructor_id) >1
;

-- câu 4 Cho biết mã số, tên đề tài của đề tài có kinh phí cao nhất
select * from project
where project.expense = (select p.expense from project p
order by p.expense DESC limit 1)
;

-- câu 5 Cho biết mã số và tên các đề tài có nhiều hơn 2 sinh viên tham gia thực tập
select p.project_id, p.project_name from project p
join instructor_student ins on ins.project_id = p.project_id
join student s on s.student_id = ins.student_id
group by p.project_id
having count(s.student_id)>1
;

-- câu 6 Đưa ra mã số, họ tên và điểm của các sinh viên khoa ‘DIALY và QLTN’
select s.student_id, s.student_name, ins.grade from student s
join faculty f on f.faculty_id = s.faculty_id
join instructor_student ins on ins.student_id= s.student_id
where f.faculty_name = "Dia ly va QLTN"
;

-- câu 7 Đưa ra tên khoa, số lượng sinh viên của mỗi khoa
select f.faculty_name , count(f.faculty_id) as so_luong_sinh_vien from faculty f
join student s on s.faculty_id = f.faculty_id
group by f.faculty_id
;

-- câu 8 Cho biết thông tin về các sinh viên thực tập tại quê nhà
select s.* from student s
join instructor_student ins on ins.student_id= s.student_id
join project p on p.project_id = ins.project_id
where p.place_of_intern = s.place_of_birth
;

-- câu 9 Hãy cho biết thông tin về những sinh viên chưa có điểm thực tập
select s.* from student s
join instructor_student ins on ins.student_id= s.student_id
where ins.grade is null
;

-- câu 10 Đưa ra danh sách gồm mã số, họ tên các sinh viên có điểm thực tập bằng 0
select s.student_id, s.student_name from student s
join instructor_student ins on ins.student_id= s.student_id
where ins.grade = 0
;































