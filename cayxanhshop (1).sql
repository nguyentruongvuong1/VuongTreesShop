-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 09, 2024 lúc 11:22 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `cayxanhshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binh_luan`
--

CREATE TABLE `binh_luan` (
  `id` int(10) NOT NULL,
  `id_user` int(10) NOT NULL DEFAULT 0,
  `id_sp` int(10) NOT NULL,
  `ten_user` varchar(50) NOT NULL,
  `noi_dung` varchar(250) NOT NULL,
  `ngay` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `binh_luan`
--

INSERT INTO `binh_luan` (`id`, `id_user`, `id_sp`, `ten_user`, `noi_dung`, `ngay`) VALUES
(1, 0, 1, 'Nguyễn Trường VƯơng', 'Cây xanh thật tươi tốt và khỏe mạnh, mang lại không gian xanh mát cho ngôi nhà!', '2024-07-10 21:25:43'),
(2, 0, 2, 'Đỗ Đạt Cao', 'Lá cây xanh mướt và đẹp mắt, làm cho căn phòng trở nên sống động hơn.', '2024-07-17 08:12:54'),
(3, 0, 3, 'AN', 'Cây này thật sự rất dễ chăm sóc và phát triển rất nhanh. Tôi rất hài lòng!', '2024-07-17 08:13:34'),
(6, 0, 4, 'Toàn', 'Chất lượng cây rất tốt, tôi đã mua nhiều lần và lần nào cũng ưng ý.', '2024-07-17 08:36:43'),
(7, 0, 5, 'Xuyến', 'Cây có hình dáng độc đáo và lạ mắt, ai nhìn thấy cũng phải khen ngợi.', '2024-07-17 14:12:35'),
(8, 0, 6, 'ẨN danh', 'Dịch vụ giao hàng nhanh chóng và cây được đóng gói cẩn thận, không hề bị hư hại.', '2024-07-17 14:22:54'),
(9, 0, 7, 'Bình', 'Cây xanh này không chỉ làm đẹp không gian mà còn giúp thanh lọc không khí rất tốt.', '2024-07-17 14:22:56'),
(10, 0, 8, 'TUyến', 'Tôi rất thích cách bày trí và chọn lựa cây ở cửa hàng của bạn, rất đa dạng và phong phú.', '2024-07-17 14:22:58'),
(11, 0, 2, 'Tùng', 'Cây có giá trị thẩm mỹ cao và tạo cảm giác thoải mái, thư giãn mỗi khi nhìn ngắm.', '2024-07-17 14:24:10'),
(12, 0, 1, 'Long', 'Chất lượng sản phẩm tuyệt vời, cây xanh tươi tắn và tràn đầy sức sống.', '2024-07-17 14:24:13'),
(13, 0, 1, 'Khải', 'Tôi rất thích cách bày trí và chọn lựa cây ở cửa hàng của bạn, rất đa dạng và phong phú.', '2024-07-17 14:24:14'),
(14, 0, 2, 'Khóc', 'Chất lượng sản phẩm tuyệt vời, cây xanh tươi tắn và tràn đầy sức sống.', '2024-07-17 14:24:16'),
(38, 11, 19, 'testasdsadsa', 'cxzcxz', '2024-08-08 09:25:51'),
(39, 11, 19, 'ẩn danh', 'asdsadsa', '2024-08-08 09:25:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cate`
--

CREATE TABLE `cate` (
  `id` int(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `img` varchar(250) NOT NULL,
  `an_hien` int(11) NOT NULL DEFAULT 0 COMMENT '0 là hiện 1 là ẩn',
  `ngay` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cate`
--

INSERT INTO `cate` (`id`, `name`, `img`, `an_hien`, `ngay`) VALUES
(1, 'Cây dễ chăm', './public/Images/dmsp1.jpg', 0, NULL),
(2, 'Cây văn phòng', './public/Images/dmsp2.jpg', 0, NULL),
(3, 'cây phong thủy', './public/Images/dmsp3.jpg', 0, NULL),
(4, 'Cây để bàn', './public/Images/dmsp4.jpg', 0, NULL),
(5, 'Cây trồng nước', './public/Images/dmsp5.jpg', 0, NULL),
(6, 'Cây cao cấp', './public/Images/dmsp9.jpg', 0, NULL),
(7, 'Chậu đất nung', './public/Images/dmsp7.jpg', 0, NULL),
(8, 'Chậu xi măng', './public/Images/dmsp8.jpg', 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hang`
--

CREATE TABLE `don_hang` (
  `id_dh` int(10) NOT NULL,
  `thoi_diem_mua` datetime NOT NULL,
  `ho_ten` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `sdt` int(12) NOT NULL,
  `dia_chi` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `don_hang`
--

INSERT INTO `don_hang` (`id_dh`, `thoi_diem_mua`, `ho_ten`, `email`, `sdt`, `dia_chi`) VALUES
(26, '2024-07-18 03:40:30', 'xzcxz', 'czxcxz@gmail.com', 12323, 'aewqewq'),
(27, '2024-07-18 09:59:41', 'Trường', 'czxcz@gmail.com', 30321321, 'ádsadsadsa'),
(28, '2024-07-18 09:59:43', 'Trường', 'czxcz@gmail.com', 30321321, 'ádsadsadsa'),
(29, '2024-07-18 10:01:59', 'Toon', 'toon@gmail.com', 2131232, 'asdsadsad'),
(30, '2024-07-20 03:49:57', 'sad', 'dsa@gmail.com', 321312, 'sdadsadsa'),
(31, '2024-08-06 10:59:36', 'dsadsa', 'sdsa@gmail.com', 23213213, 'sadsa'),
(32, '2024-08-06 14:23:59', 'vuong', 'vuong@gmail.com', 1234566, '12321dsadsa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hang_chi_tiet`
--

CREATE TABLE `don_hang_chi_tiet` (
  `id_ct` int(10) NOT NULL,
  `id_dh` int(10) NOT NULL,
  `id_sp` int(10) NOT NULL,
  `so_luong` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `don_hang_chi_tiet`
--

INSERT INTO `don_hang_chi_tiet` (`id_ct`, `id_dh`, `id_sp`, `so_luong`) VALUES
(26, 26, 15, 4),
(27, 27, 16, 1),
(28, 28, 16, 1),
(29, 29, 16, 1),
(30, 30, 23, 1),
(31, 31, 103, 1),
(32, 31, 65, 1),
(33, 32, 23, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` int(20) NOT NULL,
  `img` varchar(250) NOT NULL,
  `quantity` int(10) NOT NULL,
  `cate_id` int(10) NOT NULL,
  `xem` int(50) NOT NULL DEFAULT 0,
  `description` varchar(300) NOT NULL,
  `ngay` date DEFAULT NULL,
  `an_hien` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 là hiện, 1 là ẩn',
  `like` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `img`, `quantity`, `cate_id`, `xem`, `description`, `ngay`, `an_hien`, `like`) VALUES
(1, 'Cây lộc vừng ', 1200000, 'https://meohaychoban.com/wp-content/uploads/2021/02/cay-canh-loc-vung.jpg', 12, 1, 127, 'Cây lộc vừng rất thích hợp trồng trong khuôn viên của gia đình, với tán lá rộng đem lại không khí trong lành và mát mẻ. Với cây lộc vừng mang ý nghĩa đem lại nhiều may mắn và tài lộc đúng với chữ “lộc” trong tên cây.', '2024-04-07', 1, 0),
(2, 'Cây thông', 200000, 'https://meohaychoban.com/wp-content/uploads/2021/02/cay-canh-loc-vung.jpg\r\n', 12, 2, 13, 'Cây thông được bến đến như một hình tượng đại diện cho mua lễ hội noel với ý nghĩa mong muốn cho mọi gia đình có cuộc sống đầm ấm và hạnh phúc bên nhau. Hơn thế nữa cây thông đại diện cho sức sống kiên cường nghị lực đúng với nguồn cội của cây thông ', '2024-05-09', 0, 0),
(3, 'Cây chuối cảnh', 300000, 'https://meohaychoban.com/wp-content/uploads/2021/02/cay-chuoi-canh.jpg', 13, 3, 123, 'Cây chuối là một cây đại diện cho vùng quê đem lại cảm giác thân thương và gần gũi. Với cây chuối cảnh thân hình nhỏ và tán là bé rất thích hợp trồng ngoài vườn đặc biệt là phia sau nhà với ý nghĩa của câu :”Trước cau sau chuối” ý nghĩa giúp cho phon', '2024-04-10', 0, 0),
(4, 'Cây bàng singapore', 300000, 'https://meohaychoban.com/wp-content/uploads/2021/02/cay-bang-singapore.jpg', 14, 4, 132, 'Với màu bản lá to rộng và màu lá xanh tươi tốt quanh năm và không cần chăm sóc nhiều cây vẫn phát triển tốt nên được lựa chọn làm cây cảnh sân vườn được nhiều người chọn mua. Với ý nghĩa dựa theo đặc điểm của cây đó là tán lá rộng mang lại sự giàu sang sung tung cho gia chủ đặc biệt những người mệnh', '2024-05-01', 0, 0),
(5, 'Cây hoa giấy', 300000, 'https://meohaychoban.com/wp-content/uploads/2021/02/cay-hoa-giay.jpg', 32, 5, 132, 'Cây hoa giấy với nhiều tác dụng có thể làm bóng mát bởi hoa giấy thuộc dạng dây leo và cũng thể làm bonsai. Với cánh hoa mỏng như giấy nên được gọi là hoa giấy. Với ý nghĩa đặc trưng bởi màu tím mang sự thủy chung. Thường được trồng nhiều ở ngoài cổng làm bóng mát và khi vào mua hoa nở mang một vẻ n', '2024-05-01', 0, 0),
(6, 'Cây nguyệt quế', 300000, 'https://meohaychoban.com/wp-content/uploads/2021/02/cay-nguyet-que.jpg', 31, 6, 213, 'Cây cảnh nguyệt quế là một loại cây bonsai được nhiều người lựa chọn trong sân vườn nhà mình. Với đặc điểm mang vẻ đẹp mộc mạc chân chất hơn thể nữa mùi hương của hoa mang lại sự quyến rũ. Sở hữu một cây nguyệt quế trước nhà hoặc trong sân vườn giúp gia chủ sự chiến thắng đem lại nhiều tài lộc cho g', '2024-05-01', 0, 0),
(7, 'Cây si', 200000, 'https://meohaychoban.com/wp-content/uploads/2021/02/cay-si.jpg', 32, 1, 132, 'Cây si là một trong những loại cây trong bộ tứ linh “Đa - sung- sanh -si”. Cây si đem lại cho gia đình sự may mắn, cát tường và sinh khí tốt cho ngôi nhà. Nhưng điểm lưu ý về vị trí đặt cây si trong gia đình, bạn không nên đặt trước của nhà. Bởi si có tán là rộng sẽ che chắn ánh sáng cũng như những ', '2024-05-01', 0, 0),
(8, 'Cây ngô đồng', 200000, 'https://meohaychoban.com/wp-content/uploads/2021/02/cay-ngo-dong.jpg', 32, 2, 32, 'Sở hữu một chậu cây ngồ đồng trong sân vườn của gia đình sẽ mang lại ý nghĩa cát tường và sự may mắn bởi nhắc đến ngô đồng người xử sẽ nghĩ ngay đến hình ảnh phượng hoàng đậu trên cây ngô đồng. Mà phượng hoàng lại thuộc trong tứ thần thú “Lân – Phượng – Quy – Long”. Bởi vậy về mặt ý nghĩa phong thủy', '2024-05-01', 1, 0),
(10, 'Cây tùng la hán', 1200000, 'https://meohaychoban.com/wp-content/uploads/2021/02/cay-tung-la-han.jpg', 13, 4, 123, 'Theo mỗi ý nghĩa của các loại cây đem lại thì thường sẽ dựa theo đặc điểm và khả năng thích nghi với môi trường của từng loại cây. Đối với tùng la hán có sức sống bền bị dưới tác động của mọi tác động của khí hậu thời tiết thì tùng là hán vẫn xanh tốt. Ý nghĩa của loại cây cảnh này nếu được trồng tr', '2024-04-10', 0, 0),
(11, 'Cây trầu bà', 300000, 'https://meohaychoban.com/wp-content/uploads/2021/02/cay-trau-ba.jpg', 32, 5, 322, 'Cây trầu bà là loại cây thích hợp trồng trong nhà để ở các kệ lan can bởi cây cảnh trầu bà rất dễ sống mà chỉ cần ít sự chăm sóc. Công dụng giúp thanh lọc không khí giúp không gian sống của bạn trở nên trong lành hơn. Với ý nghĩa mang đến sự phát triển trong công việc thịnh vượng và may mắn tới gia ', '2024-04-10', 0, 0),
(12, 'Cây phát lộc', 300000, 'https://meohaychoban.com/wp-content/uploads/2021/02/cay-phat-loc.jpg', 23, 5, 100, 'Cây phát lộc hay với cách gọi khác là cây phất lộc, cây phát tài phát lộc. Là loại cây có sức sống mãnh liệt thân cứng cáp, phát triển tốt nhất ở vùng có nhiều ánh sáng bởi vậy nếu gia chủ để cây cảnh phát lộc nơi thiếu ánh sáng sẽ làm bản lá dễ bị ố vàng. Trồng cây phát lộc trong nhà sẽ đem lại cho', '2024-05-13', 0, 0),
(13, 'Cây ngũ da bì', 200000, 'https://meohaychoban.com/wp-content/uploads/2021/02/cay-ngu-gia-bi.jpg', 13, 6, 100, 'Cây ngủ da bì có mặt lá kép chân vịt mọc so le hình bầu dục với mặt lá nhẵn với mặt trên sẫm bóng mang đến sự tưới mát cho không gian. Ngũ da bì được nhiều người lựa chọn để đặt trong không gian phòng làm việc hoặc cửa hàng không chỉ mang sự tươi mát. Mà theo ý nghĩa phong thủy mang lại sự may mắn v', '2024-05-19', 0, 0),
(14, 'Cây thủy tùng', 1200000, 'https://meohaychoban.com/wp-content/uploads/2021/02/cay-thuy-tung.jpg', 12, 1, 35, 'Cây thủy tùng có dáng nhỏ mảnh khảnh chiều cao 30 cm. Lá cây có hình dạng tam giác mỏng giày mang màu xanh sẫm tươi mát giúp thanh lọc không khí. Đối với ý nghĩa phong thủy thì cây thủy tùng có sức sốc dẻo dai mãnh liệt thể hiện ý chí kiên cường của một bậc chính nhân quân tử. Lựa chọn cây cảnh là c', '2024-05-09', 0, 0),
(15, 'Cây hoàng hậu', 300000, 'https://meohaychoban.com/wp-content/uploads/2021/02/cay-thuy-tung.jpg', 41, 2, 126, 'Cây hoàng hậu có dáng nhỏ mảnh khảnh chiều cao 30 cm. Lá cây có hình dạng tam giác mỏng giày mang màu xanh sẫm tươi mát giúp thanh lọc không khí. Đối với ý nghĩa phong thủy thì cây thủy tùng có sức sốc dẻo dai mãnh liệt thể hiện ý chí kiên cường của một bậc chính nhân quân tử. Lựa chọn cây cảnh là c', '2024-05-09', 0, 0),
(16, 'Cây dương xỉ', 200000, 'https://meohaychoban.com/wp-content/uploads/2021/02/cay-duong-xi.jpg', 42, 3, 23, '      Với tình trạng không khí trong môi trường ngày càng ô nhiêm thì một cây cảnh xanh trong không gian ngôi nhà bạn là hoàn toàn cần thiết. Cây dương sỉ cũng là một sự lựa chọn phù hợp giúp không khí được thanh lọc.\r\n', '2024-05-19', 0, 0),
(17, 'Cây đuôi công', 200000, 'https://meohaychoban.com/wp-content/uploads/2021/02/cay-duoi-cong.jpg', 31, 5, 21, 'Nhắc đến cây đuôi công mang đến sự ấn tượng về một giống cây có vẻ đẹp từ những chiếc lông công rực rỡ lộng lẫy. Với tác dụng khi đặt chậu cây đuôi công trong nhà sẽ giúp điều hòa khí hậu và ngăn ngừa dị ứng hiệu quả tốt cho sức khỏe của các thành viên trong gia đình\r\n', '2024-04-10', 0, 0),
(18, 'Cây hạnh phúc', 100000, 'https://meohaychoban.com/wp-content/uploads/2021/02/cay-hanh-phuc.jpg', 32, 6, 22, 'Cây hạnh phúc có đặc điểm nhận dạng là loài thân gỗ có chiều cao trung bình là 1.5m các mẫu cây cảnh sẽ có chiều cao thấp hơn. Lá có hình dạng trái tim vô cùng đẹp có màu xanh đậm. Môi trường sống cây hạnh phúc cần phải đặt ở nơi có nhiều ánh sáng để tốt cho quá trình quang hợp giúp là luôn xanh mát', '2024-04-10', 0, 0),
(19, 'Cây hương thảo', 1200000, 'https://meohaychoban.com/wp-content/uploads/2021/02/cay-huong-thao.jpg', 32, 1, 124, 'Với tình trạng không khí trong môi trường ngày càng ô nhiêm thì một cây cảnh xanh trong không gian ngôi nhà bạn là hoàn toàn cần thiết. Cây dương sỉ cũng là một sự lựa chọn phù hợp giúp không khí được thanh lọc.\r\n', '2024-05-01', 0, 0),
(20, 'Cây phát tài bộ 5 ', 1200000, 'https://mowgarden.com/wp-content/uploads/2023/07/cay-phat-tai-bo-mowgarden-800x800.jpg', 12, 1, 335, 'Cây phát tài bộ còn được biết đến với tên gọi khác là cây thiết mộc lan. Loài cây nội thất được đánh giá là đem lại nhiều sinh khí, may mắn và thịnh vượng cho gia chủ, nhất là khi cây nở hoa là dấu hiệu tiền tài đang đến với bạn. Hơn nữa, nếu bạn đặt cây theo hướng Đông hay Đông Nam của ngôi nhà thì', '2024-07-16', 0, 1),
(21, 'Cây kim ngân ba thân', 1200000, 'https://mowgarden.com/wp-content/uploads/2023/07/cay-kim-ngan-3-than-mowgarden.jpg', 14, 1, 132, 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', '2024-07-10', 0, 0),
(22, 'Cây trầu bà đế vương', 120000, 'https://mowgarden.com/wp-content/uploads/2023/07/cay-trau-ba-de-vuong-xanh-mowgarden.jpg', 100, 1, 322, 'Trầu Bà Đế Vương Xanh (Philodendron Imperial Green) là một giống cây rất ưu chuộng để trồng với ý nghĩa phong thủy mà nó mang lại. Nên đặt cây tại các vị trí như trong phòng khách, phòng làm việc, văn phòng hoặc sảnh ra vào cơ quan.', '2024-07-09', 0, 0),
(23, 'Cây cỏ lan chi ', 120000, 'https://mowgarden.com/wp-content/uploads/2023/07/co-lan-chi-de-ban-mowgaden.jpg', 123, 1, 1243, 'Cỏ Lan Chi (hay còn gọi là Cỏ Nhện) là loại cây rất dễ sống với điều kiện khí hậu nóng tại Việt Nam. Đặc biệt, nó nằm trong top các loại cây lọc không khí rất hiệu quả, có thể đặt trong phòng ngủ giúp bạn có giấc ngủ trong lành hơn.', '2024-07-16', 0, 0),
(24, 'Cây trầu bà đế vương đỏ', 320000, 'https://mowgarden.com/wp-content/uploads/2023/07/trau-ba-de-vuong-do-de-ban-mowgarden-800x800.jpg', 32, 1, 100, 'Thân dạng thảo lớn, trong tự nhiên cây có thể leo được, nhưng đa số khi trồng chậu thì thân vươn thẳng chắc chắn, cao khoảng dưới 1m5.', '2024-07-09', 0, 0),
(25, 'Cây lưỡi hổ Bantel Sensation', 160000, 'https://mowgarden.com/wp-content/uploads/2023/04/cay-luoi-ho-bengar-1-800x800.jpg', 123, 1, 123, 'Lưỡi hổ Thái xanh mini là dòng lưỡi hổ nhỏ để bàn, có chiều cao tối đa khoảng 20cm, không có nhiều vằn như những loại lưỡi hổ khác, nhưng nó lại sở hữu bộ lá màu xanh đậm ấn tượng, mang lại nét ‘cứng cáp’ tự nhiên cho không gian. Chúng rất thích hợp để trên bàn làm việc, kệ trang trí hoặc làm quà tặ', '2024-07-16', 0, 0),
(26, 'Cây hạnh phúc', 1200000, 'https://mowgarden.com/wp-content/uploads/2023/04/cay-hanh-phuc-2-tang-chau-da-mai-tron-1.jpg', 14, 1, 132, 'Cây hạnh phúc là dòng cây cảnh đẹp, sức sống khỏe mạnh, dễ chăm sóc. Trên cây có những tán lá xanh tươi, mượt mà thể hiện cho sự hi vọng và niềm tin mạnh mẽ. Với ý nghĩa mang lại may mắn và hạnh phúc nên cây thường được chọn để làm cây trưng trong nhà hoặc làm quà tặng.', '2024-07-02', 0, 0),
(27, 'Cây trầu bà cột chậu xi măng', 1100000, 'https://mowgarden.com/wp-content/uploads/2023/04/cay-trau-ba-cot-chau-xi-mang-van-soc-ngang-1-800x800.jpg', 200, 1, 123, 'Có tác dụng thanh lọc không khí trong nhà mà còn chứa đựng ý nghĩa phong thủy rất tốt, mang dáng vẻ thanh lịch và sang trọng.', '2024-07-04', 0, 0),
(28, 'Cây hồng môn', 240000, 'https://mowgarden.com/wp-content/uploads/2023/04/cay-hong-mon-de-ban-chau-su-1-800x800.jpg', 32, 1, 322, 'Cây hồng môn được biết tới là một loại cây cảnh mang lại điều tốt lành, có thể giúp điều hòa khí phong thủy trong nhà, có khả năng thu hút những dòng khí tích cực và làm tiêu bớt dòng khí tiêu cực cho môi trường xung quanh, trồng cây hồng môn trong nhà sẽ giúp không gian sống trở nên hài hòa và bình', '2024-07-15', 0, 0),
(29, 'Cây ngũ gia bì cẩm thạch', 100000, 'https://mowgarden.com/wp-content/uploads/2023/04/cay-ngu-gia-bi-cam-thach-800x800.jpg', 200, 1, 1240, 'Ngũ gia bì là loại cây mang lại tài vận, thịnh vượng và may mắn, trồng trong nhà sẽ mang đến một không gian thư thái, trong lành cho gia đình.', '2024-07-15', 0, 0),
(30, 'Cây kim ngân', 450000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-kim-ngan-mot-than-chau-su-1-800x800.jpg', 32, 1, 500, 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', '2024-07-07', 0, 0),
(31, 'Cây cọ lá xẻ mini', 160000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-co-la-xe-de-ban-chau-su-trang-1a.jpg', 200, 1, 400, 'Cây cọ nhật là loại cây trong nhà có kiểu lá xòe rộng như những cánh quạt, giúp trang trí không gian thêm xanh mát. Nó còn là loại cây phong thủy tượng trưng cho sự giàu sang và tiền tài nên rất đáng trồng trên bàn làm việc.', '2024-07-10', 0, 0),
(32, 'Cây tùng bồng lai', 500000, 'https://mowgarden.com/wp-content/uploads/2024/03/tung-bong-lai-chu-su-de-ban-mowgarden-800x800.jpg', 13, 2, 324, 'Cây Tùng Bông Lai là một loài cây mang vẻ đẹp trang nhã, với tán lá dầy xanh mướt trông giống như những đám mây và có kích thước nhỏ gọn nên rất thích hợp để bàn làm việc. Chúng là loài cây dễ trồng nên không cần phải tốn công chăm sóc, tuy nhiên cần đặt tại nơi có nhiều ánh sáng.', '2024-07-02', 0, 0),
(33, 'Cây phát tài bộ 5', 750000, 'https://mowgarden.com/wp-content/uploads/2023/07/cay-phat-tai-bo-mowgarden-800x800.jpg', 123, 2, 400, 'Cây phát tài bộ còn được biết đến với tên gọi khác là cây thiết mộc lan. Loài cây nội thất được đánh giá là đem lại nhiều sinh khí, may mắn và thịnh vượng cho gia chủ, nhất là khi cây nở hoa là dấu hiệu tiền tài đang đến với bạn. Hơn nữa, nếu bạn đặt cây theo hướng Đông hay Đông Nam của ngôi nhà thì', '2024-07-09', 0, 0),
(34, 'Cây kim ngân ba thân', 280000, 'https://mowgarden.com/wp-content/uploads/2023/07/cay-kim-ngan-3-than-mowgarden.jpg', 32, 2, 100, 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', '2024-07-08', 0, 0),
(35, 'Cây hạnh phúc', 1200000, 'https://mowgarden.com/wp-content/uploads/2023/04/cay-hanh-phuc-2-tang-chau-da-mai-tron-1-800x800.jpg', 200, 2, 501, 'Cây hạnh phúc là dòng cây cảnh đẹp, sức sống khỏe mạnh, dễ chăm sóc. Trên cây có những tán lá xanh tươi, mượt mà thể hiện cho sự hi vọng và niềm tin mạnh mẽ. Với ý nghĩa mang lại may mắn và hạnh phúc nên cây thường được chọn để làm cây trưng trong nhà hoặc làm quà tặng.', '2024-07-04', 0, 0),
(36, 'Cây hồng môn cỡ nhỏ', 240000, 'https://mowgarden.com/wp-content/uploads/2023/04/cay-hong-mon-de-ban-chau-su-1-800x800.jpg', 32, 2, 300, 'Cây hồng môn được biết tới là một loại cây cảnh mang lại điều tốt lành, có thể giúp điều hòa khí phong thủy trong nhà, có khả năng thu hút những dòng khí tích cực và làm tiêu bớt dòng khí tiêu cực cho môi trường xung quanh, trồng cây hồng môn trong nhà sẽ giúp không gian sống trở nên hài hòa và bình', '2024-07-01', 0, 0),
(37, 'Cây ngũ gia bì cẩm thạch', 100000, 'https://mowgarden.com/wp-content/uploads/2023/04/cay-ngu-gia-bi-cam-thach-800x800.jpg', 200, 2, 400, 'Ngũ gia bì là loại cây mang lại tài vận, thịnh vượng và may mắn, trồng trong nhà sẽ mang đến một không gian thư thái, trong lành cho gia đình.', '2024-07-09', 0, 0),
(38, 'Cây hạnh phúc để sàn', 550000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-hanh-phuc-de-san-chau-su-trang-800x800.jpg', 14, 2, 101, 'Cây hạnh phúc là dòng cây cảnh đẹp, sức sống khỏe mạnh, dễ chăm sóc. Trên cây có những tán lá xanh tươi, mượt mà thể hiện cho sự hi vọng và niềm tin mạnh mẽ. Với ý nghĩa mang lại may mắn và hạnh phúc nên cây thường được chọn để làm cây trưng trong nhà hoặc làm quà tặng.', '2024-07-16', 0, 0),
(39, 'Cây tùng bồng lai', 2200000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-tung-bong-lai-bonsai-tieu-canh-800x800.jpg', 200, 2, 400, 'Cây Tùng Bông Lai là một loài cây mang vẻ đẹp trang nhã, với tán lá dầy xanh mướt trông giống như những đám mây và có kích thước nhỏ gọn nên rất thích hợp để bàn làm việc. Chúng là loài cây dễ trồng nên không cần phải tốn công chăm sóc, tuy nhiên cần đặt tại nơi có nhiều ánh sáng.', '2024-07-10', 0, 0),
(40, 'Cây bàng Singapore', 180000, 'https://mowgarden.com/wp-content/uploads/2023/03/7-cay-bang-singapore-nho-de-ban-chau-su-1-800x800.jpg', 100, 2, 140, 'Cây Bàng Singapore Lớn có thể dễ dàng nhận ra ở những góc quán cafe, bàn làm việc công. Với những chiếc lá căng bóng hình đàn vĩ cầm rất lớn, nhiều gân là hình chân chim nổi bật.', '2024-07-23', 0, 0),
(41, 'Cây kim ngân nơ', 300000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-kim-ngan-no-de-ban-chau-su-trang-1-800x800.jpg', 200, 2, 1240, 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', '2024-07-01', 0, 0),
(42, 'Cây thường xuân cẩm thạch', 160000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-thuong-xuan-cam-thach-chau-uom-800x800.jpg', 100, 2, 132, 'Thường xuân là loài cây dây leo, chúng có thể sống trong nhà rất tốt và sinh trưởng khỏe mạnh vào mùa mát mẻ. Những cành dài buông rủ của chúng là gợi ý tuyệt vời trên bục cửa sổ, trên kệ sách hoặc treo lên cao. Chúng có sức sống khá bền bỉ nên điều kiện chăm sóc cũng không quá phức tạp.', '2024-07-09', 0, 0),
(43, 'Cây kim ngân thắt bính', 420000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-kim-ngan-binh-chau-dat-nung-1-800x800.jpg', 200, 2, 400, 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', '2024-07-02', 0, 0),
(44, 'Cây trúc mặt trời', 2000, '', 0, 0, 0, '', NULL, 0, 0),
(45, 'Cây trúc mặt trời', 200000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-phat-tai-bup-de-ban-chau-su-1-800x800.jpg', 50, 2, 123, 'Cây phát tài Nhật tượng trưng cho sức sống bền bỉ, mạnh mẽ. Cây có thể thích nghi với mọi điều kiện thời tiết, tán lá vẫn xanh vẫn vươn thêm nhiều tầng mới. Vì thế mà cây mang lại nguồn sinh khí dồi dào, một tinh thần tích cực, cùng niềm vui và sự may mắn cho mọi người.', '2024-07-09', 0, 0),
(46, 'Cây hạnh phúc để sàn', 560000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-hanh-phuc-de-san-chau-su-1-800x800.jpg', 200, 2, 400, 'Cây hạnh phúc là dòng cây cảnh đẹp, sức sống khỏe mạnh, dễ chăm sóc. Trên cây có những tán lá xanh tươi, mượt mà thể hiện cho sự hi vọng và niềm tin mạnh mẽ. Với ý nghĩa mang lại may mắn và hạnh phúc nên cây thường được chọn để làm cây trưng trong nhà hoặc làm quà tặng.', '2024-07-01', 0, 0),
(47, 'Cây tùng bồng lai', 500000, 'https://mowgarden.com/wp-content/uploads/2024/03/tung-bong-lai-chu-su-de-ban-mowgarden-800x800.jpg', 100, 3, 100, 'Cây Tùng Bông Lai là một loài cây mang vẻ đẹp trang nhã, với tán lá dầy xanh mướt trông giống như những đám mây và có kích thước nhỏ gọn nên rất thích hợp để bàn làm việc. Chúng là loài cây dễ trồng nên không cần phải tốn công chăm sóc, tuy nhiên cần đặt tại nơi có nhiều ánh sáng.', '2024-07-09', 0, 0),
(48, 'Cây trầu bà đế vương xanh', 220000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-trau-ba-de-vuong-xanh-de-ban-chau-su-800x800.jpg', 200, 2, 400, 'Trầu Bà Đế Vương Xanh (Philodendron Imperial Green) là một giống cây rất ưu chuộng để trồng với ý nghĩa phong thủy mà nó mang lại. Nên đặt cây tại các vị trí như trong phòng khách, phòng làm việc, văn phòng hoặc sảnh ra vào cơ quan.', '2024-07-02', 0, 0),
(49, 'Cây cọ Nhật', 180000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-co-nhat-nho-de-san-1-800x800.jpg', 100, 3, 200, 'Cây cọ nhật là loại cây trong nhà có kiểu lá xòe rộng như những cánh quạt, giúp trang trí không gian thêm xanh mát. Nó còn là loại cây phong thủy tượng trưng cho sự giàu sang và tiền tài nên rất đáng trồng trên bàn làm việc.', '2024-07-10', 0, 0),
(50, 'Cây hồng môn cỡ nhỏ', 250000, 'https://mowgarden.com/wp-content/uploads/2023/02/cay-hong-mon-chau-dat-nung-1-800x800.jpg', 200, 3, 1235, 'Cây hồng môn được biết tới là một loại cây cảnh mang lại điều tốt lành, có thể giúp điều hòa khí phong thủy trong nhà, có khả năng thu hút những dòng khí tích cực và làm tiêu bớt dòng khí tiêu cực cho môi trường xung quanh, trồng cây hồng môn trong nhà sẽ giúp không gian sống trở nên hài hòa và bình', '2024-07-02', 0, 0),
(51, 'Cây trầu bà đế vương kim cương', 200000, 'https://mowgarden.com/wp-content/uploads/2023/02/cay-trau-ba-de-vuong-kim-cuong-chau-su-trang-1-800x800.jpg', 14, 3, 123, 'Đế vương kim cương sở hữu bộ lá xanh khoẻ khoắn, xen kẽ vân sọc trắng hài hoà và đầy cuốn hút. Chắc chắn nó sẽ là điểm nhấm tuyệt vời cho không gian nội thất, bớt đi sự nhàm chán và giúp cải thiện chất lượng không khí hiệu quả.', '2024-07-09', 0, 0),
(52, 'Cây đa tam phúc', 300000, 'https://mowgarden.com/wp-content/uploads/2022/08/cay-da-tam-phuc-nho-de-ban-chau-gom-1-800x800.jpg', 200, 3, 500, 'Đây sẽ là một dạng năng lượng tích cực, bạn sẽ cảm nhận được nhiều giá trị như sức khỏe, sự giàu có hay mối quan hệ tốt đẹp đến với cuộc sống của mình.', '2024-07-02', 0, 0),
(53, 'Cây trầu bà đế vương kim cương', 200000, 'https://mowgarden.com/wp-content/uploads/2023/02/cay-trau-ba-de-vuong-kim-cuong-1-800x800.jpg', 100, 3, 324, 'Đế vương kim cương sở hữu bộ lá xanh khoẻ khoắn, xen kẽ vân sọc trắng hài hoà và đầy cuốn hút. Chắc chắn nó sẽ là điểm nhấm tuyệt vời cho không gian nội thất, bớt đi sự nhàm chán và giúp cải thiện chất lượng không khí hiệu quả.', '2024-05-19', 0, 0),
(54, 'Cây hạnh phúc 1 thân', 300000, 'https://mowgarden.com/wp-content/uploads/2023/01/hanhphucmowgarden1-800x800.jpg', 200, 3, 500, 'Cây hạnh phúc là dòng cây cảnh đẹp, sức sống khỏe mạnh, dễ chăm sóc. Trên cây có những tán lá xanh tươi, mượt mà thể hiện cho sự hi vọng và niềm tin mạnh mẽ. Với ý nghĩa mang lại may mắn và hạnh phúc nên cây thường được chọn để làm cây trưng trong nhà hoặc làm quà tặng.', '2024-07-10', 0, 0),
(55, 'Cây kim ngân 1 thân', 200000, 'https://mowgarden.com/wp-content/uploads/2023/01/cay-kim-ngan-mot-than-chau-su-de-ban-800x800.jpg', 100, 3, 323, 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', '2024-07-10', 0, 0),
(56, 'Cây kim ngân thắt bính cao', 1000000, 'https://mowgarden.com/wp-content/uploads/2023/01/kimnganbinhmowgarden2.jpg', 200, 3, 500, 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', '2024-07-10', 0, 0),
(57, 'Cây cọ lá xẻ mini', 160000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-co-la-xe-de-ban-chau-su-trang-1a-800x800.jpg', 100, 4, 132, 'Cây cọ nhật là loại cây trong nhà có kiểu lá xòe rộng như những cánh quạt, giúp trang trí không gian thêm xanh mát. Nó còn là loại cây phong thủy tượng trưng cho sự giàu sang và tiền tài nên rất đáng trồng trên bàn làm việc.', '2024-07-10', 0, 0),
(58, 'Cây trầu bà đế vương xanh', 320000, 'https://mowgarden.com/wp-content/uploads/2023/03/12-cay-trau-ba-de-vuong-xanh-de-ban-chau-su-trang-1-800x800.jpg', 100, 4, 133, 'Trầu Bà Đế Vương Xanh (Philodendron Imperial Green) là một giống cây rất ưu chuộng để trồng với ý nghĩa phong thủy mà nó mang lại. Nên đặt cây tại các vị trí như trong phòng khách, phòng làm việc, văn phòng hoặc sảnh ra vào cơ quan.', '2024-07-23', 0, 0),
(59, 'Cây phú quý ', 320000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-phu-quy-chau-su-tho-cam-mow-garden-800x800.jpg', 200, 4, 400, 'Cây Phú Quý có ý nghĩa mang lại may mắn, phú quý, đại cát đại lợi, bình an cho chủ nhân. Để Trúc Phú Quý mang lại ý nghĩa trọn vẹn bạn lưu ý về vị trí đặt theo hướng hợp với bản mệnh của mình.', '2024-07-01', 0, 0),
(60, 'Cây hạnh phúc mini', 150000, 'https://mowgarden.com/wp-content/uploads/2023/03/5-cay-hanh-phuc-nho-de-ban-chau-su-1-800x800.jpg', 100, 4, 123, 'Cây hạnh phúc là dòng cây cảnh đẹp, sức sống khỏe mạnh, dễ chăm sóc. Trên cây có những tán lá xanh tươi, mượt mà thể hiện cho sự hi vọng và niềm tin mạnh mẽ. Với ý nghĩa mang lại may mắn và hạnh phúc nên cây thường được chọn để làm cây trưng trong nhà hoặc làm quà tặng.', '2024-07-09', 0, 0),
(61, 'Cây trầu bà đế vương vàng', 160000, 'https://mowgarden.com/wp-content/uploads/2023/03/1-cay-trau-ba-de-vuong-vang-chau-su-1-800x800.jpg', 200, 4, 500, 'Trầu Bà Đế Vương Vàng có tên tiếng Anh là Philodendron Imperial Golden, là dòng cây thân thảo, có sức sống bền bỉ và rất dễ chăm sóc. Loài cây này có phần lá non màu vàng tươi tại trung tâm, khi già đi thì lá chuyển sang màu xanh trong tự nhiên rất bắt mắt. Đây là một loại cây trang trí nội thất rất', '2024-07-10', 0, 0),
(62, 'Cây trường sinh xanh ', 120000, 'https://mowgarden.com/wp-content/uploads/2023/03/2-cay-truong-sinh-de-ban-chau-su-1-800x800.jpg', 100, 4, 100, 'Cây trường sinh xanh là một loại cây cảnh trong nhà đẹp mắt, với bộ lá luôn xanh mát, sức sống mãnh liệt, dễ chăm sóc. Đây cũng là loại cây phong thủy với tác dụng mang đến sức khỏe, may mắn và tiền tài tới cho gia chủ. Người ta thường hay tặng cây trường sinh vào những dịp đặc biệt như là một lời c', '2024-07-02', 0, 0),
(63, 'Cây hạnh phúc để bàn', 250000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-hanh-phuc-de-ban-chau-su-800x800.jpg', 200, 4, 500, 'Cây hạnh phúc là dòng cây cảnh đẹp, sức sống khỏe mạnh, dễ chăm sóc. Trên cây có những tán lá xanh tươi, mượt mà thể hiện cho sự hi vọng và niềm tin mạnh mẽ. Với ý nghĩa mang lại may mắn và hạnh phúc nên cây thường được chọn để làm cây trưng trong nhà hoặc làm quà tặng.', '2024-07-04', 0, 0),
(64, 'Cây kim ngân ‘Tay Phật’', 200000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-kim-ngan-tay-phat-chau-su-1-800x800.jpg', 32, 4, 123, 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', '2024-07-10', 0, 0),
(65, 'Cây kim giao', 300000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-kim-giao-chau-su-trang-800x800.jpg', 200, 4, 504, 'Kim giao là một cây thân gỗ có giá trị kinh tế lớn. Nhờ có sức sống mạnh mẽ, kiểu dáng đẹp, lá xum xuê và xanh mướt nên chúng cũng được nhân giống để làm cây cảnh để bàn, giúp tạo không gian xanh mát và thư giãn. Đồng thời đây cũng là một loại cây mang ý nghĩa phong thủy rất tốt. Rất thích hợp làm q', '2024-07-16', 0, 0),
(66, 'Cây may mắn hình trái tim', 240000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-co-may-man-chau-su-1-800x800.jpg', 100, 4, 100, 'Cây cỏ may mắn là một loại cây đặc biệt, được ươm từ những hạt thanh long và tạo hình bởi bàn tay khéo léo của người nghệ nhân. Trên những quả cầu màu xanh xanh là hàng vạn cây non được ươm trổ trông rất bắt mắt và độc đáo. Chúng được xem là biểu tượng cho tình yêu, hy vọng và sự may mắn nên thường ', '2024-07-09', 0, 0),
(67, 'Cây may mắn dáng tree', 250000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-may-man-qua-tang-dang-tree-1-800x800.jpg', 200, 4, 1234, 'Cây cỏ may mắn là một loại cây đặc biệt, được ươm từ những hạt thanh long và tạo hình bởi bàn tay khéo léo của người nghệ nhân. Trên những quả cầu màu xanh xanh là hàng vạn cây non được ươm trổ trông rất bắt mắt và độc đáo. Chúng được xem là biểu tượng cho tình yêu, hy vọng và sự may mắn nên thường ', '2024-07-04', 0, 0),
(68, 'Cây cọ Nhật nhỏ chậu sứ', 100000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-co-nhat-nho-de-san-1-800x800.jpg', 100, 4, 123, 'Cây cọ nhật là loại cây trong nhà có kiểu lá xòe rộng như những cánh quạt, giúp trang trí không gian thêm xanh mát. Nó còn là loại cây phong thủy tượng trưng cho sự giàu sang và tiền tài nên rất đáng trồng trên bàn làm việc.', '2024-07-10', 0, 0),
(69, 'Cây trầu bà thiên nga', 250000, 'https://mowgarden.com/wp-content/uploads/2022/08/cay-trau-ba-thien-nga-chau-su-1-800x800.jpg', 200, 4, 400, 'Trầu Bà Chân Vịt có thể còn lạ lẫm với nhiều người, không biết hình dạng của loài cây đó ra sao. Đó là một loài cây có đặc tính sinh trưởng mạnh mẽ, thường được mọi người dùng để tô điểm cho không gian sinh sống, trang trí nội thất.', '2024-07-10', 0, 0),
(70, '\r\n Add to wishlist\r\nCây trường sinh', 240000, 'https://mowgarden.com/wp-content/uploads/2023/02/cay-truong-sinh-la-tim-chau-su-1-800x800.jpg', 100, 4, 100, 'Cây trường sinh lá đỏ là một loại cây cảnh trong nhà đẹp mắt, với bộ lá luôn xanh mát, sức sống mãnh liệt, dễ chăm sóc. Đây cũng là loại cây phong thủy với tác dụng mang đến sức khỏe, may mắn và tiền tài tới cho gia chủ. Người ta thường hay tặng cây trường sinh vào những dịp đặc biệt như là một lời ', '2024-05-01', 0, 0),
(71, 'Cây kim ngân thủy sinh', 200000, 'https://mowgarden.com/wp-content/uploads/2022/09/cay-kim-ngan-thuy-sinh-mot-than-tru-lon-800x800.jpg', 100, 5, 322, 'Cây Kim Ngân (Pachira aquatica) là dòng cây nội thất được ưu chuộng và phổ biến nhất trên thế giới, nó được biết đến là loại cây phong thủy giúp mang lại những điều tốt lành, vận may và tiền tài tới cho gia chủ.', '2024-07-09', 0, 0),
(72, 'Cây tróc bạc hồng thủy sinh', 220000, 'https://mowgarden.com/wp-content/uploads/2022/09/cay-troc-bac-hong-thuy-sinh-800x800.jpg', 200, 5, 400, 'Cây tróc bạc hồng là loài cây trong có thể trồng trong chậu đất, trong nước thủy sinh hoặc chậu treo trang trí nhà cửa. Trồng cây tróc bạc giúp đem đến không gian sống động, gần gũi với thiên nhiên hơn.', '2024-07-01', 0, 0),
(73, 'Cây tróc bạc xanh thủy sinh', 200000, 'https://mowgarden.com/wp-content/uploads/2022/09/cay-trac-bac-xanh-thuy-sinh-800x800.jpg', 100, 5, 322, 'Cây tróc bạc hay còn gọi là trầu bà trắng là loài cây trong có thể trồng trong chậu đất, trong nước thủy sinh hoặc chậu treo trang trí nhà cửa. Trồng cây tróc bạc giúp đem đến không gian sống động, gần gũi với thiên nhiên hơn.', '2024-07-10', 0, 0),
(74, 'Cây trầu bà tỷ phú thủy sinh', 250000, 'https://mowgarden.com/wp-content/uploads/2022/09/cay-trau-ba-ty-phu-thuy-sinh-800x800.jpg', 200, 5, 400, 'Cây trầu bà vốn đứng đầu danh sách những loài thực vật có khả năng hấp thụ các loại độc tố trong không khí rất hiệu quả. Và cũng bởi vẻ nhỏ nhắn và xanh mượt nên cũng là một trong những loại cây trong nhà được ưu chuộng', '2024-07-01', 0, 0),
(75, 'Cây hồng môn thủy sinh', 240000, 'https://mowgarden.com/wp-content/uploads/2022/02/cay-hong-mon-thuy-sinh-1-800x800.jpg', 100, 5, 132, 'Cây hồng môn được biết tới là một loại cây cảnh mang lại điều tốt lành, có thể giúp điều hòa khí phong thủy trong nhà, có khả năng thu hút những dòng khí tích cực và làm tiêu bớt dòng khí tiêu cực cho môi trường xung quanh, trồng cây hồng môn trong nhà sẽ giúp không gian sống trở nên hài hòa và bình', '2024-05-01', 0, 0),
(76, 'Cây đuôi công xanh thuy sinh', 0, 'https://mowgarden.com/wp-content/uploads/2022/09/cay-duoi-cong-xanh-thuy-sinh-800x800.jpg', 200, 5, 500, 'Cây đuôi công còn giúp mang lại không khí tự nhiên xanh mát, và là biểu tượng cho quyền quý, may mắn nên được lựa chọn làm món quà tặng trong các dịp sinh nhật, lễ tết, ngày đặc biệt…', '2024-07-01', 0, 0),
(77, 'Cây đuôi công sọc xanh thủy sinh', 0, 'https://mowgarden.com/wp-content/uploads/2022/09/cay-duoi-cong-la-xanh-dom-thuy-sinh-800x800.jpg', 100, 5, 100, 'Cây đuôi công còn giúp mang lại không khí tự nhiên xanh mát, và là biểu tượng cho quyền quý, may mắn nên được lựa chọn làm món quà tặng trong các dịp sinh nhật, lễ tết, ngày đặc biệt…', '2024-07-09', 0, 0),
(78, 'Cây đuôi công tím thủy sinh', 250000, 'https://mowgarden.com/wp-content/uploads/2022/09/cay-duoi-cong-tim-thuy-sinh-800x800.jpg', 200, 5, 400, 'Cây đuôi công còn giúp mang lại không khí tự nhiên xanh mát, và là biểu tượng cho quyền quý, may mắn nên được lựa chọn làm món quà tặng trong các dịp sinh nhật, lễ tết, ngày đặc biệt…', '2024-07-01', 0, 0),
(79, 'Cây Trầu Bà Cẩm Thạch', 200000, 'https://mowgarden.com/wp-content/uploads/2022/02/cay-trau-ba-cam-thach-thuy-sinh-1-800x800.jpg', 100, 5, 132, 'Cây trầu bà cẩm thạch (Epipremnum ‘Njoy’) là một dòng trầu bà mới được du nhập, có bộ lá màu loang kem xanh độc đáo. Cũng tương tự cây trầu bà, nó cũng là giống cây có sức sống cực kỳ khỏe mạnh, với bộ lá xanh quanh năm và tốc độ phát triển khá nhanh.', '2024-07-02', 0, 0),
(80, 'Cây Trường Sinh Thủy Sinh', 0, 'https://mowgarden.com/wp-content/uploads/2022/02/cay-truong-sinh-thuy-sinh-de-ban-1-800x800.jpg', 123, 5, 400, 'Cây trường sinh (Peperomia obtusifolia) là một loại cây cảnh trong nhà đẹp mắt, với bộ lá luôn xanh mát, sức sống mãnh liệt, dễ chăm sóc. Đây cũng là loại cây phong thủy với tác dụng mang đến sức khỏe, may mắn và tiền tài tới cho gia chủ. Người ta thường hay tặng cây trường sinh vào những dịp đặc bi', '2024-07-01', 0, 0),
(81, 'Cây kim ngân thủy sinh', 200000, 'https://mowgarden.com/wp-content/uploads/2022/02/cay-kim-ngan-mot-than-thuy-sinh-1-800x800.jpg', 100, 5, 123, 'Cây Kim Ngân (Pachira aquatica) là dòng cây nội thất được ưu chuộng và phổ biến nhất trên thế giới, nó được biết đến là loại cây phong thủy giúp mang lại những điều tốt lành, vận may và tiền tài tới cho gia chủ.', '2024-07-09', 0, 0),
(82, 'Cây phát lộc thủy sinh', 160000, 'https://mowgarden.com/wp-content/uploads/2022/02/cay-phat-loc-thuy-sinh-800x800.jpg', 200, 5, 400, 'Cây phát lộc (Dracaena sanderiana) là một loại cây phong thủy được xem là có tác dụng chiêu tài, giúp gia tăng vượng khí cho gia chủ, xua đuổi tà khí và mang đến sự may mắn, tài lộc. Đây cũng là loại cây thích hợp để làm quà tặng giúp với ý nghĩa chúc phúc cho người được nhận.', '2024-07-01', 0, 0),
(83, 'Cây Vạn Lộc Thủy Sinh', 200000, 'https://mowgarden.com/wp-content/uploads/2021/04/cay-van-loc-thuy-sinh-1-1-800x800.jpg', 100, 5, 322, 'Cây vạn lộc (Aglaonema Lady Valentine) là dòng cây cảnh nội thất dễ chăm sóc, có thể sống được trong điều kiện ánh sáng thấp. Với một hình dạng lá độc đáo, bên trên là những họa tiết đẹp mắt giống như tranh vẽ giúp tạo thêm điểm nhấn cho không gian nội thất. Kích thước nhỏ gọn của cây vạn lộc thủy s', '2024-05-01', 0, 0),
(84, 'Cây cau tiểu trâm ', 250000, 'https://mowgarden.com/wp-content/uploads/2022/02/cay-cau-tieu-tram-thuy-sinh-1-1-800x800.jpg', 200, 5, 400, 'Cau tiểu trâm hay còn được gọi là dừa tụ thân là một trong những loại cây cảnh nội thất rất được ưa chuộng hiện nay. Với tán lá xanh mượt và đặc tính lọc sạch các chất khí độc, cau tiểu trâm mang lại không khí trong lành, bởi vậy cau tiểu trâm được lựa chọn làm món quà tặng trong các dịp sinh nhật, ', '2024-07-01', 0, 0),
(85, 'Cây đuôi công khổng tước', 120000, 'https://mowgarden.com/wp-content/uploads/2022/02/cay-duoi-cong-la-dom-thuy-sinh-1-800x800.jpg', 100, 5, 123, 'Cau đuôi công khổng tước (Calathea makoyana) là một trong những loại cây cảnh nội thất rất được ưa chuộng hiện nay. Với tán lá xanh mượt mà, trên đó là những đốm xanh đặc sắc như đuôi công giúp tạo điểm nhấn cho không gian rất tuyệt vời. Cây đuôi công còn giúp mang lại không khí tự nhiên xanh mát, v', '2024-07-09', 0, 0),
(86, 'Cây Hồng Lộc Phát', 250000, 'https://mowgarden.com/wp-content/uploads/2022/02/cay-hong-loc-thuy-sinh-1-800x800.jpg', 200, 5, 400, 'Cây hồng lộc phát (Aglaonema Red Valentine) là dòng cây cảnh nội thất dễ chăm sóc, có thể sống được trong điều kiện ánh sáng thấp. Với một hình dạng lá độc đáo, bên trên là những họa tiết đẹp mắt giống như tranh vẽ giúp tạo thêm điểm nhấn cho không gian nội thất. Kích thước nhỏ gọn của cây hồng lộc ', '2024-07-04', 0, 0),
(87, 'Cây hồng hạc thân cam', 200000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-hong-hac-chan-cam-chau-trai-banh-1-800x800.jpg', 100, 6, 132, 'Cây Hạc Cam đặc trưng bởi những chiếc lá thuôn dài, hình dây đeo có xẻ trái tim sâu, phần cuống cũng được tô điểm bởi màu da cam rất bắt mắt. Khi trưởng thành cây hạc Philodendron billietiae có kích thước rất khủng nên được nhiều người săn đón sưu tầm', '2024-07-09', 0, 0),
(88, 'Cây trầu bà đế vương kim cương ‘Birkin’', 250000, 'https://mowgarden.com/wp-content/uploads/2023/03/cay-trau-ba-de-vuong-kim-cuong-chau-su-1-800x800.jpg', 200, 6, 400, 'Đế vương kim cương sở hữu bộ lá xanh khoẻ khoắn, xen kẽ vân sọc trắng hài hoà và đầy cuốn hút. Chắc chắn nó sẽ là điểm nhấm tuyệt vời cho không gian nội thất, bớt đi sự nhàm chán và giúp cải thiện chất lượng không khí hiệu quả.', '2024-07-02', 0, 0),
(89, 'Cây trầu bà Nam Mỹ', 2000000, 'https://mowgarden.com/wp-content/uploads/2023/01/cay-trau-ba-nam-my-monstera-1-800x800.jpg', 100, 6, 100, 'Monstera là dòng câycó sức sống mạnh mẽ, dễ chăm sóc, chỉ ánh sáng tán xạ vừa phải, thích với môi trường có ít ánh sáng. Cây trầu bà Nam Mỹ được xem là biểu tượng rất được ưu thích trong lĩnh vực thời trang, kiến trúc và nội thất. Nó thường được đặt cạnh các thương hiệu lớn như một cách để tạo thêm ', '2024-07-09', 0, 0),
(90, 'Cây rồng bạc ‘Silver Dragon’', 250000, 'https://mowgarden.com/wp-content/uploads/2022/08/cay-mon-rong-bac-chau-su-trang-800x800.jpg', 200, 6, 400, 'Bạn không cần dành quá nhiều thời gian cho Rồng Bạc nhưng vẫn ngắm nhìn được vẻ đẹp của nó mỗi ngày.', '2024-07-01', 0, 0),
(91, 'Cây trầu bà Nam Mỹ Monstera', 450000, 'https://mowgarden.com/wp-content/uploads/2022/12/cay-trau-ba-la-xe-monstera-800x800.jpg', 100, 6, 323, 'Cây trầu bà Nam Mỹ được xem là một loài cây kiểng lá “quốc dân”, được ưu chuộng khắp nơi trên thế giới. Nhờ sở hữu một bộ lá ấn tượng, trang nhã và sang trong mà chúng luôn trở thành tâm điểm điểm của những hình ảnh đại diện cho các nhãn hàng, thương hiệu cho tới cá nhân trên các trang mạng xã hội.', '2024-07-09', 0, 0),
(92, 'Cây đuôi công Calathea', 250000, 'https://mowgarden.com/wp-content/uploads/2022/09/cay-duoi-cong-calathea-Warscewiczii-1-800x800.jpg', 200, 6, 400, 'Calathea Warscewiczii là loài thực vật thân thảo, có lá hình thuôn tròn, màu xanh đậm, họa tiết viền xanh nhạt. Loài này rất dễ sống, thường được trồng để trang trí trong nhà, thanh lọc không khí và mang ý nghĩa đem lại may mắn, thành công và thịnh vượng.', '2024-07-01', 0, 0),
(93, 'Cây đuôi xương cá Calathea', 200000, 'https://mowgarden.com/wp-content/uploads/2022/09/cay-duoi-cong-xuong-ca-1-800x800.jpg', 100, 6, 100, 'Cây đuôi xương cá là loài thực vật thân thảo, có lá hình thuôn tròn, sọc xanh. Loài này rất dễ sống, thường được trồng để trang trí trong nhà, thanh lọc không khí và mang ý nghĩa đem lại may mắn, thành công và thịnh vượng.', '2024-07-09', 0, 0),
(94, 'Cây cầu nguyện', 250000, 'https://mowgarden.com/wp-content/uploads/2022/09/cay-cau-nguyen-Maranta-leuconeura-a-800x800.jpg', 200, 6, 400, 'Maranta leuconeura là một loại cây nội thất rất được ưu thích tại các nước Châu Âu. Loài cây này sở hữu bộ lá sặc sỡ tựa như một chiếc đuôi công, những đường gân lá khỏe khoắn gây ấn tượng mạnh, cùng tông màu đẹp như một bức tranh nghệ thuật.', '2024-07-01', 0, 0),
(95, 'Cây đuôi công tím', 200000, 'https://mowgarden.com/wp-content/uploads/2022/09/cay-duoi-cong-tim-thuy-sinh-800x800.jpg', 100, 6, 100, 'Cây đuôi công còn giúp mang lại không khí tự nhiên xanh mát, và là biểu tượng cho quyền quý, may mắn nên được lựa chọn làm món quà tặng trong các dịp sinh nhật, lễ tết, ngày đặc biệt…', '2024-07-10', 0, 0),
(96, 'Cây trầu bà Philodendron', 250000, 'https://mowgarden.com/wp-content/uploads/2022/09/philodendronparaisomowgarden-800x800.jpg', 200, 6, 400, 'Philodendron Paraiso là một loại cây nội thất cao cấp có hình dáng lá độc đáo, thích hợp đặt trong những không gian hiện đại và sang trọng.', '2024-07-02', 0, 0),
(97, 'Cây Hồng môn Anthurium', 1200000, 'https://mowgarden.com/wp-content/uploads/2022/08/anthurcrystall-800x800.jpg', 100, 6, 100, 'Crystallinum đẻ nhánh, tốc độ ra lá và để nhánh nhanh nhưng size lá không quá to.', '2024-07-09', 0, 0),
(98, 'Cây ráng tổ yến ', 500000, 'https://mowgarden.com/wp-content/uploads/2022/08/toyen-800x800.jpg', 200, 6, 232, 'Tổ yến góp phần lọc không khí, tạo mảng xanh trong ngôi nhà, khu vườn của bạn.', '2024-07-01', 0, 0),
(99, 'Cây trầu bà đế vương', 500000, 'https://mowgarden.com/wp-content/uploads/2022/08/cay-trau-ba-de-vuong-do-PHIL003-800x800.jpg', 100, 6, 322, 'Cây Trầu Bà Đế Vương được xem là biểu tượng của bậc đế vương, mang ý nghĩa giúp đem lại sự thịnh vượng, may mắn, thành công tới cho gia chủ. Bên cạnh đó, nó còn có khả năng hấp thu các loại khí thải … giúp không khi trong lành hơn', '2024-07-09', 0, 0),
(100, 'Cây đuôi công xương cá', 400000, 'https://mowgarden.com/wp-content/uploads/2022/08/cay-duoi-cong-de-ban-cala001-800x800.jpg', 200, 6, 500, 'Cây đuôi công thường được chọn để mang lại không gian xanh mát cho phòng làm việc, phòng làm việc, văn phòng, quán cafe,… Bởi loài cây có những đường vân sọc độc đáo, cùng màu xanh dễ chịu giúp căn phòng trở nên tươi mát và sang trọng hơn.', '2024-07-01', 0, 0),
(101, 'Cây Philodendron Paraiso', 500000, 'https://mowgarden.com/wp-content/uploads/2022/03/philodendron-paraiso-800x800.jpg', 100, 6, 322, 'Nếu lúc trước muốn được sở hữu 1 Paraiso đẹp thì giá không hề dễ chịu. Nhưng hiện nay Paraiso gọi là cây quốc dân bất kể ai cũng có thể săn đón dễ dàng.', '2024-07-10', 0, 0),
(102, 'Chậu đất nung tròn bầu họa tiết hoa cúc DANU124', 50000, 'https://mowgarden.com/wp-content/uploads/2022/11/chau-dat-nung-dang-tron-bau-hoa-cuc-1-800x800.jpg', 100, 7, 100, ' Sản phẩm là hàng thủ công mỹ nghệ nên không thể hoàn hảo tuyệt đối, thông số kích thước có thể sai sót 5% đến 10%', '2024-07-09', 0, 0),
(103, 'Chậu đất nung trụ tròn vát đáy 18x18cm DANU123', 50000, 'https://mowgarden.com/wp-content/uploads/2022/11/chau-dat-nung-tru-tron-vat-day-800x800.jpg', 200, 7, 403, 'Sản phẩm là hàng thủ công mỹ nghệ nên không thể hoàn hảo tuyệt đối, thông số kích thước có thể sai sót 5% đến 10%', '2024-07-16', 0, 0),
(104, 'Chậu đất nung vát đáy sơn nhám 17x15cm DANU122', 20000, 'https://mowgarden.com/wp-content/uploads/2022/11/chau-dat-nung-den-son-nham-800x800.jpg', 32, 7, 100, 'Ghi chú: Sản phẩm là hàng thủ công mỹ nghệ nên không thể hoàn hảo tuyệt đối, thông số kích thước có thể sai sót 5% đến 10%', '2024-07-09', 0, 0),
(105, 'Chậu đất nung wax hoa cúc 18×30-25x34cm DANU121', 250000, 'https://mowgarden.com/wp-content/uploads/2022/11/chau-dat-nung-hoa-tiet-hoa-cuc-1-800x800.jpg', 200, 7, 500, 'Sản phẩm là hàng thủ công mỹ nghệ nên không thể hoàn hảo tuyệt đối, thông số kích thước có thể sai sót 5% đến 10%', '2024-07-16', 0, 1),
(106, 'Chậu đất nung wax màu xanh 20x17cm DANU120', 200000, 'https://mowgarden.com/wp-content/uploads/2022/11/chau-dat-nung-wax-xanh-1-800x800.jpg', 100, 7, 322, 'Sản phẩm là hàng thủ công mỹ nghệ nên không thể hoàn hảo tuyệt đối, thông số kích thước có thể sai sót 5% đến 10%', '2024-07-02', 0, 0),
(107, '\nChậu đất nung sơn nhám cao cấp có dĩa 20x20cm DANU119', 220000, 'https://mowgarden.com/wp-content/uploads/2022/11/chau-dat-nung-son-cao-cap-1-800x800.jpg', 200, 7, 400, 'Sản phẩm là hàng thủ công mỹ nghệ nên không thể hoàn hảo tuyệt đối, thông số kích thước có thể sai sót 5% đến 10%', '2024-07-01', 0, 0),
(108, 'Chậu đất nung họa tiết Vintage 25×25-18×18-14x14cm DANU118', 20000, 'https://mowgarden.com/wp-content/uploads/2022/11/chau-dat-nung-vintage-1-800x800.jpg', 32, 7, 100, 'Sản phẩm là hàng thủ công mỹ nghệ nên không thể hoàn hảo tuyệt đối, thông số kích thước có thể sai sót 5% đến 10%', '2024-05-19', 0, 0),
(109, 'Chậu đất nung trụ tròn vân đa giác 15x14cm DANU117', 45000, '	https://mowgarden.com/wp-content/uploads/2022/11/chau-dat-nung-tru-tron-1.jpg', 200, 7, 1235, 'Sản phẩm là hàng thủ công mỹ nghệ nên không thể hoàn hảo tuyệt đối, thông số kích thước có thể sai sót 5% đến 10%', '2024-07-04', 0, 0),
(110, 'Chậu đất nung vân thổ cẩm sơn màu 17x17cm DANU116', 60000, 'https://mowgarden.com/wp-content/uploads/2022/11/chau-dat-nung-son-trang-van-tho-cam.jpg', 100, 7, 100, 'Sản phẩm là hàng thủ công mỹ nghệ nên không thể hoàn hảo tuyệt đối, thông số kích thước có thể sai sót 5% đến 10%', '2024-07-09', 0, 0),
(111, 'Chậu đất nung trụ tròn gân kẻ 16x14cm DANU115', 60000, 'https://mowgarden.com/wp-content/uploads/2022/11/chau-dat-nung-tru-tron-gan-ke.jpg', 200, 7, 1235, 'Sản phẩm là hàng thủ công mỹ nghệ nên không thể hoàn hảo tuyệt đối, thông số kích thước có thể sai sót 5% đến 10%', '2024-07-16', 0, 1),
(112, 'Chậu đất nung hình loa sơn trang trí 15x15cm DANU114', 60000, 'https://mowgarden.com/wp-content/uploads/2022/11/chau-dat-nung-hinh-loa-son-trang-tri-1-1.jpg', 100, 7, 100, 'Sản phẩm là hàng thủ công mỹ nghệ nên không thể hoàn hảo tuyệt đối, thông số kích thước có thể sai sót 5% đến 10%', '2024-07-09', 0, 0),
(113, 'Chậu đất nung gân sọc sơn trắng 16×14,5cm DANU113', 50000, '	https://mowgarden.com/wp-content/uploads/2022/11/chau-dat-nung-gan-soc-1.jpg', 200, 7, 400, 'Sản phẩm là hàng thủ công mỹ nghệ nên không thể hoàn hảo tuyệt đối, thông số kích thước có thể sai sót 5% đến 10%', '2024-07-01', 0, 0),
(114, 'Chậu đá mài Granito dáng trụ vót màu trắng XMDM018', 450000, 'https://mowgarden.com/wp-content/uploads/2023/04/chau-da-mai-vot-day-3.jpg', 100, 8, 100, 'Granito là một loại vậy liệu cổ điển, rất cứng cáp, được chế tác từ các loại đá tự nhiên phối với bê tông hiện đại. Kiểu dáng Granito từng là hiện tượng trong làng thiết kế nội thất những thập 90.Ngày nay, Granito đang dần quay trở lại, chúng mang lại sự thay đổi cho dòng chảy hiện đại một sự tươi m', '2024-05-19', 0, 0),
(115, 'Chậu xi măng hình trụ vuông vân sọc ngang màu đen XMDM017', 500000, 'https://mowgarden.com/wp-content/uploads/2023/04/chau-xi-mang-hinh-tru-son-den-1.jpg', 200, 8, 400, '\r\nCHẤT LIỆu : Bê tông sợi', '2024-07-01', 0, 0),
(116, 'Chậu đá mài Granito cao cấp dáng Remy màu trắng XMDM015', 500000, '	https://mowgarden.com/wp-content/uploads/2023/03/chau-xi-mang-da-mai-granito-dang-remy.jpg', 100, 8, 102, 'Granito là một loại vậy liệu cổ điển, rất cứng cáp, được chế tác từ các loại đá tự nhiên phối với bê tông hiện đại. Kiểu dáng Granito từng là hiện tượng trong làng thiết kế nội thất những thập 90.Ngày nay, Granito đang dần quay trở lại, chúng mang lại sự thay đổi cho dòng chảy hiện đại một sự tươi m', '2024-07-10', 0, 0),
(117, '\r\nChậu xi măng nhẹ hình trụ vát đáy vân quấn rối XMDM014', 250000, 'https://mowgarden.com/wp-content/uploads/2023/03/chau-xi-mang-da-mai-van-quan-roi-1.jpg', 200, 8, 504, 'Granito là một loại vậy liệu cổ điển, rất cứng cáp, được chế tác từ các loại đá tự nhiên phối với bê tông hiện đại. Kiểu dáng Granito từng là hiện tượng trong làng thiết kế nội thất những thập 90.Ngày nay, Granito đang dần quay trở lại, chúng mang lại sự thay đổi cho dòng chảy hiện đại một sự tươi m', '2024-07-01', 0, 0),
(118, 'Chậu xi măng nhẹ hình trụ vát đáy vân quấn rối XMDM014', 200000, 'https://mowgarden.com/wp-content/uploads/2023/03/chau-xi-mang-da-mai-van-quan-roi-1.jpg', 100, 8, 100, 'Granito là một loại vậy liệu cổ điển, rất cứng cáp, được chế tác từ các loại đá tự nhiên phối với bê tông hiện đại. Kiểu dáng Granito từng là hiện tượng trong làng thiết kế nội thất những thập 90.Ngày nay, Granito đang dần quay trở lại, chúng mang lại sự thay đổi cho dòng chảy hiện đại một sự tươi m', '2024-05-01', 0, 0),
(119, 'Chậu xi măng hình giọt nước sơn decor 32x52cm XMDM010', 250000, '	https://mowgarden.com/wp-content/uploads/2022/11/chau-xi-mang-son-mau.jpg', 200, 8, 123, 'Granito là một loại vậy liệu cổ điển, rất cứng cáp, được chế tác từ các loại đá tự nhiên phối với bê tông hiện đại. Kiểu dáng Granito từng là hiện tượng trong làng thiết kế nội thất những thập 90.Ngày nay, Granito đang dần quay trở lại, chúng mang lại sự thay đổi cho dòng chảy hiện đại một sự tươi m', '2024-07-01', 0, 0),
(120, 'Chậu xi măng hình giọt nước sơn decor 32x52cm XMDM011', 500000, '	https://mowgarden.com/wp-content/uploads/2022/12/chau-xi-mang-dai-mai-son-hoa-tiet.jpg', 100, 8, 100, 'Granito là một loại vậy liệu cổ điển, rất cứng cáp, được chế tác từ các loại đá tự nhiên phối với bê tông hiện đại. Kiểu dáng Granito từng là hiện tượng trong làng thiết kế nội thất những thập 90.Ngày nay, Granito đang dần quay trở lại, chúng mang lại sự thay đổi cho dòng chảy hiện đại một sự tươi m', '2024-05-19', 0, 0),
(121, 'Chậu xi măng đá mài trụ tròn vẽ zigzac XMDM013', 250000, 'https://mowgarden.com/wp-content/uploads/2022/12/chau-xi-mang-da-mai-ve.jpg', 200, 8, 123, 'Granito là một loại vậy liệu cổ điển, rất cứng cáp, được chế tác từ các loại đá tự nhiên phối với bê tông hiện đại. Kiểu dáng Granito từng là hiện tượng trong làng thiết kế nội thất những thập 90.Ngày nay, Granito đang dần quay trở lại, chúng mang lại sự thay đổi cho dòng chảy hiện đại một sự tươi m', '2024-07-02', 0, 0),
(122, 'Chậu xi măng hình giọt nước 32x52cm XMDM009', 200000, '	https://mowgarden.com/wp-content/uploads/2022/11/chau-xi-mang-da-mai-giot-nuoc.jpg', 100, 8, 100, 'Granito là một loại vậy liệu cổ điển, rất cứng cáp, được chế tác từ các loại đá tự nhiên phối với bê tông hiện đại. Kiểu dáng Granito từng là hiện tượng trong làng thiết kế nội thất những thập 90.Ngày nay, Granito đang dần quay trở lại, chúng mang lại sự thay đổi cho dòng chảy hiện đại một sự tươi m', '2024-07-02', 0, 0),
(123, 'Chậu xi măng hình trụ sơn họa tiết 40x40cm XMDM008', 250000, 'https://mowgarden.com/wp-content/uploads/2022/11/chau-xi-mang-da-mai-son-mau.jpg', 200, 8, 400, 'Granito là một loại vậy liệu cổ điển, rất cứng cáp, được chế tác từ các loại đá tự nhiên phối với bê tông hiện đại. Kiểu dáng Granito từng là hiện tượng trong làng thiết kế nội thất những thập 90.Ngày nay, Granito đang dần quay trở lại, chúng mang lại sự thay đổi cho dòng chảy hiện đại một sự tươi m', '2024-07-01', 0, 0),
(124, 'Chậu xi măng đá mài đầu đạn họa tiết 29x39cm XMDM007', 200000, 'https://mowgarden.com/wp-content/uploads/2022/11/chau-xi-mang-da-mai-hinh-dau-dan.jpg', 100, 8, 100, 'Granito là một loại vậy liệu cổ điển, rất cứng cáp, được chế tác từ các loại đá tự nhiên phối với bê tông hiện đại. Kiểu dáng Granito từng là hiện tượng trong làng thiết kế nội thất những thập 90.Ngày nay, Granito đang dần quay trở lại, chúng mang lại sự thay đổi cho dòng chảy hiện đại một sự tươi m', '2024-05-19', 0, 0),
(125, 'Chậu xi măng đá mài đầu đạn 29x39cm XMDM006', 250000, '	https://mowgarden.com/wp-content/uploads/2022/11/chau-xi-mang-da-mai-dau-dan.jpg', 200, 8, 123, 'Granito là một loại vậy liệu cổ điển, rất cứng cáp, được chế tác từ các loại đá tự nhiên phối với bê tông hiện đại. Kiểu dáng Granito từng là hiện tượng trong làng thiết kế nội thất những thập 90.Ngày nay, Granito đang dần quay trở lại, chúng mang lại sự thay đổi cho dòng chảy hiện đại một sự tươi m', '2024-07-01', 0, 0);
INSERT INTO `products` (`id`, `name`, `price`, `img`, `quantity`, `cate_id`, `xem`, `description`, `ngay`, `an_hien`, `like`) VALUES
(126, 'Chậu xi măng đá mài hình lu 34x42cm XMDM002', 200000, '	https://mowgarden.com/wp-content/uploads/2022/11/chau-xi-mang-da-mai-hinh-lu-1.jpg', 100, 8, 100, 'Granito là một loại vậy liệu cổ điển, rất cứng cáp, được chế tác từ các loại đá tự nhiên phối với bê tông hiện đại. Kiểu dáng Granito từng là hiện tượng trong làng thiết kế nội thất những thập 90.Ngày nay, Granito đang dần quay trở lại, chúng mang lại sự thay đổi cho dòng chảy hiện đại một sự tươi m', '2024-07-09', 0, 0),
(127, 'Chậu xi măng đá mài hình trụ tròn 40x40cm XMDM003\r\n', 300000, 'https://mowgarden.com/wp-content/uploads/2022/11/chau-xi-mang-da-mai-hinh-tru-tron-1.jpg', 200, 8, 400, 'Granito là một loại vậy liệu cổ điển, rất cứng cáp, được chế tác từ các loại đá tự nhiên phối với bê tông hiện đại. Kiểu dáng Granito từng là hiện tượng trong làng thiết kế nội thất những thập 90.Ngày nay, Granito đang dần quay trở lại, chúng mang lại sự thay đổi cho dòng chảy hiện đại một sự tươi m', '2024-07-01', 0, 0),
(128, 'Chậu xi măng đá mài Remy họa tiết zigzac 37x35cm XMDM005', 200000, 'https://mowgarden.com/wp-content/uploads/2022/11/chau-xi-mang-da-mai-hoa-tiet-zig-zac-1-1.jpg', 100, 8, 100, 'Granito là một loại vậy liệu cổ điển, rất cứng cáp, được chế tác từ các loại đá tự nhiên phối với bê tông hiện đại. Kiểu dáng Granito từng là hiện tượng trong làng thiết kế nội thất những thập 90.Ngày nay, Granito đang dần quay trở lại, chúng mang lại sự thay đổi cho dòng chảy hiện đại một sự tươi m', '2024-05-01', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `username` varchar(150) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `ngay` datetime DEFAULT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 là user, 1 là admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `ngay`, `role`) VALUES
(11, 'testasdsadsa', 'test@gmail.com', '$2b$10$GdOrWCafenq20OIl8eurRufqZ6INyx4wuaY0ojQxZki5NfdvgjF0a', '2024-08-02 09:03:55', 0),
(12, 'admin', 'admin@gmail.com', '$2b$10$uWn5.fnbtedot1TBvDuubutHn8ta4ET.wDupgugSYoQYz0s2VSTV2', '2024-08-02 14:44:07', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binh_luan`
--
ALTER TABLE `binh_luan`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cate`
--
ALTER TABLE `cate`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`id_dh`);

--
-- Chỉ mục cho bảng `don_hang_chi_tiet`
--
ALTER TABLE `don_hang_chi_tiet`
  ADD PRIMARY KEY (`id_ct`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `binh_luan`
--
ALTER TABLE `binh_luan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `cate`
--
ALTER TABLE `cate`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `id_dh` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `don_hang_chi_tiet`
--
ALTER TABLE `don_hang_chi_tiet`
  MODIFY `id_ct` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
