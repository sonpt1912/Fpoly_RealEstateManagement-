CREATE DATABASE QLBDS
GO
USE QLBDS
GO
CREATE TABLE vanPhong
(
		Id INT PRIMARY KEY,
		Ma VARCHAR(10),
		Dc NVARCHAR(MAX),
		Quan NVARCHAR(30),
		ThanhPho NVARCHAR(30),
		Loai NVARCHAR(30)
);
CREATE TABLE chucVu 
(
		Id INT PRIMARY KEY,
		Ma VARCHAR(10),
		Ten NVARCHAR(40)

);
CREATE TABLE taiKhoan
(
		Id INT PRIMARY KEY,
		Ten VARCHAR(30),
		MatKhau INT
);
CREATE TABLE nhanVien 
(
		Id INT PRIMARY KEY,
		IdCV INT,
		IdTK INT,
		IdVP INT,
		Ten NVARCHAR(20),
		TenDem NVARCHAR(30),
		Ho NVARCHAR(30),
		Ma VARCHAR(10),
		GioiTinh NVARCHAR(5)
		CONSTRAINT FK_nvcv FOREIGN KEY (IdCV) REFERENCES chucVu(Id),
		CONSTRAINT FK_vpnv FOREIGN KEY (IdVP) REFERENCES vanPhong(Id),
		CONSTRAINT FK_nvtk FOREIGN KEY (IdTK) REFERENCES taiKhoan(Id)
);
CREATE TABLE CHUSOHUU
(
		Id INT PRIMARY KEY,
		Sdt INT,
		Ma VARCHAR(10),
		Ten NVARCHAR(30),
		TenDem NVARCHAR(30),
		Ho NVARCHAR(30)
);
CREATE TABLE BDS
(
		Id INT PRIMARY KEY,
		IdCSH INT,
		IdVP INT,
		Ma VARCHAR(10),
		Dc NVARCHAR(100),
		Quan NVARCHAR(30),
		ThanhPho NVARCHAR(30),
		Loai NVARCHAR(40),
		dienTich INT,
		Gia MONEY,
		CONSTRAINT FK_bdschs FOREIGN KEY (IdCSH) REFERENCES CHUSOHUU(Id),
		CONSTRAINT FK_vpbds FOREIGN KEY (IdVP) REFERENCES vanPhong(Id)
);


-- THÊM DỮ LIỆU VÀO BẢNG
/*Id INT PRIMARY KEY,
		Ma VARCHAR(10),
		Dc NVARCHAR(MAX),
		Quan NVARCHAR(30),
		ThanhPho NVARCHAR(30),
		Loai NVARCHAR(30)*/
INSERT vanPhong VALUES (001,'VP001', N'tòa nhà Golden Place', N'Nam Từ Liêm', N'Hà Nội', N'Văn Phòng chính thức'),
					   (002,'VP002', N'Tầng 2 tòa nhà Ananis', N'Hai Bà Trưng', N'Hà Nội', N'Văn phòng đại diện'),
					   (003,'VP003', N'Tầng 1 tòa nhà Golden City', N'Long Biên', N'Hà Nội', N'Văn phòng đại diện')
INSERT chucVu VALUES  (001, 'GD', N'Giám Đốc'), (002, 'PGD', N'Phó Giám Đốc'),
					  (003, 'QLCN', N'Quản Lý Văn Phòng'), (004, 'PQLCN', N'Phó Quản Lý Văn Phòng'),
					  (005, 'NV', N'Nhân Viên'), (006, 'BV', N'Bảo Vệ'),
					  (007, 'NVLT', N'Nhân Viên Lễ Tân')
/*Id INT PRIMARY KEY,
		Ten VARCHAR(30),
		MatKhau INT*/
INSERT taiKhoan VALUES (001, 'sonptph25875', 191203),(002, 'tuanptph25875', 191203),(003, 'duongptph25875', 191203),
					   (004, 'namptph25875', 191203),(005, 'tungptph25875', 191203),(006, 'bachptph25875', 191203),
					   (007, 'Lyptph25875', 191203),(008, 'tienptph25875', 191203)
/*Id INT PRIMARY KEY,
		IdCV INT,
		IdTK INT,
		IdVP INT,
		Ten NVARCHAR(20),
		TenDem NVARCHAR(30),
		Ho NVARCHAR(30),
		Ma VARCHAR(10),
		GioiTinh NVARCHAR(5)*/
