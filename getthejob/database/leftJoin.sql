SELECT j.jobtitle,j.salary, t.districtname 
FROM `get-the-job`.job as j 
left join district as t on t.districtid = j.districtid;

select * from job


SELECT DISTINCT(t.UserName), u.Department FROM timesheet as t
left join users as u on u.UserName = t.UserName
 where u.Department = "IT" AND (t.Day BETWEEN '2012-07-01' AND '2013-06-28') 