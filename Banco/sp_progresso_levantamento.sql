

Select count(Id_bem) as Bens from Tb_Patrimonio where Id_local = 1

Select count(l.Id_bem) as Num from Tb_levantamentos l join Tb_Patrimonio p
on p.Id_Bem = l.Id_Bem
where p.Id_local = 1