use [master]
go
create database onlineDBABC
go

use [onlineDBMY]

GO

CREATE TABLE [dbo].[APPAYAR](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[IMG] [nvarchar](100) NULL,
	[GITURL] [nvarchar](100) NULL,
)

GO

CREATE TABLE [dbo].[APPDURUM](
	[DURUM] [int] NULL
)

GO
CREATE TABLE [dbo].[IPBAN](
	[IPID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[IPNO] [nvarchar](50) NULL,
	)
	
GO
	
CREATE TABLE [dbo].[OPOZEL](
	[ozID] [int] NULL,
	[OPID] [int] NULL,
	[HAZIRMESAJ] [varchar](max) NULL,
	[LINKADRES] [varchar](max) NULL,
	[LINKADI] [varchar](max) NULL
)

GO

CREATE TABLE [devonline.DEPARTMAN](
	[DEPID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[DEPADI] [nvarchar](30) NULL,
	)
GO	

INSERT INTO [devonline.DEPARTMAN] (DEPADI) VALUES('Destek')
GO

CREATE TABLE [devonline.FORM](
	[FRMID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[FRMNAME] [nvarchar](50) NULL,
	)
	
GO
CREATE TABLE [devonline.LOG](
	[LOGID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ACIKLAMA] [nvarchar](max) NULL,
	[KULLANICIID] [int] NULL,
	)
GO
	
CREATE TABLE [devonline.LOGIN](
	[LOGINID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[KADI] [varchar](50) NULL,
	[PASS] [varchar](50) NULL,
	[DEPARTID] [int] NULL,
	[ADSOYAD] [varchar](50) NULL,
	[MSJ1] [nvarchar](max) NULL,
	[MSJ2] [nvarchar](max) NULL,
	[MSJ3] [nvarchar](max) NULL,
	[YETKI] [int] NULL,
	[ONLINE] [int] NULL,
	)
	
GO	

INSERT INTO [devonline.LOGIN] (KADI,PASS,DEPARTID,ADSOYAD,YETKI,[devonline.LOGIN].ONLINE) VALUES('admin','12345',1,'ADMIN KULLANICI',10,0)

GO
CREATE TABLE [devonline.MESAJ](
	[MESAJID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[KIMDENID] [nvarchar](50) NULL,
	[KIMEID] [nvarchar](50) NULL,
	[MESAJ] [nvarchar](max) NULL,
	[ZAMAN] [datetime] NULL,
	[CHATID] [int] NULL,
	[OKUNDU] [int] NULL,
	)
GO
CREATE TABLE [devonline.ONLINEMUS](
	[musID] [int] IDENTITY(1,1) NOT NULL,
	[ADI] [varchar](20) NULL,
	[EMAIL] [varchar](50) NULL,
	[DEPARTMAN] [varchar](50) NULL,
	[MSJ] [text] NULL,
	[IP] [varchar](25) NULL,
	[ILKZAMAN] [datetime] NULL,
	[SONZAMAN] [datetime] NULL,
	[BROWSER] [text] NULL,
	[ISLETIMSIS] [varchar](50) NULL,
	[KABUL] [int] NULL,
	[DEPKULLANICIID] [int] NULL,
	[online] [int] NULL,
	[SEHIR] [nvarchar](40) NULL,
	[ULKE] [nvarchar](70) NULL,
	[LAT] [float] NULL,
	[LONG] [float] NULL,
	[MVERILDI] [int] NULL
	)
GO	
CREATE TABLE [devonline.USERSTATUS](
	[ISLEMID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[KULLANICIID] [int] NULL,
	[ONLINE] [int] NULL,
	[GIRISTARIH] [datetime] NULL,
	[CIKISTARIH] [datetime] NULL,
	)
	
GO	
CREATE TABLE [devonline.YETKI](
	[YETKIID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[FORMID] [int] NULL,
	[YETKIVAR] [bit] NULL,
	[USERID] [int] NULL,
	
)
GO

CREATE PROCEDURE [dbo].[musteriayrildi]
	@musID int
AS
BEGIN
	update [devonline.ONLINEMUS] set online=5 where musID=@musID
END

GO

CREATE PROCEDURE [dbo].[mustericountal]
	@KIMEID nvarchar(50)
	
AS
BEGIN
	Select Count(*) as count From [devonline.MESAJ] where KIMEID=@KIMEID and convert(varchar,ZAMAN,104)=  
convert(varchar,GETDATE (), 104) and OKUNDU=1

END

GO


CREATE PROCEDURE [dbo].[musteriipblokkontrol]
	@IPNO nvarchar(50)
AS
BEGIN
	select * from IPBAN where IPNO=@IPNO
END

GO


CREATE PROCEDURE [dbo].[musterionlinedurum]
	@musID int
AS
BEGIN
	select * from [devonline.ONLINEMUS] where musID=@musID
END

GO

CREATE PROCEDURE [dbo].[uygulamalogin]
	@KADI varchar(50),
    @PASS varchar(50)
AS
BEGIN
select * from [devonline.LOGIN] where KADI=@KADI and PASS=@PASS and YETKI=10
END

GO

CREATE PROCEDURE [dbo].[yoneticicountkisiler]
	@benimID nvarchar(50)
AS
BEGIN
	select COUNT(*) as count from [devonline.LOGIN] where LOGINID<>@benimID and ONLINE=1
END

GO

CREATE PROCEDURE [dbo].[yoneticikisilistesi]
@LOGINID int
AS
BEGIN
	select * from [devonline.LOGIN] where LOGINID <> @LOGINID order by ONLINE desc
END

GO


CREATE PROCEDURE [dbo].[yoneticikonusmalar]

AS
BEGIN
SELECT    [devonline.ONLINEMUS].musID, [devonline.ONLINEMUS].ADI, [devonline.ONLINEMUS].EMAIL, [devonline.ONLINEMUS] .ILKZAMAN, 
                      [devonline.ONLINEMUS].KABUL, [devonline.ONLINEMUS].DEPKULLANICIID, [devonline.ONLINEMUS].online, [devonline.ONLINEMUS].MSJ, 
                      [devonline.ONLINEMUS].IP, [devonline.ONLINEMUS] .SEHIR, [devonline.ONLINEMUS].ULKE, [devonline.ONLINEMUS] .BROWSER,  
                      [devonline.ONLINEMUS].ISLETIMSIS, [devonline.ONLINEMUS].DEPARTMAN, [devonline.DEPARTMAN].DEPADI 
FROM         [devonline.ONLINEMUS] INNER JOIN
                      [devonline.DEPARTMAN] ON [devonline.ONLINEMUS].DEPARTMAN = [devonline.DEPARTMAN] .DEPID
WHERE     ([devonline.ONLINEMUS].KABUL = 1) AND ([devonline.ONLINEMUS] .online = 1) 
ORDER BY [devonline.ONLINEMUS].musID DESC
END

GO


CREATE PROCEDURE [dbo].[yoneticikonusmalarcount]
	 @KIMEID nvarchar(50),
   @KIMDENID nvarchar(50)
   	
AS
BEGIN
	select COUNT(*) as toplam from [devonline.MESAJ] where KIMEID=@KIMEID and KIMDENID=@KIMDENID OR KIMEID=@KIMDENID and KIMDENID=@KIMEID
END

GO

CREATE PROCEDURE [dbo].[yoneticikonusmalaryaz]
   @KIMEID nvarchar(50),
   @KIMDENID nvarchar(50)
   	
AS
BEGIN
	select MESAJID KIMDENID,KIMEID, MESAJ,ZAMAN from [devonline.MESAJ] where KIMEID=@KIMEID and KIMDENID=@KIMDENID OR KIMEID=@KIMDENID and KIMDENID=@KIMEID
END

GO

CREATE PROCEDURE [dbo].[yoneticimesajgoster]
	@KIMEID nvarchar(50),
	@ZAMAN DATE
AS
BEGIN
SELECT     [devonline.MESAJ].MESAJID, [devonline.MESAJ].KIMDENID, [devonline.MESAJ].KIMEID, [devonline.MESAJ] .MESAJ, [devonline.MESAJ] .ZAMAN,   
                      [devonline.MESAJ].OKUNDU, [devonline.LOGIN] .ADSOYAD
FROM         [devonline.MESAJ] INNER JOIN
                      [devonline.LOGIN] ON [devonline.MESAJ].KIMDENID = [devonline.LOGIN]  .LOGINID WHERE 
                      ([devonline.MESAJ].KIMEID = @KIMEID) AND ([devonline.MESAJ] .OKUNDU=1)  
END

GO


CREATE PROCEDURE [dbo].[yoneticionlinekontrol]
	@benimID int
	AS
BEGIN
	select [devonline.LOGIN].LOGINID, [devonline.LOGIN].ADSOYAD, [devonline.LOGIN].ONLINE from [devonline.LOGIN] where LOGINID <> @benimID   
END

GO

CREATE PROCEDURE [dbo].[yoneticisanaldivolustur]
	@benimID int
AS
BEGIN
	select * from [devonline.LOGIN] where LOGINID <> @benimID
END

GO

CREATE PROCEDURE [devonline.musterichat]
 @KIMDENID nvarchar(50),
 @KIMEID nvarchar(50),
 @MESAJ nvarchar(max),
 @ZAMAN datetime
AS
BEGIN
	INSERT INTO [devonline.MESAJ]
           ([KIMDENID]
           ,[KIMEID]
           ,[MESAJ]
           ,[ZAMAN]
           ,[OKUNDU])
     VALUES
           (@KIMDENID
           ,@KIMEID
           ,@MESAJ
           ,@ZAMAN
           ,1)

END
GO


Create PROCEDURE [devonline.musteridepart]
	@depart int
AS
BEGIN
	SELECT     [devonline.ONLINEMUS].DEPKULLANICIID, [devonline.LOGIN].ADSOYAD
FROM         [devonline.ONLINEMUS] INNER JOIN
                      [devonline.LOGIN] ON [devonline.ONLINEMUS].DEPKULLANICIID = [devonline.LOGIN].LOGINID 
WHERE     ([devonline.ONLINEMUS].DEPKULLANICIID = @depart)
END

GO


CREATE PROCEDURE [devonline.musterigiris]
           @ADI varchar(20),
           @EMAIL varchar(50),
           @DEPARTMAN varchar(50),
           @MSJ text,
           @IP varchar(25),
           @ILKZAMAN datetime,
           @SONZAMAN datetime,
           @BROWSER text,
           @ISLETIMSIS varchar(50),
           @KABUL int,
           @DEPKULLANICIID int,
           @online int,
		   @SEHIR nvarchar(40),
		   @ULKE nvarchar(70),
		   @LAT float,
           @LONG float
			
AS
BEGIN
INSERT INTO [devonline.ONLINEMUS]
           ([ADI]
           ,[EMAIL]
           ,[DEPARTMAN]
           ,[MSJ]
           ,[IP]
           ,[ILKZAMAN]
           ,[SONZAMAN]
           ,[BROWSER]
           ,[ISLETIMSIS]
           ,[KABUL]
           ,[DEPKULLANICIID]
           ,[online]
           ,[SEHIR]
           ,[ULKE]
           ,[LAT]
           ,[LONG])
     VALUES
           (@ADI
           ,@EMAIL
           ,@DEPARTMAN
           ,@MSJ
           ,@IP
           ,@ILKZAMAN
           ,@SONZAMAN
           ,@BROWSER
           ,@ISLETIMSIS
           ,@KABUL
           ,@DEPKULLANICIID
           ,@online
           ,@SEHIR
           ,@ULKE
           ,@LAT
           ,@LONG) SELECT SCOPE_IDENTITY()


END

GO


Create PROCEDURE [devonline.musterikontrol]
	@musID int
	
	AS
BEGIN
	select * from [devonline.ONLINEMUS] where musID=@musID
END

GO

CREATE PROCEDURE [devonline.musterimesajgoster]
	@KIMEID nvarchar(50)
	
AS
BEGIN
	 SELECT    [devonline.MESAJ].MESAJID, [devonline.MESAJ].KIMEID, [devonline.MESAJ] .MESAJ, [devonline.MESAJ] .KIMDENID, [devonline.LOGIN].KADI   
FROM         [devonline.MESAJ] INNER JOIN 
                      [devonline.LOGIN] ON [devonline.MESAJ] .KIMDENID = [devonline.LOGIN] .LOGINID 
WHERE     ([devonline.MESAJ].KIMEID = @KIMEID) AND ([devonline.MESAJ] .OKUNDU = 1) 
END


GO

Create PROCEDURE [devonline.musterizamanguncelle]
	@musID int,
	@zaman datetime
	AS
BEGIN
	update [devonline.ONLINEMUS] set SONZAMAN=@zaman where musID=@musID

END

GO