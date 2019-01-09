sp_dropserver 'servername_antigo'
go
sp_addserver 'servername_novo','local'
go
select @@servername

