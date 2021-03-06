USE [master]
GO
/****** Object:  Database [tapfantasy]    Script Date: 6/25/2017 10:53:29 AM ******/
CREATE DATABASE [tapfantasy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kingdom', FILENAME = N'C:\Data\kingdom.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'kingdom_log', FILENAME = N'C:\Data\kingdom_log.ldf' , SIZE = 20096KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [tapfantasy] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tapfantasy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tapfantasy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tapfantasy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tapfantasy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tapfantasy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tapfantasy] SET ARITHABORT OFF 
GO
ALTER DATABASE [tapfantasy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tapfantasy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tapfantasy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tapfantasy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tapfantasy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tapfantasy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tapfantasy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tapfantasy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tapfantasy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tapfantasy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tapfantasy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tapfantasy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tapfantasy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tapfantasy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tapfantasy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tapfantasy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tapfantasy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tapfantasy] SET RECOVERY FULL 
GO
ALTER DATABASE [tapfantasy] SET  MULTI_USER 
GO
ALTER DATABASE [tapfantasy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tapfantasy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tapfantasy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tapfantasy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [tapfantasy] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'tapfantasy', N'ON'
GO
ALTER DATABASE [tapfantasy] SET QUERY_STORE = OFF
GO
USE [tapfantasy]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [tapfantasy]
GO
/****** Object:  Table [dbo].[games]    Script Date: 6/25/2017 10:53:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[games](
	[game_id] [int] NOT NULL,
	[game_name] [varchar](50) NULL,
 CONSTRAINT [PK_games] PRIMARY KEY CLUSTERED 
(
	[game_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[identifier]    Script Date: 6/25/2017 10:53:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[identifier](
	[identifier_id] [int] NOT NULL,
	[game_id] [varchar](10) NOT NULL,
	[fund1] [varchar](250) NULL,
	[fund2] [varchar](250) NULL,
	[fund3] [varchar](250) NULL,
	[fund4] [varchar](250) NULL,
	[fund5] [varchar](250) NULL,
	[latest_version] [varchar](250) NULL,
	[url_review] [varchar](500) NULL,
	[url_app] [varchar](500) NULL,
	[app_id] [varchar](250) NULL,
	[promote_apps] [varchar](250) NULL,
 CONSTRAINT [PK_identifier] PRIMARY KEY CLUSTERED 
(
	[identifier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[password_request]    Script Date: 6/25/2017 10:53:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[password_request](
	[request_id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[request_date] [datetime] NULL,
	[request_game_id] [varchar](10) NULL,
	[request_uid] [varchar](50) NULL,
	[request_email] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[profile]    Script Date: 6/25/2017 10:53:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profile](
	[tapy_id] [bigint] IDENTITY(1,1) NOT NULL,
	[uid] [varchar](50) NULL,
	[uid_type] [varchar](50) NULL,
	[game_id] [int] NULL,
	[date_found] [datetime] NULL,
	[last_login] [datetime] NULL,
	[world_id] [int] NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[longitude] [float] NULL,
	[latitude] [float] NULL,
	[devicetoken] [varchar](100) NULL,
	[FacebookMessenger_id] [varchar](50) NULL,
	[WhatsApp_id] [varchar](50) NULL,
	[WeChat_id] [varchar](50) NULL,
	[Skype_id] [varchar](50) NULL,
	[LINE_id] [varchar](50) NULL,
	[Telegram_id] [varchar](50) NULL,
	[Slack_id] [varchar](50) NULL,
	[Kik_id] [varchar](50) NULL,
	[enable_switch_server] [int] NULL,
	[enable_logout] [int] NULL,
	[always_download_graphicpack] [int] NULL,
 CONSTRAINT [PK_profile] PRIMARY KEY CLUSTERED 
(
	[tapy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[world]    Script Date: 6/25/2017 10:53:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[world](
	[world_id] [int] NOT NULL,
	[world_name] [nvarchar](max) NULL,
	[world_status] [int] NULL,
	[language] [nvarchar](max) NULL,
	[server_ip] [nvarchar](max) NULL,
	[server_webservice] [nvarchar](max) NULL,
	[flag_id] [int] NULL,
	[recomended] [int] NULL,
 CONSTRAINT [PK_world] PRIMARY KEY CLUSTERED 
(
	[world_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[password_request] ADD  CONSTRAINT [DF_password_request_request_id]  DEFAULT (newid()) FOR [request_id]
GO
/****** Object:  StoredProcedure [dbo].[usp_Check_UID_Profile_Base]    Script Date: 6/25/2017 10:53:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Check_UID_Profile_Base]
(@databaseName varchar(50))
AS
BEGIN
	DECLARE @sql_query VARCHAR(500) =''
    SET @sql_query =
    'SELECT TapFantasyProfiles.uid , KingdomProfiles.profile_id , KingdomBases.base_id
    FROM [tapfantasy].[dbo].[profile] as TapFantasyProfiles
    LEFT OUTER JOIN '+QUOTENAME(@databaseName)+'.[dbo].[profile] as KingdomProfiles
    ON TapFantasyProfiles.uid = KingdomProfiles.uid
    LEFT OUTER JOIN '+QUOTENAME(@databaseName)+'.[dbo].[base] as KingdomBases
    ON KingdomProfiles.profile_id = KingdomBases.profile_id
    WHERE TapFantasyProfiles.uid!='+ QUOTENAME('0','''')+' AND TapFantasyProfiles.uid!='+QUOTENAME('1','''')

    RAISERROR ('@sql_query : %s', 10,-1, @sql_query) with nowait;
    EXECUTE(@sql_query)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_LoginEmail]    Script Date: 6/25/2017 10:53:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Shankar Nathan
-- Create date: 09 March 2014
-- Description:	Login
-- =============================================
CREATE PROCEDURE [dbo].[usp_LoginEmail]
(@profile_uid varchar(50), @email varchar(50), @password varchar(50), @devicetoken varchar(100), @latitude float, @longitude float, @r int out)
AS
BEGIN

DECLARE @profile_count int

SET @profile_count = (SELECT COUNT(*) FROM [profile] WHERE [password]=@password AND [uid]=@profile_uid);
SET @r = @profile_count;

--Check if id already exist on main db
IF (@profile_count > 0)
BEGIN
UPDATE [profile] SET last_login=GETUTCDATE(), latitude=@latitude, longitude=@longitude, devicetoken=@devicetoken, email=@email WHERE [password]=@password AND [uid]=@profile_uid;
END
ELSE
BEGIN
SET @r = -1;
END

END
GO
/****** Object:  StoredProcedure [dbo].[usp_LoginGameCenter]    Script Date: 6/25/2017 10:53:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Shankar Nathan
-- Create date: 09 March 2014
-- Description:	Login using Game Center
-- =============================================
CREATE PROCEDURE [dbo].[usp_LoginGameCenter]
(@profile_uid varchar(50), @r int out)
AS
BEGIN

DECLARE @profile_count int

SET @profile_count = (SELECT COUNT(*) FROM [profile] WHERE [uid]=@profile_uid);
SET @r = -1;

--Check if id already exist on main db
IF (@profile_count = 0)
BEGIN

INSERT INTO [profile] (last_login, date_found, [uid], world_id, uid_type, game_id) VALUES (GETUTCDATE(), GETUTCDATE(), @profile_uid, 1, 'Game Center', 1);

END
ELSE
BEGIN

UPDATE [profile] SET last_login=GETUTCDATE() WHERE [uid]=@profile_uid;

END

SET @r = 1;

END
GO
/****** Object:  StoredProcedure [dbo].[usp_RegisterEmail]    Script Date: 6/25/2017 10:53:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Shankar Nathan
-- Create date: 09 March 2014
-- Description:	Login
-- =============================================
CREATE PROCEDURE [dbo].[usp_RegisterEmail]
(@profile_uid varchar(50), @email varchar(50), @password varchar(50), @devicetoken varchar(100), @game_id int, @r int out)
AS
BEGIN

DECLARE @profile_count int

SET @profile_count = (SELECT COUNT(*) FROM [profile] WHERE [uid]=@profile_uid);
SET @r = -2;

--Check if id already exist on main db
IF (@profile_count = 0)
BEGIN

SET @r = 1;
INSERT INTO profile (last_login, date_found, [uid], [password], email, devicetoken, world_id, uid_type, game_id) VALUES (GETUTCDATE(), GETUTCDATE(), @profile_uid, @password, @email, @devicetoken, 1, 'Email', 1);

END
ELSE
BEGIN
	DECLARE @user_password varchar(50);

	SET @user_password = (SELECT [password] FROM [profile] WHERE [uid]=@profile_uid);

	IF @password=@user_password
	BEGIN
		SET @r = 1; --treat it as a login
	END
	ELSE
	BEGIN
		SET @r = -1; --Client will inform user that this email is taken, use another email to register
	END

END

END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateDeviceToken]    Script Date: 6/25/2017 10:53:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Shankar Nathan
-- Create date: 09 March 2014
-- Description:	UpdateDeviceToken
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateDeviceToken]
(@profile_uid varchar(50), @devicetoken varchar(100), @r int out)
AS
BEGIN

UPDATE profile SET devicetoken=@devicetoken WHERE [uid]=@profile_uid;

SET @r = -1;

END
GO
USE [master]
GO
ALTER DATABASE [tapfantasy] SET  READ_WRITE 
GO