INSERT nhanVien VALUES (001, 001, 001, 001, N'Sơn', N'Thanh', N'Phạm', 'NV1', N'Nam'), (002,002, 004, 001, N'Nam', N'Đức', N'Nguyễn', 'NV2', N'Nam'),
					   (003, 006, null, 002, N'Đức', N'Nam', N'Trần', 'NV3', N'Nam'), (004, 003, 002, 002,  N'Tuấn', N'Thanh', N'Nguyễn', 'NV4', N'Nam'),
					   (005, 005, null, 001, N'Diệu', N'Anh', N'Nguyễn', 'NV5', N'Nữ'), (006, 006, null, 002, N'Quỳnh', N'Ngọc', N'Nguyễn', 'NV6', N'Nam'),
					   (007, 004, 005, 001, N'Tùng', N'Minh', N'Nguyễn', 'NV7', N'Nam'), (008, 005,null, 002,  N'Nghĩa', N'Trần', N'Nguyễn', 'NV8', N'Nam'),
					   (010, 005, null, 002, N'Quân', N'Nam', N'Trần', 'NV9', N'Nam'), (011, 007, null, 003, N'Giang', N'Đức', N'Phạm', 'NV10', N'Nữ'),
				 	   (012, 005, null, 001, N'Quân', N'Hồng', N'Nguyễn', 'NV11', N'Nam'), (013, 005, null, 003, N'Tài', N'Tú', N'Nguyễn', 'NV12', N'Nam'),
		    		   (014, 004, 003, 002, N'Dương', N'Thùy', N'Nguyễn', 'NV13', N'Nữ'), (015, 003, 006, 001, N'Bách', N'Thanh', N'Trần', 'NV14', N'Nam'),
					   (016, 007, null, 001, N'Nhi', N'yến', N'Bạch', 'NV15',N'Nữ'), (017, 005, null, 003, N'Hưng', N'Tuấn', N'Phùng', 'NV16', N'Nam'),
					   (018, 003, 007,003, N'Ly', N'Thùy', N'Nguyễn', 'NV17', N'Nữ'), (019, 004, 008, 003, N'Tien', N'Thanh', N'Trần', 'NV14', N'Nam'),
					   (021, 006, null, 003, N'Đốc', N'Tuấn', N'Phùng', 'NV16', N'Nam')
/*Id INT PRIMARY KEY,
		Sdt INT,
		Ma VARCHAR(10),
		Ten NVARCHAR(30),
		TenDem NVARCHAR(30),
		Ho NVARCHAR(30)*/
INSERT CHUSOHUU VALUES (001, 0333228864, 'CHS001', N'Đức', N'Thanh', N'Nguyễn'),
					   (002, 0339528837, 'CHS002', N'Tuấn', N'Thanh', N'Nguyễn'),
					   (003, 0379228852, 'CHS003', N'Hiệu', N'Thanh', N'Nguyễn'),
					   (004, 0389528394, 'CHS004', N'Nam', N'Thanh', N'Nguyễn'),
					   (005, 0389428821, 'CHS005', N'Tùng', N'Thanh', N'Nguyễn')
					  
/*Id INT PRIMARY KEY,
		IdCSH INT,
		IdVP INT,
		Ma VARCHAR(10),
		Dc NVARCHAR(100),
		Quan NVARCHAR(30),
		ThanhPho NVARCHAR(30),
		Loai NVARCHAR(40),
		dienTich INT*/
