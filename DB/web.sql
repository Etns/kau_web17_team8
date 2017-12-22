-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- 생성 시간: 17-12-22 10:10
-- 서버 버전: 5.7.20
-- PHP 버전: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `web`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `buyer`
--

CREATE TABLE `buyer` (
  `b_id` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `buyer`
--

INSERT INTO `buyer` (`b_id`, `name`, `phone`, `address`) VALUES
('buyer1', 'gumaeja1', '01022220000', 'seoul gangnam1'),
('buyer2', 'gumaeja2', '01022222222', 'seoul gangnam2'),
('buyer3', 'gumaeja3', '01022223333', 'seoul gangnam3'),
('buyer4', 'gumaeja4', '01022224444', 'seoul gangnam4'),
('buyer5', 'gumaeja5', '01022225555', 'seoul gangnam5'),
('a1111', 'êµ¬ë§¤ìž', '01011111111', '123'),
('qw111', 'qweq', '0211223333', 'qweqe'),
('test1222', 'ìž„ì‹œa', '0211112222', 'ì„œìš¸ì‹œ ê°•ì„œêµ¬ í™”ê³¡ë™ 111-11'),
('test12', 'ìž„ì‹œ', '0226514383', 'ì„œìš¸ì‹œ ê°•ì„œêµ¬ í™”ê³¡ë™');

-- --------------------------------------------------------

--
-- 테이블 구조 `member`
--

CREATE TABLE `member` (
  `id` varchar(20) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `mtype` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `member`
--

INSERT INTO `member` (`id`, `password`, `mtype`) VALUES
('a1111', '601f1889667efaebb33b8c12572835da3f027f78', 'buyer'),
('admin', '6c7ca345f63f835cb353ff15bd6c5e052ec08e7a', 'admin'),
('buyer1', '601f1889667efaebb33b8c12572835da3f027f78', 'buyer'),
('buyer2', '601f1889667efaebb33b8c12572835da3f027f78', 'buyer'),
('buyer3', '601f1889667efaebb33b8c12572835da3f027f78', 'buyer'),
('buyer4', '601f1889667efaebb33b8c12572835da3f027f78', 'buyer'),
('buyer5', '601f1889667efaebb33b8c12572835da3f027f78', 'buyer'),
('qw111', '601f1889667efaebb33b8c12572835da3f027f78', 'buyer'),
('seller1', '601f1889667efaebb33b8c12572835da3f027f78', 'seller'),
('seller11', '601f1889667efaebb33b8c12572835da3f027f78', 'seller'),
('seller12', '601f1889667efaebb33b8c12572835da3f027f78', 'seller'),
('seller2', '601f1889667efaebb33b8c12572835da3f027f78', 'seller'),
('seller3', '601f1889667efaebb33b8c12572835da3f027f78', 'seller'),
('seller4', '601f1889667efaebb33b8c12572835da3f027f78', 'seller'),
('test12', '601f1889667efaebb33b8c12572835da3f027f78', 'buyer'),
('test1222', '5d12fb4684cb16c81be3d400ffa21c3d701b0a21', 'buyer');

-- --------------------------------------------------------

--
-- 테이블 구조 `notice`
--

CREATE TABLE `notice` (
  `numbers` int(11) NOT NULL,
  `write_date` date DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `img_dir` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `notice`
--

INSERT INTO `notice` (`numbers`, `write_date`, `title`, `content`, `img_dir`) VALUES
(1, '2017-12-11', 'title1', 'content1', NULL),
(2, '2017-12-12', 'title2', 'content2', NULL),
(3, '2017-12-13', 'title3', 'content3', NULL),
(4, '2017-12-15', 'title4', 'content4', NULL),
(5, '2017-12-17', 'title5', '																 content5		\r\nupdate													', NULL),
(6, '2017-12-21', 'adsfds', 'dfafdaadfd dasf daf da', NULL),
(7, '2017-12-21', 'adsfds', 'dfafdaadfd dasf daf da', NULL),
(8, '2017-12-21', '12e1e1', '1wd1', NULL),
(9, '2017-12-21', '12e1e11111', '1wd1', NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `orders`
--

CREATE TABLE `orders` (
  `o_id` int(11) NOT NULL,
  `p_id` int(11) DEFAULT NULL,
  `s_id` varchar(20) DEFAULT NULL,
  `b_id` varchar(20) DEFAULT NULL,
  `numbers` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `order_time` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `delivery` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `orders`
--

INSERT INTO `orders` (`o_id`, `p_id`, `s_id`, `b_id`, `numbers`, `price`, `order_time`, `status`, `delivery`) VALUES
(1, 1, 'seller1', 'buyer1', 1, 10000, '2017-12-11', 'order complete', NULL),
(2, 1, 'seller1', 'buyer2', 2, 20000, '2017-12-11', 'order complete', NULL),
(5, 2, 'seller3', 'buyer5', 1, 40000, '2017-12-15', 'order complete', NULL),
(8, 1, 'seller1', 'buyer1', 2, 20000, '2017-12-11', 'order complete', NULL),
(9, 1, 'seller1', 'buyer1', 1, 10000, '2017-12-11', 'order complete', NULL),
(10, 1, 'seller1', 'buyer2', 2, 20000, '2017-12-11', 'order complete', NULL),
(13, 2, 'seller3', 'buyer5', 1, 40000, '2017-12-15', 'order complete', NULL),
(16, 6, 'seller1', 'buyer1', 1, 60000, '2017-12-21', 'order complete', NULL),
(17, 13, 'seller2', 'test12', 4, 52492, '2017-12-22', 'order complete', NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `product`
--

CREATE TABLE `product` (
  `p_id` int(11) NOT NULL,
  `s_id` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `category1` varchar(20) NOT NULL,
  `category2` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `measure` varchar(20) DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  `content` text,
  `img_dir` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `product`
--

INSERT INTO `product` (`p_id`, `s_id`, `name`, `category1`, `category2`, `price`, `measure`, `start_time`, `content`, `img_dir`) VALUES
(1, 'seller1', 'kimch2', 'kimch', NULL, 10000, '1kg', '2017-11-13', 'this is content', 'img_main/main-good02'),
(2, 'seller3', 'kimch4', 'kimch', NULL, 40000, '4kg', '2017-11-14', 'this is content', 'img_main/main-good03'),
(4, 'seller1', 'kimch1', 'kimch', NULL, 30000, '3kg', '2017-11-15', 'this is content', 'img_main/main-good05'),
(6, 'seller1', 'kimch5', 'kimch', NULL, 60000, '6kg', '2017-11-21', 'this is content', 'img_main/main-good07'),
(7, 'seller1', 'kimch2', 'kimch', NULL, 10000, '1kg', '2017-11-13', 'this is content', 'img_main/main-good02.jpg'),
(12, 'seller1', 'kimch5', 'kimch', NULL, 60000, '6kg', '2017-11-21', 'this is content', 'img_main/main-good07.jpg'),
(13, 'seller2', 'test1111', 'kimch', NULL, 13123, '2kg', '2017-12-22', 'aaaa', 'img_goods/b_2.jpg'),
(14, 'seller1', 'ìœ ìžì°¨', 'kimch', NULL, 15000, '1L', '2017-12-22', 'ìœ ìžì°¨ìž…ë‹ˆë‹¤.', 'img_goods/main.png');

-- --------------------------------------------------------

--
-- 테이블 구조 `seller`
--

CREATE TABLE `seller` (
  `s_id` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `bank` varchar(15) DEFAULT NULL,
  `account` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `seller`
--

INSERT INTO `seller` (`s_id`, `name`, `phone`, `bank`, `account`) VALUES
('seller1', 'panmaeja1', '01011111111', 'woori1', '11-2222-3333-11'),
('seller2', 'panmaeja2', '01011112222', 'woori2', '11-2222-3333-22'),
('seller3', 'panmaeja3', '01011113333', 'woori3', '11-2222-3333-33'),
('seller4', 'panmaeja4', '01011114444', 'woori4', '11-2222-3333-44'),
('seller11', 'íŒë§¤ìž', '01055559999', 'êµ­ë¯¼ì€í–‰', '01-4444-55-8888'),
('seller12', 'íŒë§¤ìž', '01055559999', 'êµ­ë¯¼ì€í–‰', '01-4444-55-8888');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `buyer`
--
ALTER TABLE `buyer`
  ADD KEY `b_id` (`b_id`);

--
-- 테이블의 인덱스 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`numbers`);

--
-- 테이블의 인덱스 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`o_id`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `s_id` (`s_id`),
  ADD KEY `b_id` (`b_id`);

--
-- 테이블의 인덱스 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `s_id` (`s_id`);

--
-- 테이블의 인덱스 `seller`
--
ALTER TABLE `seller`
  ADD KEY `s_id` (`s_id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `notice`
--
ALTER TABLE `notice`
  MODIFY `numbers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 테이블의 AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 테이블의 AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `buyer`
--
ALTER TABLE `buyer`
  ADD CONSTRAINT `buyer_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `member` (`id`) ON DELETE SET NULL;

--
-- 테이블의 제약사항 `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `product` (`p_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `seller` (`s_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`b_id`) REFERENCES `buyer` (`b_id`) ON DELETE SET NULL;

--
-- 테이블의 제약사항 `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `seller` (`s_id`) ON DELETE SET NULL;

--
-- 테이블의 제약사항 `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `member` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
