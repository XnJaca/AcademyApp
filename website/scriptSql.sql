create database DBLOGIN

Use DBLOGIN

create table Usuario(
Id int primary key identity,
Correo varchar(50),
Clave varchar(500)
)

create proc sp_RegistrarUsuario(
@Correo varchar(50),
@Clave varchar(500),
@Registrado bit output,
@Mensaje varchar(100) output
)
as 
begin
  if(not exists(select * from Usuario where Correo = @Correo))
    begin
	  insert into Usuario(Correo,Clave) values(@Correo,@Clave)
	  set @Registrado = 1
	  set @Mensaje = 'Usuario Registrado'
	 end
	 else
	 begin
	     set @Registrado = 0
	     set @Mensaje = 'Correo ya utilizado'
	 end
end

select * from Usuario

create proc sp_ValidarUsuario(
@Correo varchar(100),
@Clave varchar(500),
@Mensaje varchar(100) output
)
as 
begin
  if(exists(select * from Usuario where Correo = @Correo and Clave = @Clave))
    begin
	   select Id from Usuario where Correo = @Correo and Clave = @Clave
	   set @Mensaje = 'Login exitoso'
	end
	else
	begin
	  select '0'
	  set @Mensaje = 'Usuario no encontrado'
	end
end