INSERT BDS VALUES	   (001, 001, 001, 'BDS001', N'Số 21, Ngõ 59 Mễ Trì Hạ', N'Nam Từ Liêm', N'Hà Nội', N'Đất thổ cư', 620, 12000000000),
					   (002, 001, 001,'BDS002', N'Số 5, Ngõ 52/3 Mễ Trì Hạ', N'Nam Từ Liêm', N'Hà Nội', N'Đất thổ cư', 126, 1200000000),
					   (003, 001, 001,'BDS003', N'Số 4, Ngõ 59 Mễ Trì Hạ', N'Nam Từ Liêm', N'Hà Nội', N'Đất thổ cư', 150, 1200000000),
					   (004, 001, 001,'BDS004', N'Số 9, Ngõ 34/1 Mễ Trì Hạ', N'Nam Từ Liêm', N'Hà Nội', N'Đất thổ cư', 630, 4000000000),
					   (005, 001, 001,'BDS005', N'Số 8, Ngõ 31/6 Mễ Trì Hạ', N'Nam Từ Liêm', N'Hà Nội', N'Đất thổ cư', 130, 1000000000),
					   (006, 002, 002,'BDS006', N'Số 2C, Ngõ 03 Tu Hoàng', N'Bắc Từ Liêm', N'Hà Nội', N'Đất thổ cư', 103, 93000000),
					   (007, 002, 002,'BDS007', N'Số 4A1, Ngõ 10 Tu Hoàng', N'Bắc Từ Liêm', N'Hà Nội', N'Đất thổ cư', 320, 10000000),
					   (008, 002, 002,'BDS008', N'Số 4D, Ngõ 29/5 Tu Hoàng', N'Bắc Từ Liêm', N'Hà Nội', N'Đất thổ cư', 130, 93000000),
					   (009, 002, 002,'BDS009', N'Số 43, Ngõ 23 Tu Hoàng', N'Bắc Từ Liêm', N'Hà Nội', N'Đất thổ cư', 120, 93000000),
					   (010, 002, 002,'BDS010', N'Số 20, Ngõ 23/5 Tu Hoàng', N'Bắc Từ Liêm', N'Hà Nội', N'Đất thổ cư', 100, 53000000),
					   (011, 003, 003,'BDS011', N'Số 32, Ngõ 39 Mai Hắc Đế', N'Hai Bà Chưng', N'Hà Nội', N'Đất thổ cư', 200, 113000000),
					   (012, 003, 003,'BDS012', N'Số 4, Ngõ 15 Mai Hắc Đế', N'Hai Bà Chưng', N'Hà Nội', N'Đất thổ cư', 90, 9000000),
					   (013, 003, 003,'BDS013', N'Số 4A, Ngõ 160 Mai Hắc Đế', N'Hai Bà Chưng', N'Hà Nội', N'Đất thổ cư', 300, 193000000),
					   (014, 003, 003,'BDS014', N'Số 43, Ngõ 30 Mai Hắc Đế', N'Hai Bà Chưng', N'Hà Nội', N'Đất thổ cư', 50, 93000000),
					   (015, 003, 003,'BDS015', N'Số 9, Ngõ 35 Mai Hắc Đế', N'Hai Bà Chưng', N'Hà Nội', N'Đất thổ cư', 620, 9300000000),
					   (016, 004, 003,'BDS016', N'Số 35, Ngõ 01 Mai Hắc Đế', N'Hai Bà Chưng', N'Hà Nội', N'Đất thổ cư', 213, 93000000),
					   (017, 004, 003,'BDS017', N'Số 53, Ngõ 10 Mai Hắc Đế', N'Hai Bà Chưng', N'Hà Nội', N'Đất thổ cư', 320, 93000000),
					   (018, 004, 003,'BDS018', N'Số 71, Ngõ 89 Mai Hắc Đế', N'Hai Bà Chưng', N'Hà Nội', N'Đất thổ cư', 532, 26000000),
					   (019, 004, 003,'BDS019', N'Số 3, Ngõ 60 Mai Hắc Đế', N'Hai Bà Chưng', N'Hà Nội', N'Đất thổ cư', 520, 5300000000),
					   (020, 004, 003,'BDS020', N'Số 6, Ngõ 4 Mai Hắc Đế', N'Hai Bà Chưng', N'Hà Nội', N'Đất thổ cư', 600, 1000000000),
					   (021, 005, 003,'BDS021', N'Số 54, Ngõ 46/6 Lâm Hạ', N'Long Biên', N'Hà Nội', N'Đất thổ cư', 130, 93000000),
					   (022, 005, 003,'BDS022', N'Số 23, Ngõ 05 Lâm Hạ', N'Long Biên', N'Hà Nội', N'Đất thổ cư', 110, 93000000),
					   (023, 005, 003,'BDS023', N'Số 12, Ngõ 06/05 Lâm Hạ', N'Long Biên', N'Hà Nội', N'Đất thổ cư', 106, 93000000),
					   (024, 002, 003,'BDS024', N'Số 03, Ngõ 06/21 Lâm Hạ', N'Long Biên', N'Hà Nội', N'Đất thổ cư', 103, 93000000),
					   (025, 005, 003,'BDS025', N'Số 51, Ngõ 03 Lâm Hạ', N'Long Biên', N'Hà Nội', N'Đất thổ cư', 130, 93000000),
					   (026, 005, 003,'BDS026', N'Số 06, Ngõ 53 Lâm Hạ', N'Long Biên', N'Hà Nội', N'Đất thổ cư', 160, 93000000),
					   (027, 003, 003,'BDS027', N'Số 03, Ngõ 13 Lâm Hạ', N'Long Biên', N'Hà Nội', N'Đất thổ cư', 110, 93000000),
					   (028, 005, 003,'BDS028', N'Số 07, Ngõ 42 Lâm Hạ', N'Long Biên', N'Hà Nội', N'Đất thổ cư', 156, 93000000),
					   (029, 005, 003,'BDS029', N'Số 09, Ngõ 82 Lâm Hạ', N'Long Biên', N'Hà Nội', N'Đất thổ cư', 261, 93000000),
					   (030, 005, 003,'BDS030', N'Số 2A/5, Ngõ 13/5 Lâm Hạ', N'Long Biên', N'Hà Nội', N'Đất thổ cư', 620, 6000000000)
	select * from nhanVien
