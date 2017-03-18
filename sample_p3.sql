## 問題3；初期SQL

select em.employee_id, em.name, em.dept_cd, em.job_cd, rm.role_name 
from EMPLOYEE em 
 cross join ROLE_MATRIX rm
 inner join ROLE_MATRIX_JOB rmj on rm.matrix_id = rmj.matrix_id
where rm.dept_cd_from <= em.dept_cd and em.dept_cd <= rm.dept_cd_to
and em.job_cd = rmj.job_cd
group by  em.employee_id, em.name, em.dept_cd, em.job_cd, rm.role_name
order by em.employee_id,rm.role_name;

