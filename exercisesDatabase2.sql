use internship;

-- cau 1 Cho biết mã số và tên của các đề tài do giảng viên ‘Tran son’ hướng dẫn
select p.project_id, p.project_name from project p
join instructor_student i on i.project_id = p.project_id
join instructor ins on ins.instructor_id= i.instructor_id 
where ins.instructor_name = "Tran Son";








