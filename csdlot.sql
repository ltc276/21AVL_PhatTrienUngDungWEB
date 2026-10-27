-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2026 at 09:08 AM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `csdlot`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `id` int(11) NOT NULL,
  `id_donhang` int(11) NOT NULL,
  `id_sanpham` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `dongia` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`id`, `id_donhang`, `id_sanpham`, `soluong`, `dongia`) VALUES
(6, 5, 18, 1, 13500000.00);

-- --------------------------------------------------------

--
-- Table structure for table `congty`
--

CREATE TABLE `congty` (
  `id` int(11) NOT NULL,
  `tencty` varchar(150) NOT NULL,
  `diachi` varchar(255) DEFAULT NULL,
  `dienthoai` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `congty`
--

INSERT INTO `congty` (`id`, `tencty`, `diachi`, `dienthoai`) VALUES
(1, 'Apple', 'Phòng 901, Tòa nhà Ngôi Nhà Đức', '1800-1192'),
(2, 'Samsung', 'Lầu 25, Tòa nhà Bitexco Financial Tower', '1800-588-889'),
(3, 'Xiaomi', 'Tầng 16, Tòa nhà Riverfront Financial Centre', '1800-400-410'),
(4, 'Oppo', 'Tầng 7, Tòa nhà Crescent Plaza', '1800-577-776');

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `id` int(11) NOT NULL,
  `hoten` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `ngaydat` datetime NOT NULL,
  `trangthai` varchar(20) NOT NULL DEFAULT 'cho giao'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donhang`
--

INSERT INTO `donhang` (`id`, `hoten`, `email`, `diachi`, `ngaydat`, `trangthai`) VALUES
(5, 'Lê Tấn Cường', 'letancuong2706@gmail.com', 'Ngã 5 chuồng chó', '2026-10-27 15:05:33', 'da giao');

-- --------------------------------------------------------

--
-- Table structure for table `nguoidung`
--

CREATE TABLE `nguoidung` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `hoten` varchar(150) NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 2
) ;

--
-- Dumping data for table `nguoidung`
--

INSERT INTO `nguoidung` (`id`, `username`, `password`, `hoten`, `role`) VALUES
(1, 'admin', '$2y$12$ilj/K2dvCCmx5UC.srJYwu.Iyt7iU8j0ddRQm/y/Q/lc.GeIbhP5y', 'Quan tri vien', 1),
(3, 'ltc', '$2y$12$7.Hcp.U47F38aGJMY6tAb.2EQsCr2spr2so5SdDH91yPMr3GjGvGe', 'Lê Tấn Cường', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL,
  `tensp` varchar(150) NOT NULL,
  `mota` text DEFAULT NULL,
  `gia` decimal(12,2) NOT NULL DEFAULT 0.00,
  `soluong` int(11) NOT NULL DEFAULT 0,
  `id_congty` int(11) NOT NULL,
  `hinhanh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`id`, `tensp`, `mota`, `gia`, `soluong`, `id_congty`, `hinhanh`) VALUES
(7, 'Samsung S25', 'Samsung S25 siêu điện thoại', 15000000.00, 100, 2, 'hinh_anh/san_pham_6ae0591e4e7482.16868720.jpg'),
(8, 'Samsung S26', 'Samsung S26 , 1 loại điện thoại mới', 20000000.00, 100, 2, 'hinh_anh/san_pham_6ae059442076b2.53757616.jpg'),
(9, 'Samsung A57', 'Samsung A57', 10000000.00, 120, 2, 'hinh_anh/san_pham_6ae0596a01c232.51067101.jpg'),
(10, 'Iphone 18', 'Điện thoại táo', 30000000.00, 50, 1, 'hinh_anh/san_pham_6ae0598ebf32c0.39262716.jpg'),
(11, 'Iphone 17', 'Điện thoại nhà táo', 25000000.00, 45, 1, 'hinh_anh/san_pham_6ae059b4a2bdc3.76873109.jpg'),
(12, 'Iphone 15', 'Điện thoại nhà táo', 15000000.00, 30, 1, 'hinh_anh/san_pham_6ae059e0d4e634.86799013.jpg'),
(13, 'Xiaomi 17T', 'Điện thoại Xiaomi', 30000000.00, 60, 3, 'hinh_anh/san_pham_6ae05a0f4d6617.01821116.jpg'),
(14, 'Xiaomi redmi note 15', 'Điện thoại xiaomi', 12000000.00, 80, 3, 'hinh_anh/san_pham_6ae05a361156f1.85861039.jpg'),
(15, 'Xiaomi redmi 17', 'Điện thoại xiaomi', 8000000.00, 200, 3, 'hinh_anh/san_pham_6ae05a53cb0e94.20040953.jpg'),
(16, 'Oppo reno 14', 'Điện thoại oppo', 12000000.00, 50, 4, 'hinh_anh/san_pham_6ae05a94bb3c00.21075045.jpg'),
(17, 'Oppo reno 16', 'Điện thoại oppo', 20000000.00, 100, 4, 'hinh_anh/san_pham_6ae05aaf8e5621.21924286.jpg'),
(18, 'Oppo find x9', 'Điện thoại oppo', 13500000.00, 150, 4, 'hinh_anh/san_pham_6ae05adde29791.08856932.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_donhang` (`id_donhang`),
  ADD KEY `id_sanpham` (`id_sanpham`);

--
-- Indexes for table `congty`
--
ALTER TABLE `congty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_congty` (`id_congty`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `congty`
--
ALTER TABLE `congty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `chitietdonhang_ibfk_1` FOREIGN KEY (`id_donhang`) REFERENCES `donhang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chitietdonhang_ibfk_2` FOREIGN KEY (`id_sanpham`) REFERENCES `sanpham` (`id`);

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`id_congty`) REFERENCES `congty` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
