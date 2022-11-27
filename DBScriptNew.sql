USE [master]
GO
CREATE DATABASE [ETransportationManagement]
 
GO
ALTER DATABASE [ETransportationManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ETransportationManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ETransportationManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ETransportationManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ETransportationManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ETransportationManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ETransportationManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [ETransportationManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ETransportationManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ETransportationManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ETransportationManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ETransportationManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ETransportationManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ETransportationManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ETransportationManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ETransportationManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ETransportationManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ETransportationManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ETransportationManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ETransportationManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ETransportationManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ETransportationManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ETransportationManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ETransportationManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ETransportationManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ETransportationManagement] SET  MULTI_USER 
GO
ALTER DATABASE [ETransportationManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ETransportationManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ETransportationManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ETransportationManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ETransportationManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ETransportationManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ETransportationManagement] SET QUERY_STORE = OFF
GO
USE [ETransportationManagement]
GO
/****** Object:  Table [dbo].[tblCities]    Script Date: 11-Oct-22 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCities](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDriverLicenses]    Script Date: 11-Oct-22 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDriverLicenses](
	[DriverLicenseID] [char](12) NOT NULL,
	[Nationality] [nvarchar](100) NULL,
	[Class] [char](2) NOT NULL,
	[DateExpired] [date] NULL,
	[DriverID] [char](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[DriverLicenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDrivers]    Script Date: 11-Oct-22 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDrivers](
	[DriverID] [char](12) NOT NULL,
	[DriverName] [nvarchar](150) NOT NULL,
	[DOB] [date] NULL,
	[Sex] [bit] NULL,
	[DriverPic] [nvarchar](300) NOT NULL,
	[PhoneNumber] [char](11) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLocations]    Script Date: 11-Oct-22 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLocations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](100) NULL,
	[Address] [nvarchar](100) NULL,
	[CityID] [int] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 11-Oct-22 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[OrderID] [char](5) NOT NULL,
	[CreateDate] [datetime] NULL,
	[PaymentMode] [nvarchar](100) NULL,
	[UserID] [nvarchar](100) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 11-Oct-22 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[RoleID] [char](5) NOT NULL,
	[RoleName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoutes]    Script Date: 11-Oct-22 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoutes](
	[RouteID] [int] IDENTITY(1,1) NOT NULL,
	[RouteName] [nvarchar](100) NULL,
	[StartLocation] [int] NULL,
	[EndLocation] [int] NULL,
	[Description] [nvarchar](1000) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSeats]    Script Date: 11-Oct-22 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSeats](
	[SeatID] [char](5) NOT NULL,
	[Price] [decimal](18, 0) NULL,
	[Status] [bit] NULL,
	[TripID] [char](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SeatID] ASC,
	[TripID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTickets]    Script Date: 11-Oct-22 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTickets](
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[SeatID] [char](5) NOT NULL,
	[TripID] [char](5) NOT NULL,
	[OrderID] [char](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTrips]    Script Date: 11-Oct-22 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTrips](
	[TripID] [char](5) NOT NULL,
	[TripName] [nvarchar](100) NULL,
	[StartDateTime] [datetime] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[Policy] [nvarchar](2000) NULL,
	[RouteID] [int] NULL,
	[VehicleID] [char](5) NULL,
	[DriverID] [char](12) NULL,
	[SeatRemain] [int] NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TripID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 11-Oct-22 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserID] [nvarchar](100) NOT NULL,
	[Username] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[DOB] [date] NULL,
	[Address] [nvarchar](300) NULL,
	[PhoneNumber] [char](11) NULL,
	[Sex] [bit] NULL,
	[RoleID] [char](5) NULL,
	[AccountBalance] [decimal](18, 0) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVehicles]    Script Date: 11-Oct-22 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVehicles](
	[VehicleID] [char](5) NOT NULL,
	[VehicleName] [nvarchar](100) NULL,
	[LicensePlate] [nvarchar](20) NULL,
	[VehicleTypeID] [int] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVehicleTypes]    Script Date: 11-Oct-22 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVehicleTypes](
	[VehicleTypeID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleTypeName] [nvarchar](100) NULL,
	[TotalSeat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VehicleTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCities] ON 
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (1, N'An Giang')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (2, N'Bà Rịa - Vũng Tàu')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (3, N'Bắc Giang')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (4, N'Bắc Kạn')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (5, N'Bạc Liêu')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (6, N'Bắc Ninh')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (7, N'Bến Tre')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (8, N'Bình Định')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (9, N'Bình Dương')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (10, N'Bình Phước')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (11, N'Bình Thuận')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (12, N'Cà Mau')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (13, N'Cần Thơ')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (14, N'Cao Bằng')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (15, N'Đà Nẵng')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (16, N'Đắk Lắk')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (17, N'Đắk Nông')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (18, N'Điện Biên')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (19, N'Đồng Nai')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (20, N'Đồng Tháp')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (21, N'Gia Lai')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (22, N'Hà Giang')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (23, N'Hà Nam')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (24, N'Hà Nội')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (25, N'Hà Tĩnh')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (26, N'Hải Dương')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (27, N'Hải Phòng')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (28, N'Hậu Giang')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (29, N'Hòa Bình')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (30, N'Hưng Yên')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (31, N'Khánh Hòa')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (32, N'Kiên Giang')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (33, N'Kon Tum')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (34, N'Lai Châu')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (35, N'Lâm Đồng')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (36, N'Lạng Sơn')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (37, N'Lào Cai')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (38, N'Long An')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (39, N'Nam Định')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (40, N'Nghệ An')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (41, N'Ninh Bình')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (42, N'Ninh Thuận')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (43, N'Phú Thọ')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (44, N'Phú Yên')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (45, N'Quảng Bình')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (46, N'Quảng Nam')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (47, N'Quảng Ngãi')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (48, N'Quảng Ninh')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (49, N'Quảng Trị')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (50, N'Sóc Trăng')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (51, N'Sơn La')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (52, N'Tây Ninh')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (53, N'Thái Bình')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (54, N'Thái Nguyên')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (55, N'Thanh Hóa')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (58, N'Thành phố Hồ Chí Minh')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (56, N'Thừa Thiên Huế')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (57, N'Tiền Giang')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (59, N'Trà Vinh')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (60, N'Tuyên Quang')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (61, N'Vĩnh Long')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (62, N'Vĩnh Phúc')
GO
INSERT [dbo].[tblCities] ([CityID], [CityName]) VALUES (63, N'Yên Bái')
GO
SET IDENTITY_INSERT [dbo].[tblCities] OFF
GO
INSERT [dbo].[tblDriverLicenses] ([DriverLicenseID], [Nationality], [Class], [DateExpired], [DriverID]) VALUES (N'VT001       ', N'Việt Nam', N'B1', CAST(N'1997-03-12' AS Date), N'030202034704')
GO
INSERT [dbo].[tblDriverLicenses] ([DriverLicenseID], [Nationality], [Class], [DateExpired], [DriverID]) VALUES (N'VT002       ', N'Việt Nam', N'D ', CAST(N'1997-03-12' AS Date), N'065947369485')
GO
INSERT [dbo].[tblDriverLicenses] ([DriverLicenseID], [Nationality], [Class], [DateExpired], [DriverID]) VALUES (N'VT003       ', N'Việt Nam', N'C ', CAST(N'1997-03-12' AS Date), N'384950384739')
GO
INSERT [dbo].[tblDriverLicenses] ([DriverLicenseID], [Nationality], [Class], [DateExpired], [DriverID]) VALUES (N'VT004       ', N'Việt Nam', N'B2', CAST(N'1997-03-12' AS Date), N'483957209388')
GO
INSERT [dbo].[tblDriverLicenses] ([DriverLicenseID], [Nationality], [Class], [DateExpired], [DriverID]) VALUES (N'VT005       ', N'Việt Nam', N'C ', CAST(N'1997-03-12' AS Date), N'574839205937')
GO
INSERT [dbo].[tblDriverLicenses] ([DriverLicenseID], [Nationality], [Class], [DateExpired], [DriverID]) VALUES (N'VT006       ', N'Việt Nam', N'D ', CAST(N'1997-03-12' AS Date), N'844958937398')
GO
INSERT [dbo].[tblDriverLicenses] ([DriverLicenseID], [Nationality], [Class], [DateExpired], [DriverID]) VALUES (N'VT007       ', N'Việt Nam', N'B2', CAST(N'1997-03-12' AS Date), N'849504739458')
GO
INSERT [dbo].[tblDriverLicenses] ([DriverLicenseID], [Nationality], [Class], [DateExpired], [DriverID]) VALUES (N'VT008       ', N'Việt Nam', N'C ', CAST(N'1997-03-12' AS Date), N'889378529034')
GO
INSERT [dbo].[tblDriverLicenses] ([DriverLicenseID], [Nationality], [Class], [DateExpired], [DriverID]) VALUES (N'VT009       ', N'Việt Nam', N'D ', CAST(N'1997-03-12' AS Date), N'894590459723')
GO
INSERT [dbo].[tblDrivers] ([DriverID], [DriverName], [DOB], [Sex], [DriverPic], [PhoneNumber], [Status]) VALUES (N'030202034704', N'Kiều Minh Hiếu', CAST(N'2002-08-23' AS Date), 1, N'', N'0912345678 ', 1)
GO
INSERT [dbo].[tblDrivers] ([DriverID], [DriverName], [DOB], [Sex], [DriverPic], [PhoneNumber], [Status]) VALUES (N'065947369485', N'Nguyễn Hiển Vinh', CAST(N'2002-06-24' AS Date), 1, N'', N'0912345678 ', 1)
GO
INSERT [dbo].[tblDrivers] ([DriverID], [DriverName], [DOB], [Sex], [DriverPic], [PhoneNumber], [Status]) VALUES (N'384950384739', N'Lê Tuấn Tài', CAST(N'1993-07-29' AS Date), 1, N'', N'0912345678 ', 1)
GO
INSERT [dbo].[tblDrivers] ([DriverID], [DriverName], [DOB], [Sex], [DriverPic], [PhoneNumber], [Status]) VALUES (N'483957209388', N'Trần Nhật Tuân', CAST(N'1995-07-26' AS Date), 1, N'', N'0912345678 ', 2)
GO
INSERT [dbo].[tblDrivers] ([DriverID], [DriverName], [DOB], [Sex], [DriverPic], [PhoneNumber], [Status]) VALUES (N'574839205937', N'Nguyễn Vinh Hoa', CAST(N'1992-07-29' AS Date), 1, N'', N'0912345678 ', 0)
GO
INSERT [dbo].[tblDrivers] ([DriverID], [DriverName], [DOB], [Sex], [DriverPic], [PhoneNumber], [Status]) VALUES (N'844958937398', N'Đặng Tuấn Tài', CAST(N'1994-07-23' AS Date), 1, N'', N'0912345678 ', 1)
GO
INSERT [dbo].[tblDrivers] ([DriverID], [DriverName], [DOB], [Sex], [DriverPic], [PhoneNumber], [Status]) VALUES (N'849504739458', N'Tô Mỹ Lệ', CAST(N'2000-01-27' AS Date), 0, N'', N'0912345678 ', 1)
GO
INSERT [dbo].[tblDrivers] ([DriverID], [DriverName], [DOB], [Sex], [DriverPic], [PhoneNumber], [Status]) VALUES (N'889378529034', N'Ngô Ngọc Vân Trang', CAST(N'2002-02-24' AS Date), 0, N'', N'0912345678 ', 2)
GO
INSERT [dbo].[tblDrivers] ([DriverID], [DriverName], [DOB], [Sex], [DriverPic], [PhoneNumber], [Status]) VALUES (N'894590459723', N'Đăng Thị Hương', CAST(N'1997-03-12' AS Date), 0, N'', N'0912345678 ', 0)
GO
SET IDENTITY_INSERT [dbo].[tblLocations] ON 
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (1, N'Đắk Lắk', N'172 Lê Duẩn, TP Buôn Ma Thuột, Đắk Lắk', 16, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (2, N'Đắk Nông', N'226 Hai Bà Trưng, Nghĩa Thành, Gia Nghĩa, Đắk Nông', 17, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (3, N'CHÂU ĐỐC', N'89 Phan Văn Vàng , P.Châu Phú B, TP.Châu Đốc, An Giang', 1, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (4, N'BẠC LIÊU', N'QL1A, Khóm 2, P.7, TP.Bạc Liêu, Bạc Liêu', 5, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (5, N'BẾN TRE', N'Đường Võ Nguyên Giáp, Quốc lộ 60, xã Sơn Đông, Tp. Bến Tre, Tỉnh Bến Tre', 7, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (6, N'CÀ MAU', N'309 Lý Thường Kiệt, P.6, TP.Cà Mau, Cà Mau', 12, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (7, N'NĂM CĂN', N'Khóm Cái Nai, TT.Năm Căn, H.Năm Căn, Cà Mau (BX Năm Căn)', 12, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (8, N'HỘ PHÒNG', N'Kênh 6 QL 1A, Ấp 1, Ngã 3 Giá Ray, Bạc Liêu', 5, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (9, N'91B', N'91B Nguyễn Văn Linh, P.Hưng Lợi, Q.Ninh Kiều, TP.Cần Thơ (BX 91B Cần Thơ)', 13, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (10, N'Ô MÔN', N'QL91, P.Châu Văn Liêm, Q.Ô Môn, TP.Cần Thơ (BX Ô Môn)', 13, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (11, N'CAO LÃNH', N'17-19 Võ Thị Sáu, P.2, TP.Cao Lãnh, Đồng Tháp', 20, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (12, N'VỊNH TRE', N'Xã Vĩnh Thạnh Trung, TT.Cái Dầu, H.Châu Phú, An Giang', 1, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (13, N'BX MỚI CHÂU ĐỐC', N'QL 91, Tôn Đức Thắng, P.Vĩnh Mỹ, TP.Châu Đốc, An Giang (BX Mới Châu Đốc)', 1, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (14, N'CHỢ RẪY', N'20 Phạm Hữu Chí, Phường 11, Quận 5, Thành phố Hồ Chí Minh', 58, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (15, N'ĐÀ LẠT', N'01 Tô Hiến Thành, P.6, TP.Đà Lạt, Lâm Đồng', 35, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (16, N'ĐỨC TRỌNG', N'695-697, QL20 Liên Nghĩa, H.Đức Trọng, Lâm Đồng', 35, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (17, N'DI LINH', N'735 Hùng Vương, TT.Di Linh, H.Di Linh, Lâm Đồng', 35, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (18, N'BẢO LỘC', N'280 Trần Phú, TX.Bảo Lộc, Lâm Đồng', 35, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (19, N'HÀ TIÊN', N'QL80, KP 5, P.Bình San, TX.Hà Tiên, Kiên Giang (BX Hà Tiên)', 32, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (20, N'KIÊN LƯƠNG', N'397 QL 80, KP Ngã ba, TT.Kiên Lương, H.Kiên Lương, Kiên Giang', 32, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (21, N'BA HÒN', N'QL 80, Tổ 3, KP Kiên Tân, TT.Kiên Lương, H.Kiên Lương, Kiên Giang', 32, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (22, N'NGÃ 7 PHỤNG HIỆP', N'BX Ngã 7, P.Ngã Bảy, TX.Ngã Bảy, Hậu Giang', 28, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (23, N'HỒNG NGỰ', N'Ngã 4 Võ Văn Kiệt - Điện Biên Phủ, P.Thanh An, TX.Hồng Ngự, Đồng Tháp', 20, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (24, N'LÂM ĐỒNG', N'795 - QL20 - TT Liên Nghĩa - Huyện Đức Trọng - Lâm Đồng', 35, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (25, N'BÌNH HÒA', N'QL91, X.Bình Hòa, H.Châu Thành, An Giang', 1, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (26, N'LONG XUYÊN', N'99 Hàm Nghi, P. Bình Khánh, TP.Long Xuyên, An Giang', 1, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (27, N'VÀM CỐNG', N'Bến Phà Vàm Cống,  TP.Long Xuyên, An Giang', 1, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (28, N'LỘ TẺ TRI TÔN', N'Ngã 3 Lộ Tẻ Tri Tôn, X.Bình Hòa, H.Châu Thành, An Giang', 1, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (29, N'PHÚ HÒA', N'Âp Phú Hữu, TT.Phú Hòa, H.Thoại Sơn, An Giang', 1, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (30, N'AN HÒA', N'19-20X Lý Thái Tổ, P.Mỹ Long, TP.Long Xuyên (cách cổng phà An Hòa 50m)', 1, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (31, N'NGUYỄN CƯ TRINH', N'26 Nguyễn Cư Trinh, Phường Phạm Ngũ Lão, Quận 1', 58, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (32, N'BX PHÍA NAM', N'64 Trần Quý Cáp, TP.Phan Thiết, Bình Thuận', 11, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (33, N'BX PHÍA BẮC', N'01 Từ Văn Tư, TP.Phan Thiết, Bình Thuận', 11, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (34, N'PHAN THIẾT', N'121 Tôn Đức Thắng, TP.Phan Thiết, Bình Thuận', 11, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (35, N'MŨI NÉ', N'20 Huỳnh Thức Kháng, P.Hàm Tiến, TP.Phan Thiết, Bình Thuận', 11, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (36, N'VP 326 ĐƯỜNG 19/04', N'326 Đường 19/04, P.Xuân An, TP.Phan Thiết, Bình Thuận', 11, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (37, N'RẠCH SỎI', N'12 Mai Thị Hồng Hạnh, KP3, P.Rạch Sỏi, TP.Kiên Giang, Kiên Giang (BX Rạch Sỏi)', 32, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (38, N'RẠCH GIÁ', N'260A Nguyễn Bỉnh Khiêm, P.Vĩnh Quang, TP.Rạch Giá, Kiên Giang (BX Rạch Giá)', 32, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (39, N'LẠC HỒNG', N'67-69 Lạc Hồng, P.Vĩnh Lạc, TP.Rạch Giá, Kiên Giang', 32, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (40, N'TÂN HIỆP', N'137-139 Ấp Đông Hưng, TT.Tân Hiệp, H.Tân Hiệp, Kiên Giang', 32, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (41, N'SA ĐÉC', N'149/8 Khóm Hòa Khánh, P.2, TP.Sa Đéc, Đồng Tháp', 20, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (42, N'LAI VUNG', N'137A QL80, X.Hòa Long, H.Lai Vung, Đồng Tháp', 20, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (43, N'LẤP VÒ', N'135 đường 3/2, Ấp Bình Thạnh 1, TT.Lấp Vò, H.Lấp Vò, Đồng Tháp', 20, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (44, N'CÁI TÀU HẠ', N'QL80, Khóm Phú Mỹ Hiệp, TT.Cái Tàu Hạ, H.Châu Thành, Đồng Tháp', 20, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (45, N'SÀI GÒN', N'9 Đặng Thái Thân, Phường 11, Quận 5, Thành phố Hồ Chí Minh', 58, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (46, N'SÀI GÒN', N'68 Nơ Trang Long, Phường 14, Quận Bình Thạnh, Thành phố Hồ Chí Minh', 58, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (47, N'SÓC TRĂNG', N'38 Lê Duẩn, P.3, TP.Sóc Trăng, Sóc Trăng', 50, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (48, N'An Trạch', N'720 QL 1A, Ấp An Trạch, X.An Hiêp, H.Châu Thành, Sóc Trăng', 50, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (49, N'ĐỒNG TÂM', N'Ngã 4 Đồng Tâm, Ấp 4, X.Tam Hiệp, H.Châu Thành, Tiền Giang', 57, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (50, N'BX MIỀN TÂY - QUẦY 32-33', N'395 - 397 Kinh Dương Vương, P.An Lạc, Q.Bình Tân, TP.HCM', 58, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (51, N'SUỐI LINH', N'D9 Tổ 2, KP4, XLHN, P.Long Bình, TP. Biên Hòa (ngã 3 Tam Hiệp, Suối Linh)', 19, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (52, N'BX MIỀN ĐÔNG', N'292 Đinh Bộ Lĩnh, P.26, Q.Bình Thạnh, TP.HCM', 58, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (53, N'Y DƯỢC', N'15 Lô A Đặng Thái Thân, P.11, Q.5, TP.HCM', 58, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (54, N'CAO VĂN LẦU', N'94 Cao Văn Lầu, Q.6, TP.HCM', 58, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (55, N'ĐỀ THÁM', N'272 Đề Thám, P.Pham ngũ Lão, Q.1, TP.HCM', 58, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (56, N'231 LÊ HỒNG PHONG', N'231 - 233 Lê Hồng Phong, P.4, Q.5, TP.HCM', 58, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (57, N'HÀNG XANH', N'486H Điện Biên Phủ, P.21, Q.Bình Thạnh, TP.HCM', 58, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (58, N'XA LỘ HÀ NỘI', N'798 Xa Lộ Hà Nội, P.Hiệp Phú, Q.9, TP.HCM', 58, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (59, N'TRÀ VINH', N'559 QL54, Khóm 4, P.9, TP.Trà Vinh, Trà Vinh (BX Trà Vinh)', 59, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (60, N'KINH CÙNG', N'TT.Kinh Cùng, H.Phụng Hiệp, Hậu Giang', 28, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (61, N'VỊ THANH', N'Trần Hưng Đạo (nối dài,1), P.5, TP.Vị Thanh, Hậu Giang', 28, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (62, N'VĨNH TƯỜNG', N'275 Ấp Bình Tân, X.Long Bình, TX.Long Mỹ, Hậu Giang', 28, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (63, N'CÁI TẮC', N'Ấp Tân Phú, TT.Cái Tắc, H.Châu Thành A, Hậu Giang', 28, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (64, N'VĨNH LONG', N'1E Đinh Tiên Hoàng, P.8, TP.Vĩnh Long, Vĩnh Long (BX Vĩnh Long)', 61, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (65, N'Song Phú', N'Lô A-27 Khu đô thị mới Chợ Song Phú, Ấp Phú Ninh, X.Song Phú, H.Tam Bình,Vĩnh Long', 61, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (66, N'BÌNH MINH', N'Khóm 2, P.Thành Phước, TX.Bình Minh, Vĩnh Long', 61, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (67, N'BX VŨNG TÀU', N'192 Nam Kỳ Khởi Nghĩa, P.3, TP.Vũng Tàu', 2, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (68, N'BÀ RỊA', N'Nguyễn Thanh Đằng, P.Phước Hiệp, TP.Bà Rịa, Bà Rịa - Vũng Tàu (BX Bà Rịa)', 2, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (69, N'ẸO ÔNG TỪ', N'1632 đường 30/4, P.12, TP.Vũng Tàu', 2, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (70, N'TÂN THÀNH', N'Thôn Tân Ngọc, TT.Phú Mỹ, H.Tân Thành, Bà Rịa - Vũng Tàu', 2, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (71, N'BẾN XE NINH THUẬN', N'52 Quốc lộ 1A, Đài Sơn, Phan Rang-Tháp Chàm, Ninh Thuận', 42, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (72, N'BX ĐÀ NẴNG', N'37 Nam Trân, P.Hòa Minh, Q.Liên Chiểu, TP.Đà Nẵng (BX Đà Nẵng)', 15, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (73, N'NAM PHƯỚC', N'QL1 TT.Nam Phước,  H.Duy Xuyên, Quảng Nam (BX Nam phước)', 46, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (74, N'MA LÂM', N'462 Đường 8/4 (QL28), Khu phố 1, Thị trấn Ma Lâm, Huyện Hàm Thuận Bắc, Bình thuận', 11, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (75, N'NGÔ GIA TỰ', N'210  Ngô Gia Tự, Phường Thanh Sơn, TP. Phan Rang', 42, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (76, N'07 HOÀNG HOA THÁM', N'7 Hoàng Hoa Thám, TP.Nha Trang, Khánh Hòa', 31, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (77, N'BX PHÍA NAM', N'Đường 23/10, TT.Diên Khánh, H.Diên Khánh, Khánh Hòa', 31, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (78, N'BX PHÍA BẮC', N'01 Đường 2/4, P.Vĩnh Hòa, TP.Nha Trang, Khánh Hòa', 31, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (79, N'DIÊN KHÁNH', N'181 Lạc Long Quân, TT.Diên Khánh, H.Diên Khánh, Khánh Hòa', 31, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (80, N'CAM RANH', N'1 Lê Duẩn, P.Cam Lộc, TP.Cam Ranh, Khánh Hòa', 31, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (81, N'Ninh Hòa', N'QL1A, Thôn Thanh Châu, P.Ninh Giang, TX.Ninh Hòa, Khánh Hòa (BX Ninh Hòa)', 31, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (82, N'PHAN RÍ', N'Quốc Lộ  1A, Thị trấn Phan Rí Cửa, Huyện Tuy Phong, Tỉnh Bình Thuận', 11, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (83, N'PHÚ QUÝ', N'144 QL1A Phú Quý, Thị trấn Phước Dân, Huyện Ninh Phước, Ninh Thuận', 42, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (84, N'QUẢNG NGÃI', N'Bà Triệu, P.Nghĩa Chánh, TP.Quảng Ngãi, Quảng Ngãi', 47, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (85, N'BÌNH SƠN', N'Tổ 5 Lê Đại Hành, TT.Châu Ổ, Bình Sơn, Quảng Ngãi', 47, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (86, N'QUY NHƠN', N'187 Tây Sơn, P.Ghềnh Trắng, TP.Quy Nhơn, Bình Định', 8, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (87, N'PHÚ TÀI', N'Ngã ba Phú Tài, 129 Lạc Long Quân, P.Trần Quang Diệu, TP.Quy Nhơn, Bình Định', 8, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (88, N'BX GIÁP BÁT', N'Km số 6, đường Giải Phóng, P.Hoàng Liệt, Q.Hoàng Mai, Hà Nội (BX Giáp Bát)', 24, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (89, N'BX PHÍA NAM', N'97 An Dương Vương, P.An Tây, TP.Huế, Thừa Thiên - Huế', 56, 1)
GO
INSERT [dbo].[tblLocations] ([LocationID], [LocationName], [Address], [CityID], [Status]) VALUES (90, N'BX NAM ĐỊNH', N'Km số 2, đường Điện Biên, X.Lộc Hòa, TP.Nam Định, Nam Định (BX Nam Định)', 39, 1)
GO
SET IDENTITY_INSERT [dbo].[tblLocations] OFF
GO
INSERT [dbo].[tblRoles] ([RoleID], [RoleName]) VALUES (N'1    ', N'User')
GO
INSERT [dbo].[tblRoles] ([RoleID], [RoleName]) VALUES (N'2    ', N'Staff')
GO
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [Email], [DOB], [Address], [PhoneNumber], [Sex], [RoleID], [AccountBalance], [Status]) VALUES (N'admin', N'Lê Đức Minh', N'admin', N'ducminh@gmail.com', CAST(N'1996-07-13' AS Date), N'48 Lũy Bán Bích, Bình Tân, HCM', N'0912345678 ', 1, N'2    ', CAST(0 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [Email], [DOB], [Address], [PhoneNumber], [Sex], [RoleID], [AccountBalance], [Status]) VALUES (N'buoncuatoi', N'Tô Thi Lý', N'123', N'toly@gmail.com', CAST(N'1996-06-22' AS Date), N'48 Luy Bán Bích, Bình Tân, HCM', N'0912345678 ', 0, N'1    ', CAST(450000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [Email], [DOB], [Address], [PhoneNumber], [Sex], [RoleID], [AccountBalance], [Status]) VALUES (N'coanhcho', N'Lê Văn Minh', N'123', N'vanminh@gmail.com', CAST(N'1998-09-11' AS Date), N'56 Tân Hòa Đông, Bình Tân, HCM', N'0912345679 ', 1, N'1    ', CAST(400000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [Email], [DOB], [Address], [PhoneNumber], [Sex], [RoleID], [AccountBalance], [Status]) VALUES (N'conangbian', N'Lê Ngọc Diệp', N'123', N'bian@gmail.com', CAST(N'1996-06-15' AS Date), N'48 Lũy Bán Bích, Bình Tân, HCM', N'0912345678 ', 0, N'2    ', CAST(0 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[tblUsers] ([UserID], [Username], [Password], [Email], [DOB], [Address], [PhoneNumber], [Sex], [RoleID], [AccountBalance], [Status]) VALUES (N'nangchoichang', N'Trần Quang Đại', N'123', N'quangdai@gmail.com', CAST(N'1996-06-12' AS Date), N'48 Lũy Bán Bích, Bình Tân, HCM', N'0912345678 ', 1, N'1    ', CAST(300000 AS Decimal(18, 0)), 1)
GO
INSERT [dbo].[tblVehicles] ([VehicleID], [VehicleName], [LicensePlate], [VehicleTypeID], [Status]) VALUES (N'VE001', N'Limousin', N'51H-95044', 1, 1)
GO
INSERT [dbo].[tblVehicles] ([VehicleID], [VehicleName], [LicensePlate], [VehicleTypeID], [Status]) VALUES (N'VE002', N'Limousin', N'51A-85144', 1, 1)
GO
INSERT [dbo].[tblVehicles] ([VehicleID], [VehicleName], [LicensePlate], [VehicleTypeID], [Status]) VALUES (N'VE003', N'Limousin', N'51F-95044', 2, 1)
GO
INSERT [dbo].[tblVehicles] ([VehicleID], [VehicleName], [LicensePlate], [VehicleTypeID], [Status]) VALUES (N'VE004', N'Limousin', N'30A-12893', 3, 1)
GO
INSERT [dbo].[tblVehicles] ([VehicleID], [VehicleName], [LicensePlate], [VehicleTypeID], [Status]) VALUES (N'VE005', N'Limousin', N'51F-03336', 1, 1)
GO
INSERT [dbo].[tblVehicles] ([VehicleID], [VehicleName], [LicensePlate], [VehicleTypeID], [Status]) VALUES (N'VE006', N'Limousin', N'51G-83060', 2, 1)
GO
INSERT [dbo].[tblVehicles] ([VehicleID], [VehicleName], [LicensePlate], [VehicleTypeID], [Status]) VALUES (N'VE007', N'Hyundai County', N'51C-88634', 1, 1)
GO
INSERT [dbo].[tblVehicles] ([VehicleID], [VehicleName], [LicensePlate], [VehicleTypeID], [Status]) VALUES (N'VE008', N'Limousin', N'51T-99999', 1, 1)
GO
INSERT [dbo].[tblVehicles] ([VehicleID], [VehicleName], [LicensePlate], [VehicleTypeID], [Status]) VALUES (N'VE009', N'Hyundai Universe', N'75A-14519', 3, 1)
GO
INSERT [dbo].[tblVehicles] ([VehicleID], [VehicleName], [LicensePlate], [VehicleTypeID], [Status]) VALUES (N'VE010', N'Hyundai Aero Hi-class', N'34A-12913', 3, 1)
GO
INSERT [dbo].[tblVehicles] ([VehicleID], [VehicleName], [LicensePlate], [VehicleTypeID], [Status]) VALUES (N'VE011', N'Hyundai Space', N'51U-13436', 4, 1)
GO
INSERT [dbo].[tblVehicles] ([VehicleID], [VehicleName], [LicensePlate], [VehicleTypeID], [Status]) VALUES (N'VE012', N'Huyndai Aero Town', N'51C-13560', 4, 1)
GO
SET IDENTITY_INSERT [dbo].[tblVehicleTypes] ON 
GO
INSERT [dbo].[tblVehicleTypes] ([VehicleTypeID], [VehicleTypeName], [TotalSeat]) VALUES (1, N'Xe 16 chỗ', 16)
GO
INSERT [dbo].[tblVehicleTypes] ([VehicleTypeID], [VehicleTypeName], [TotalSeat]) VALUES (2, N'Xe 29 chỗ', 29)
GO
INSERT [dbo].[tblVehicleTypes] ([VehicleTypeID], [VehicleTypeName], [TotalSeat]) VALUES (3, N'Xe 45 chỗ', 45)
GO
SET IDENTITY_INSERT [dbo].[tblVehicleTypes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblCitie__886159E51651116D]    Script Date: 11-Oct-22 14:33:47 ******/
ALTER TABLE [dbo].[tblCities] ADD UNIQUE NONCLUSTERED 
(
	[CityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblUsers__536C85E4C0E38287]    Script Date: 11-Oct-22 14:33:47 ******/
ALTER TABLE [dbo].[tblUsers] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDrivers] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[tblLocations] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[tblOrders] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[tblOrders] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[tblRoutes] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[tblSeats] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[tblTrips] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[tblUsers] ADD  DEFAULT ((0)) FOR [AccountBalance]
GO
ALTER TABLE [dbo].[tblUsers] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[tblVehicles] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[tblDriverLicenses]  WITH CHECK ADD FOREIGN KEY([DriverID])
REFERENCES [dbo].[tblDrivers] ([DriverID])
GO
ALTER TABLE [dbo].[tblLocations]  WITH CHECK ADD FOREIGN KEY([CityID])
REFERENCES [dbo].[tblCities] ([CityID])
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[tblUsers] ([UserID])
GO
ALTER TABLE [dbo].[tblRoutes]  WITH CHECK ADD FOREIGN KEY([EndLocation])
REFERENCES [dbo].[tblLocations] ([LocationID])
GO
ALTER TABLE [dbo].[tblRoutes]  WITH CHECK ADD FOREIGN KEY([StartLocation])
REFERENCES [dbo].[tblLocations] ([LocationID])
GO
ALTER TABLE [dbo].[tblSeats]  WITH CHECK ADD FOREIGN KEY([TripID])
REFERENCES [dbo].[tblTrips] ([TripID])
GO
ALTER TABLE [dbo].[tblTickets]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[tblOrders] ([OrderID])
GO
ALTER TABLE [dbo].[tblTickets]  WITH CHECK ADD  CONSTRAINT [FK_TblTickets_TblSeat] FOREIGN KEY([SeatID], [TripID])
REFERENCES [dbo].[tblSeats] ([SeatID], [TripID])
GO
ALTER TABLE [dbo].[tblTickets] CHECK CONSTRAINT [FK_TblTickets_TblSeat]
GO
ALTER TABLE [dbo].[tblTrips]  WITH CHECK ADD FOREIGN KEY([DriverID])
REFERENCES [dbo].[tblDrivers] ([DriverID])
GO
ALTER TABLE [dbo].[tblTrips]  WITH CHECK ADD FOREIGN KEY([RouteID])
REFERENCES [dbo].[tblRoutes] ([RouteID])
GO
ALTER TABLE [dbo].[tblTrips]  WITH CHECK ADD FOREIGN KEY([VehicleID])
REFERENCES [dbo].[tblVehicles] ([VehicleID])
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[tblRoles] ([RoleID])
GO
ALTER TABLE [dbo].[tblVehicles]  WITH CHECK ADD FOREIGN KEY([VehicleTypeID])
REFERENCES [dbo].[tblVehicleTypes] ([VehicleTypeID])
GO
USE [master]
GO
ALTER DATABASE [ETransportationManagement] SET  READ_WRITE 
GO
