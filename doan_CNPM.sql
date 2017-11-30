-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 30, 2017 at 10:52 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doan_CNPM`
--

-- --------------------------------------------------------

--
-- Table structure for table `hocvien`
--

CREATE TABLE `hocvien` (
  `mahv` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tenhv` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ngaysinh` date NOT NULL,
  `gioitinh` int(1) NOT NULL DEFAULT '1',
  `quequan` text COLLATE utf8_unicode_ci NOT NULL,
  `maphong` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `magv` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `mabs` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ngayvao` date NOT NULL,
  `ngayra` date DEFAULT NULL,
  `mucdo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lichsu` text COLLATE utf8_unicode_ci NOT NULL,
  `phuongthucdieutri` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hocvien`
--

INSERT INTO `hocvien` (`mahv`, `tenhv`, `ngaysinh`, `gioitinh`, `quequan`, `maphong`, `magv`, `mabs`, `ngayvao`, `ngayra`, `mucdo`, `lichsu`, `phuongthucdieutri`) VALUES
('HV01', 'Trần Văn A', '1993-04-12', 1, 'Đà Nẵng', 'MP01', 'GV01', 'BS01', '2016-04-02', NULL, 'Nặng', 'Chưa từng cai nghiện lần nào', '<p><em><strong>Liệu ph&aacute;p t&acirc;m l&yacute;:</strong></em>&nbsp;C&oacute; thể d&ugrave;ng liệu ph&aacute;p t&acirc;m l&yacute; đơn thuần hay liệu ph&aacute;p t&acirc;m l&yacute; kết hợp với thuốc hướng thần. Ở Nga đ&oacute; l&agrave; liệu ph&aacute;p t&acirc;m l&yacute; theo học thuyết Paplov đang được &aacute;p dụng rất th&agrave;nh c&ocirc;ng tại Viện h&agrave;nh vi Nga. Tại Mỹ đ&oacute; l&agrave; phương ph&aacute;p cộng đồng trị liệu (TC). Phương ph&aacute;p n&agrave;y c&oacute; ưu điểm l&agrave; chỉ bằng lời n&oacute;i, kh&ocirc;ng tốn k&eacute;m nhưng đ&ograve;i hỏi phải c&oacute; b&aacute;c sĩ chuy&ecirc;n khoa t&acirc;m thần hoặc c&aacute;c chuy&ecirc;n gia t&acirc;m l&yacute; được đ&agrave;o tạo nắm vững kỹ năng điều trị t&acirc;m l&yacute; (thuyết phục, &aacute;m thị...) v&igrave; vậy kh&oacute; thực hiện ở c&aacute;c tuyến cơ sở.</p>\r\n\r\n<p><strong><em>Phương ph&aacute;p điện ch&acirc;m</em>:</strong>&nbsp;D&ugrave;ng điện ch&acirc;m, ng&agrave;y ch&acirc;m nhiều lần t&ugrave;y thuộc v&agrave;o trạng th&aacute;i đ&oacute;i thuốc của bệnh nh&acirc;n. Phương ph&aacute;p điện ch&acirc;m điều trị hỗ trợ cai nghiện ma t&uacute;y đ&atilde; được Bộ Y tế ban h&agrave;nh v&agrave;o năm 2003. Phương ph&aacute;p điện ch&acirc;m kh&ocirc;ng chỉ cắt cơn nghiện cho bệnh nh&acirc;n m&agrave; hiệu quả điều trị c&ograve;n k&eacute;o d&agrave;i, qua đ&aacute;nh gi&aacute; sau một số năm người nghiện vẫn kh&ocirc;ng t&aacute;i nghiện (tỷ lệ t&aacute;i nghiện v&agrave;o khoảng 10-15%). Điện ch&acirc;m c&oacute; ưu điểm cắt cơn nhanh, &iacute;t tốn k&eacute;m, dễ thực hiện tại tuyến cơ sở.</p>\r\n'),
('HV0111', 'Nguyễn Đức B', '1964-03-01', 1, 'An Giang', 'MP01', 'GV01', 'BS05', '1976-02-02', '0002-06-07', 'Nặng', '', ''),
('HV02', 'Trần Văn B', '1993-04-12', 1, 'Đà Nẵng', 'MP02', 'GV02', 'BS01', '2017-01-10', '2017-04-01', 'Nhẹ', 'Đã cai nghiện một lần', ''),
('HV03', 'Học Viên 3', '2016-01-01', 1, 'An Giang', 'MP01', 'GV03', 'BS02', '2016-01-01', '2016-02-02', 'Nhẹ', 'nnn', NULL),
('HV04', 'Bùi Thị An', '1983-02-03', 0, 'Bình Định', 'MP02', 'GV01', 'BS02', '2015-02-02', '2014-08-02', 'Trung bình', 'abc', NULL),
('HV06', 'Nguyễn Thị Nở', '1980-03-04', 0, 'Bắc Giang', 'MP02', 'GV03', 'BS03', '1999-03-02', '2001-03-06', 'Nặng', '', NULL),
('HV07', 'Nguyễn Chí Phèo', '1961-03-02', 0, 'Bà Rịa - Vũng Tầu', 'MP01', 'GV01', 'BS01', '1977-05-03', '1980-05-03', 'Nhẹ', '', NULL),
('HV10', 'Nguyễn Chí Phèo', '1977-02-02', 1, 'Bình Định', 'MP01', 'GV05', 'BS02', '1992-02-02', '1993-03-04', 'Nặng', 'Chưa cai nghiện', NULL),
('HV102', 'Bùi Đức T', '1995-02-02', 1, 'Bình Thuận', 'MP01', 'GV01', 'BS01', '2016-06-06', '2017-04-05', 'Trung bình', 'Chưa từng có tiền án cai nghiện', ''),
('HV1022', 'Bùi Đức V', '1999-02-01', 1, 'Bà Rịa - Vũng Tầu', 'MP02', 'GV02', 'BS01', '2016-02-02', '0002-01-02', 'Nhẹ', '', ''),
('HV111', 'Nguyễn Đức T', '1992-04-02', 1, 'An Giang', 'MP01', 'GV01', 'BS01', '2016-02-06', '2017-03-02', 'Nhẹ', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hocvien`
--
ALTER TABLE `hocvien`
  ADD PRIMARY KEY (`mahv`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
