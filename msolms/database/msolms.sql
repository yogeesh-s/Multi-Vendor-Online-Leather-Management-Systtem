-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2023 at 06:15 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `msolms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'uploads/admins/64a6f7e7d8fd4.jpg?v=1688664039', NULL, 1, '2021-01-20 14:02:37', '2023-07-06 22:50:39');

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_list`
--

INSERT INTO `cart_list` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(52, 7, 27, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `seller_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `seller_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(12, 6, 'Artificial Leather', 'Artificial leather, also called synthetic leather, is a material intended to substitute for leather in upholstery, clothing, footwear, and other uses where a leather-like finish is desired but the actual material is cost prohibitive or unsuitable, or for ethical concerns.', 1, 0, '2023-07-06 23:23:04', '2023-07-06 23:23:14'),
(13, 6, 'Pure Leather', 'The main difference between pure leather and genuine leather is that the label pure leather indicates that the product is made from real leather while the label genuine leather indicates a low-quality grade of leather.\r\n\r\nAlthough most people assume that genuine leather is high-quality leather, the word genuine actually refers to the grade of leather. In fact, genuine leather is a low-quality leather that is not as durable or attractive as high-quality leather grades like full-grain leather or top-grain leather. However, genuine leather is real leather, made from animal hide.', 1, 0, '2023-07-06 23:24:10', NULL),
(14, 6, 'Male', 'Online shopping for Clothing & Accessories from a great selection of Belts, Caps & Hats, Socks & Hosiery, Ties, Handkerchiefs, Suspenders & more at everyday', 1, 0, '2023-07-06 23:39:31', NULL),
(15, 6, 'Female', 'Online shopping for Clothing & Accessories from a great selection of Belts, Caps & Hats, Socks & Hosiery, Ties, Handkerchiefs, Suspenders & more at everyday', 1, 0, '2023-07-06 23:40:06', NULL),
(16, 6, 'Bags', 'Folio bags are a must essential in today’s fast-paced world. Bearing that in mind Leather Talks have come up with innovative designs to relieve our customers from age-old boring designs of laptop bags made of canvas. We have brought innovation in leather print and in design. Our range of laptop bags suits all purposes, right from going to the office to hanging out with family and friends. In short, these folios can serve both as laptop bags and as well as messenger bags. If you do not have a high budget but still craving for a leather laptop bag, we have the right one for you. You can explore our range starting from Accord all the way up to Aaron II in a wide variety of colors and leather. We also have combos of folio, belt and wallet.', 1, 0, '2023-07-06 23:42:14', NULL),
(17, 6, 'Belt', 'Belt - Buy wide range of Belts Online. Leather Striped Belt, Textured Reversible Belt, Solid Belt for men at best price.Get Men Formal Belts', 1, 0, '2023-07-06 23:43:06', NULL),
(18, 6, 'Shoes', 'Leather Shoes - Shop Latest Leather Shoes online for Men, Women & Kids in India. Check out the variety of leather shoes such as formal, pure leather', 1, 0, '2023-07-06 23:44:18', NULL),
(19, 6, 'Wallet', 'Best Leather Wallet Overall: Leatherology Thin Bifold Wallet Premium.\r\nBest Affordable Leather Wallet: Bellroy Hide And Seek Wallet.\r\nBest Slim Leather Wallet: Shinola Slim Bifold Wallet.\r\nBest Minimalist Leather Wallet: Ettinger Capra Slim Credit Card Case', 1, 0, '2023-07-06 23:45:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `price`, `date_created`) VALUES
(14, 27, 1, 6490, '2023-07-08 18:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `user_id` int(30) NOT NULL,
  `seller_id` int(30) NOT NULL,
  `total_amount` double NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `card_number` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `code`, `user_id`, `seller_id`, `total_amount`, `delivery_address`, `card_number`, `status`, `date_created`, `date_updated`) VALUES
(14, '202307-00001', 7, 6, 6490, 'Banglore,\r\nBanglore,\r\nBanglore', '123456789102', 4, '2023-07-08 18:49:39', '2023-07-08 18:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `seller_id` int(30) DEFAULT NULL,
  `category_id` int(30) DEFAULT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `seller_id`, `category_id`, `name`, `description`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(12, 6, 12, 'WALLETIN Dark Green Artificial/PU Leather Wallet', '&lt;h1 id=&quot;title&quot; class=&quot;a-size-large a-spacing-none&quot; style=&quot;padding: 0px; margin-right: 0px; margin-left: 0px; text-rendering: optimizelegibility; color: rgb(15, 17, 17); font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; margin-bottom: 0px !important; font-size: 24px !important; line-height: 32px !important;&quot;&gt;&lt;span id=&quot;productTitle&quot; class=&quot;a-size-large product-title-word-break&quot; style=&quot;text-rendering: optimizelegibility; word-break: break-word; line-height: 32px !important; font-size: 14px;&quot;&gt;WALLETIN Dark Green Artificial/PU Leather Wallet for Men - 02 Currency Compartments 02 Hidden Pocket 3 Credit Card Slots 01 Coin Pocket&lt;/span&gt;&lt;/h1&gt;&lt;h1 id=&quot;title&quot; class=&quot;a-size-large a-spacing-none&quot; style=&quot;padding: 0px; margin-right: 0px; margin-left: 0px; text-rendering: optimizelegibility; color: rgb(15, 17, 17); font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; margin-bottom: 0px !important; font-size: 24px !important; line-height: 32px !important;&quot;&gt;&lt;span id=&quot;productTitle&quot; class=&quot;a-size-large product-title-word-break&quot; style=&quot;text-rendering: optimizelegibility; word-break: break-word; line-height: 32px !important;&quot;&gt;&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; padding: 0px; font-size: 14px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;Closer: Snap&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;Number of Compartments: 2&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;Size &amp;amp; Fit: Height 9cm, Width 2cm&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;Material &amp;amp; Care: Wipe with a clean, dry cloth to remove dust&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/span&gt;&lt;/h1&gt;', 199, 'uploads/products/12_64a7054dd5ba2.jpg?v=1688667469', 1, 0, '2023-07-06 23:47:49', '2023-07-06 23:47:49'),
(13, 6, 12, 'SAMTROH Black Bifold Wallet for Men', '&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;Closer: Snap&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;Number of Compartments: 2&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;Size &amp;amp; Fit: Height 9cm, Width 2cm&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;Material &amp;amp; Care: Wipe with a clean, dry cloth to remove dust&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;', 249, 'uploads/products/13_64a706f26ac38.jpg?v=1688667890', 1, 0, '2023-07-06 23:54:20', '2023-07-06 23:55:26'),
(14, 6, 12, 'Elios Womens Synthetic Long Zipper Phone Wallet And Card Organizer', '&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;MATERIAL: Made from Premium Quality Soft and Durable Pu-Leather and Non-Woven Fabrics. Specially Designed and Manufactured By Skilled Handicraft Men for Those Who Do Not Like Animal Leather Product&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;PRACTICAL STRUCTURE: 11 Credit Card Slots, 1, Photo Slot, 2 Sim Card/Memory Card Slots, 3 Open Pocket,1 Zip Closure&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;COMFORTABLE &amp;amp; SAFE: Clear layout and bi-fold design is made for you to keep your things organised well and easy to use. Zipper and closure is designed for the safety of your properties&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;Perfect Gift: A perfect gift for yourself or for your friends, portable and fashionable. It is also a phone bag&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;Style Name: Contemporary&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;', 584, 'uploads/products/14_64a7074694bab.jpg?v=1688667974', 1, 0, '2023-07-06 23:56:14', '2023-07-06 23:56:14'),
(15, 6, 13, 'LONDON ALLEY Elk Vintage Brown Mens Leather Wallet.', '&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;HIGH QUALITY LEATHER】: Made from top layer Genuine Leather. Gift Box included!&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;【HANDCRAFTED】: Tough stitching. Hand made by professional artisans, a beautifully crafted wallet that will only get better with age.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;【MINIMALIST DESIGN】: Slim but roomy design. Perfect for daily use, working, shopping, travelling and more. An ideal gift for gentlemen on Birthday, Anniversary, Father&#039;s day, Rakhi Gift, Wedding Gifts, and all other Occasion. Product Feature(s)&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;【DISCLAIMER】 : Dear customer, this wallet is made from oil wax based leather, hence one of its characteristics is that it is prone to scratches but the perk is that the scratches are not permanent, with friction in use or rubbing with a cloth, scratches will gradually fade away. We adhere to the principle of quality first, and hope to find the most cost-effective products to bring to our customers.&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;', 499, 'uploads/products/15_64a7079c0777f.jpg?v=1688668060', 1, 0, '2023-07-06 23:57:40', '2023-07-06 23:57:40'),
(16, 6, 13, 'Genuine Leather Unisex Handmade Pure Leather Material Travel Bag Holdall Duffel Flight Cabin Bag', '&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;Crafted from tough real Leather, which takes hits well and looks even better with age.which is the most expensive and toughest part. The distinguishing feature of this leather is that the leather may have wrinkles, scratches that are inherent characteristics.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;Outer Material: Handmade Real Leather Bag with Vintage style fittings &amp;amp; accessories, multiple inner pockets/ partitions, adjustable shoulder straps&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;Your handmade leather backpack is perfectly sized to accommodate all your stuff for a short leisure trip | Ideal for camping, trekking, hiking, travel&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;These Bags are not colored or dyed | Natural texture shades are given through a traditional Indian process using Ayurvedic Oils and Sun tanning, so color of each individual Bag will be Unique and differ from the one pictured here&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;These are Vintage handmade leather bags and require gentle homely care from time to time to maintain a long life | These Bags are heavy duty Rugged &amp;amp; Stiff. They get softer as you use them on regular basis | For their upkeep, can use Wax Polish/ Moisturizing Oil/ Leather Conditioner which shall make them even softer and give them a beautiful darker Chocolaty Brown look&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;', 1849, 'uploads/products/16_64a707c773aaf.jpg?v=1688668103', 1, 0, '2023-07-06 23:58:23', '2023-07-06 23:58:23'),
(17, 6, 16, 'MOKOBARA The Briefcase - 15.6 Blue Laptop Messenger Bag for Men & Women', '&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;CRAFTED WITH INDUSTRY BEST PREMIUM MATERIALS: Materials: Vegan leather and nylon fabric, Casing: Soft, Colour: Gray, Water resistant: Yes&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;PADDED LAPTOP COMPARTMENT AND MAXED OUT STORAGE: Dimension: 40 x 8 x 29.5 cm, Capacity: 9.5L, Fits up to a 16&rdquo; laptop&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;MOST FEATURE RICH BACKPACK: Vegan leather trims, Hidden passport/phone pocket on front and back, Luggage sleeve&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;DETACHABLE BELT: Strap it on your shoulder or carry it your way&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;MORE REASONS TO LOVE YOUR MOKOBARA: Warranty type: 12 Months, Register warranty on (mokobara.com/warranty), get in touch with us&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;', 5999, 'uploads/products/17_64a70817e45a5.jpg?v=1688668183', 1, 0, '2023-07-06 23:59:43', '2023-07-06 23:59:43'),
(18, 6, 16, 'Gear Vintage2 Anti Theft Faux Leather 18 cms Tan Laptop Backpack', '&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Care Instructions: Hand Wash Only&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Outer material: synthetic, color: Tan&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Waterproof, Capacity: 27 liters; Weight: 600 grams; Dimensions: 48 cms x 33 cms x 18 cms (LxWxH)&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Number of compartments: 2; Laptop compatibility: yes, laptop size: 16strap type: adjustable&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Warranty type: Manufacturer; one year warranty against all manufacturing defects, workmanship, assistance during time of claim of warranty&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Closure Type: Zipper; Special Features: Back Padding; Age Range Description: Adult; Pocket Description: Utility Pocket&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Concealed quick access Pockets on back panel ,Adjustable Anti sweat padded Shoulder straps , Padded Laptop sleeve,3 External Pockets, Padded Back Panel Cushioned with Anti Sweat Fabric,Embedded Organizer , USB and Headphone cable slot .&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Concealed quick access Pockets on back panel ,Adjustable Anti sweat padded Shoulder straps , Padded Laptop sleeve,3 External Pockets, Padded Back Panel Cushioned with Anti Sweat Fabric,Embedded Organizer , USB and Headphone cable slot .&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;', 880, 'uploads/products/18_64a7085877a39.jpg?v=1688668248', 1, 0, '2023-07-07 00:00:48', '2023-07-07 00:00:48'),
(19, 6, 17, 'URBAN FOREST Leather Belt for Men', '&lt;p&gt;&lt;div id=&quot;provenanceCertifications_feature_div&quot; class=&quot;celwidget&quot; data-feature-name=&quot;provenanceCertifications&quot; data-csa-c-type=&quot;widget&quot; data-csa-c-content-id=&quot;provenanceCertifications&quot; data-csa-c-slot-id=&quot;provenanceCertifications_feature_div&quot; data-csa-c-asin=&quot;&quot; data-csa-c-is-in-initial-active-row=&quot;false&quot; data-csa-c-id=&quot;nysoa7-32hchi-mroxcw-yft59&quot; data-cel-widget=&quot;provenanceCertifications_feature_div&quot; style=&quot;box-sizing: border-box; color: rgb(15, 17, 17); font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;/div&gt;&lt;div id=&quot;globalStoreInfoBullets_feature_div&quot; class=&quot;celwidget&quot; data-feature-name=&quot;globalStoreInfoBullets&quot; data-csa-c-type=&quot;widget&quot; data-csa-c-content-id=&quot;globalStoreInfoBullets&quot; data-csa-c-slot-id=&quot;globalStoreInfoBullets_feature_div&quot; data-csa-c-asin=&quot;&quot; data-csa-c-is-in-initial-active-row=&quot;false&quot; data-csa-c-id=&quot;qmqv38-3vapwk-xb6x5h-r8zhnz&quot; data-cel-widget=&quot;globalStoreInfoBullets_feature_div&quot; style=&quot;box-sizing: border-box; color: rgb(15, 17, 17); font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;/div&gt;&lt;div id=&quot;andonCord_feature_div&quot; class=&quot;celwidget&quot; data-feature-name=&quot;andonCord&quot; data-csa-c-type=&quot;widget&quot; data-csa-c-content-id=&quot;andonCord&quot; data-csa-c-slot-id=&quot;andonCord_feature_div&quot; data-csa-c-asin=&quot;&quot; data-csa-c-is-in-initial-active-row=&quot;false&quot; data-csa-c-id=&quot;cvbsex-e7v37m-j349mc-5bmqx7&quot; data-cel-widget=&quot;andonCord_feature_div&quot; style=&quot;box-sizing: border-box; color: rgb(15, 17, 17); font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;/div&gt;&lt;div id=&quot;edpIngress_feature_div&quot; class=&quot;celwidget&quot; data-feature-name=&quot;edpIngress&quot; data-csa-c-type=&quot;widget&quot; data-csa-c-content-id=&quot;edpIngress&quot; data-csa-c-slot-id=&quot;edpIngress_feature_div&quot; data-csa-c-asin=&quot;&quot; data-csa-c-is-in-initial-active-row=&quot;false&quot; data-csa-c-id=&quot;5xm2ro-mh7lu9-5cchpq-zb3jwb&quot; data-cel-widget=&quot;edpIngress_feature_div&quot; style=&quot;box-sizing: border-box; color: rgb(15, 17, 17); font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;/div&gt;&lt;div id=&quot;heroQuickPromo_feature_div&quot; class=&quot;celwidget&quot; data-feature-name=&quot;heroQuickPromo&quot; data-csa-c-type=&quot;widget&quot; data-csa-c-content-id=&quot;heroQuickPromo&quot; data-csa-c-slot-id=&quot;heroQuickPromo_feature_div&quot; data-csa-c-asin=&quot;&quot; data-csa-c-is-in-initial-active-row=&quot;false&quot; data-csa-c-id=&quot;uxmnzs-y10k6i-sfzyzq-56zyhl&quot; data-cel-widget=&quot;heroQuickPromo_feature_div&quot; style=&quot;box-sizing: border-box; color: rgb(15, 17, 17); font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;div id=&quot;hero-quick-promo-grid_feature_div&quot; style=&quot;box-sizing: border-box;&quot;&gt;&lt;div id=&quot;hero-quick-promo&quot; class=&quot;a-row a-spacing-medium&quot; style=&quot;box-sizing: border-box; width: 493.375px; margin-bottom: 0px !important;&quot;&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/p&gt;&lt;div id=&quot;featurebullets_feature_div&quot; class=&quot;celwidget&quot; data-feature-name=&quot;featurebullets&quot; data-csa-c-type=&quot;widget&quot; data-csa-c-content-id=&quot;featurebullets&quot; data-csa-c-slot-id=&quot;featurebullets_feature_div&quot; data-csa-c-asin=&quot;&quot; data-csa-c-is-in-initial-active-row=&quot;false&quot; data-csa-c-id=&quot;il0r3f-ctes17-jo7djo-6v544h&quot; data-cel-widget=&quot;featurebullets_feature_div&quot; style=&quot;box-sizing: border-box; color: rgb(15, 17, 17); font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;&quot;&gt;&lt;div id=&quot;feature-bullets&quot; class=&quot;a-section a-spacing-medium a-spacing-top-small&quot; style=&quot;box-sizing: border-box; margin-top: 8px !important; margin-bottom: 0px;&quot;&gt;&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;box-sizing: border-box; margin: 0px 0px 0px 18px; color: rgb(15, 17, 17); padding: 0px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;box-sizing: border-box; color: rgb(15, 17, 17); overflow-wrap: break-word; display: block;&quot;&gt;Care Instructions: non washable&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;box-sizing: border-box; color: rgb(15, 17, 17); overflow-wrap: break-word; display: block;&quot;&gt;Colour: Black&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;box-sizing: border-box; color: rgb(15, 17, 17); overflow-wrap: break-word; display: block;&quot;&gt;Size: Free Size&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;box-sizing: border-box; list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;box-sizing: border-box; color: rgb(15, 17, 17); overflow-wrap: break-word; display: block;&quot;&gt;Material: Leather&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;&lt;/div&gt;', 499, 'uploads/products/19_64a708a1185cb.jpg?v=1688668321', 1, 0, '2023-07-07 00:02:01', '2023-07-07 00:02:01'),
(20, 6, 17, 'Contacts Mens Genuine Leather Auto lock Buckle Belt', '&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Care Instructions: Non Washable&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;No More Holes- CONTACTS auto lock buckle belt provides unique adjustments for an extremely comfortable fit. Easy removable buckle allows you to use a simple scissor to cut the belt to your ideal size to give a primmer and custom-tailored appearance join the CONTACTS belt fashion mission and our awesome belts with removable buckles&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Timeless Elegance- Elegant and smooth, this auto lock buckle is a great example of refined luxury for the ultra modern metro-man.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Maximum Durability- Presenting the perfect look of a fine quality designer belt for men, complemented with a highly fashionable stylish buckle that is elegantly designed with class&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Occasions- Casual, formal, party wear. Recommended for men and boys. Best product for daily wear. Put this belt with jean or with formal, it will enhance your overall appearance&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Gift Box- Make a big impression by gifting this fashionable men&rsquo;s belt to your loved ones. Belt is enclosed in a lovely, attractive gift box&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Disclaimer: All our products are made from genuine leather. Due to the nature of natural leather, there may be slight variations in color and texture between pictures &amp; actual product. Also color may slightly vary due to lighting on the photography&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;', 499, 'uploads/products/20_64a709d02ea5a.jpg?v=1688668624', 1, 0, '2023-07-07 00:04:03', '2023-07-07 00:07:04'),
(21, 6, 15, 'SACCI MUCCI Womens Rainbow Sling Bag, Handmade Bags for Females', '&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Beautiful colors and carefully crafted to be functional - It has beautiful print and ample space to keep your phone, card, cash, cosmetics and other essentials you need to carry on your day out, it will give you maximum storage without compromising your style statement.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;It is featured with adjustable strip which provides comfort &amp;amp; convenience while walking or travelling and top zip closure for easy opening &amp;amp; closing of the bag.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;This pretty sling bag has single large compartment storage space for carrying all your daily essentials. The compartment is also featured with zippered pocket inside to keep your card and cash separate and the bag manufactured using high grade faux leather and Pure Indian Cotton Canvas material.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;This cute trendy cross body bag is featured with wide bottom base or footed bottom with gold metal logo and fittings you can complement your contemporary look with this stylish sling/cross body bag. It is perfect handbag to carry at work or for casual and party look.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Handcrafted/Handprinted- Each products are unique.&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;', 421, 'uploads/products/21_64a70969437f9.jpg?v=1688668521', 1, 0, '2023-07-07 00:05:21', '2023-07-07 00:05:21'),
(22, 6, 15, 'Women Fashionable Handbags for Women | Material Faux Leather | Female Stylish Top-handle', '&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;𝗦𝘁𝘆𝗹𝗲 𝗮𝗻𝗱 𝗙𝗮𝘀𝗵𝗶𝗼𝗻 : This product is design for modern people who wants to change with the world. This product will be add on for your personality.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Applicable : Perfect for the Trips, Vacation, Travel, School, Shopping or any other kind of Leisure Activities.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;𝗙𝗲𝗮𝘁𝘂𝗿𝗲𝘀 : handbags for women Sets of 5 piece of Bags with Zipper Closure, Adjustable Strap with Solid Finishing.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;𝗠𝗮𝘁𝗲𝗿𝗶𝗮𝗹 : Pure PU Leather material.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;𝗣𝗮𝗰𝗸𝗮𝗴𝗲 𝗜𝗻𝗰𝗹𝘂𝗱𝗲𝘀 : Set Of Matching 5 Bags (1 Handbag Satchel, 1 Clutch, 1 Sling Bag , 1 Wrist Pouch And 1 Card Holder)&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;', 1629, 'uploads/products/22_64a7099b47b51.jpg?v=1688668571', 1, 0, '2023-07-07 00:06:11', '2023-07-07 00:06:11'),
(23, 6, 15, 'VASCHY Mini Backpack Purse for Women, Fashion Faux Leather Buckle', '&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Care Instructions: Hand Wash Only&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Warranty not applicable for this product&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;', 6763, 'uploads/products/23_64a70a13131fb.jpg?v=1688668691', 1, 0, '2023-07-07 00:08:11', '2023-07-07 00:08:11'),
(24, 6, 14, 'Contacts Mens Genuine Leather RFID Blocking Wallet', '&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;Disclaimer: All Our Products Are Made From Genuine Leather. Due To The Nature Of Natural Leather, There May Be Slight Variations In Color And Texture Between Pictures &amp;amp; Actual Product. Also Color May Slightly Vary Due To Lighting On The Photography.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;Rfid Theft Protection : In This Growing Digital World, The Money In Your Bank Is At Constant Risk From Unwanted Rfid Scanners Used By Thieves These Days. Contacts Rfid Blocking Wallet Can Perfectly Block Unwanted Rfid Scanners As It Comes With Rfid Blocking Mechanism That Normally Prevents Unauthorized Access To Your Credit/Debit Or Even Metro Or Id Cards.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;Construction: This Wallet Is Made Of Genuine Leather. A Man&#039;S Wallet Should Be Contemporary, Masculine And Durable. Crafted With Top Notch Genuine Leather, Tough Stitching.Hand Made By Professional Artisans, Beautifully Crafted Wallet That Will Only Get Better With Age. This Wallet Looks Great, Offers A Slim, Lightweight Design, And Goes Great With Jeans Or A Suit.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;Gifting Happiness: It Will Be Presented In An Appealing Gift Pouch, Making It As A Ideal Gift. Gifting Is Known To Be One Of The Five Languages Of Love. There Is No Individual In This World Who Does Not Feel The Love And Affection Of The Sender When They Receive A Gift.&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;', 996, 'uploads/products/24_64a70a584a0fd.jpg?v=1688668760', 1, 0, '2023-07-07 00:09:20', '2023-07-07 00:09:20'),
(25, 6, 14, 'AirCase Laptop Bag Backpack Case Pouch for Laptop Backpack for Men', '&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Innovative Design: AirCase Laptop Backpack is made of Premium Vegan Leather for your 15.6 Inch Laptop. This Laptop Backpack has 2 Front Pocket and 2 Main Compartment for Laptop, Tablet and other Main compartment for wallets dairy, clothes, etc. There is two way Cortical Tail Zipper with leather pull tail, Fashionable and Novel, keeping up with the current trend.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Large Storage: There is 2 Main Compartment One for 15.6 inch Laptop, Tablet with a secure Velcro closure and other for main compartment for your other belonging like Cloth, Wallet, Book, Diary, etc. There is also 2 front zipper pocket for Mobile, Charger, Power Adapter, Cable, Power Bank, Keys etc.convenient to carry at school college office travelling for students boys girls&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Light weight &amp;amp; Durable: It is made of Premium Vegan Leather for 15.6 inch laptop. Ruggedized water-resistant base helps to protect from the elements. Water Resistant Base which protect your belonging from getting wet. waterproof latest smart stylish spacious rucksack luggage tourist travel bagpack.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Shoulder Straps: Breathable Mesh Padding at back which is design for back relief and shoulder straps for extra comfort with adjustable side straps for a better fit.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Specifications:- Work with -15.6&quot; Laptops and Under, CAPACITY- 22L, DIMENSIONS &ndash; 46-cm X 29-cm X 19-cm, WEIGHT - 0.58 kg, WARRANTY &ndash; 1 Year under Manufacturing Defect Only.&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;', 929, 'uploads/products/25_64a70a8a5207d.jpg?v=1688668810', 1, 0, '2023-07-07 00:10:10', '2023-07-07 00:10:10'),
(26, 6, 18, 'Language Genuine Crust Leather Shoe for Men Marchio Derby Tan Colour', '&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Sole: Leather&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Closure: Pull On&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Fit Type: Regular&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Shoe Width: Medium&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Language Genuine Crust Leather Shoe&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Genuine Crust Leather Shoe&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Genuine T Unit Soles&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;div class=&quot;a-row a-expander-container a-expander-inline-container&quot; style=&quot;width: 424px; color: rgb(15, 17, 17); font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;div aria-expanded=&quot;true&quot; class=&quot;a-expander-content a-expander-extend-content a-expander-content-expanded&quot; style=&quot;overflow: hidden;&quot;&gt;&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-none&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; padding: 0px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Soles with Grip&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Leather lined non-removable cushioned footbed&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;&lt;/div&gt;', 6490, 'uploads/products/26_64a70adcdaca7.jpg?v=1688668892', 1, 0, '2023-07-07 00:11:32', '2023-07-07 00:11:32'),
(27, 6, 18, 'Language Genuine Crust Leather Shoe for Men Fisher Derby Tan Colour', '&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Sole: Leather&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Closure: Pull On&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Fit Type: Regular&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Shoe Width: Medium&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Language Genuine Crust Leather Shoe&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Genuine Crust Leather Shoe&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Genuine T Unit Soles&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;div class=&quot;a-row a-expander-container a-expander-inline-container&quot; style=&quot;width: 424px; color: rgb(15, 17, 17); font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;div aria-expanded=&quot;true&quot; class=&quot;a-expander-content a-expander-extend-content a-expander-content-expanded&quot; style=&quot;overflow: hidden;&quot;&gt;&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-none&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; padding: 0px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Soles with Grip&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Leather lined non-removable cushioned footbed&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;&lt;/div&gt;', 6490, 'uploads/products/27_64a70b190905c.jpg?v=1688668953', 1, 0, '2023-07-07 00:12:33', '2023-07-07 00:12:33');
INSERT INTO `product_list` (`id`, `seller_id`, `category_id`, `name`, `description`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(28, 6, 18, 'Language Genuine Crust Leather Shoe for Men Sigils Monk Black Colour', '&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Sole: Leather&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Closure: Pull On&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Fit Type: Regular&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Shoe Width: Medium&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Language Genuine Crust Leather Shoe&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Genuine Crust Leather Shoe&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Genuine T Unit Soles&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;div class=&quot;a-row a-expander-container a-expander-inline-container&quot; style=&quot;width: 424px; color: rgb(15, 17, 17); font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;div aria-expanded=&quot;true&quot; class=&quot;a-expander-content a-expander-extend-content a-expander-content-expanded&quot; style=&quot;overflow: hidden;&quot;&gt;&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-none&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; padding: 0px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Soles with Grip&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot; style=&quot;overflow-wrap: break-word; display: block;&quot;&gt;Leather lined non-removable cushioned footbed&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;/div&gt;&lt;/div&gt;', 6490, 'uploads/products/28_64a70b3b71698.jpg?v=1688668987', 1, 0, '2023-07-07 00:13:07', '2023-07-07 00:13:07'),
(29, 6, 19, 'Leather Men Bi-Fold Wallet', '&lt;ul class=&quot;a-unordered-list a-vertical a-spacing-mini&quot; style=&quot;margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &amp;quot;Amazon Ember&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;[SLIM COMPACT &amp;amp; SPACIOUS]:- wallets for men stylish leather branded has been designed slim to perfectly fit your pockets. It is compact and lightweight. It measures 12 cm x 9.5 cm x 2.5 CM to perfectly fits your pocket and comes with a total of 12 compartments (8 credit card. 1 coin compartment, 2 currency compartment &amp;amp; 1 ID compartment) to fit in your cards, cash and currency, coins and bills. Our purse for men comes wrapped in a beautiful black gift box.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;[RFID BLOCKING TECHNOLOGY FOR SAFETY AND PRIVACY]:- Our RFID wallets for men are created using RFID blocking technology that protects your valuable personal data. RFID refers to Radio Frequency Identification chips that have personal information on them which can be skimmed using RFID Scanners. Credit Cards, ID Cards etc have these chips. Our wallets are properly constructed to prevent inappropriate RFID scanners from skimming your personal information for inappropriate purposes.&lt;/span&gt;&lt;/li&gt;&lt;li class=&quot;a-spacing-mini&quot; style=&quot;list-style: disc; overflow-wrap: break-word; margin: 0px;&quot;&gt;&lt;span class=&quot;a-list-item&quot;&gt;[LUXURY PURE NAPPA LEATHER QUALITY AT AN AFFORDABLE PRICE]:- Brown Bear leather wallets for men branded is made of superior quality pure Nappa Leather which gives it a luxury look. The thorough double-stitching throughout the wallet is truly one of a kind. We provide these purses for men at a very affordable price with the very best quality and boasts of being the best gifts for men. This wallet for man will be with you for years to come.&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;', 1971, 'uploads/products/29_64a70b872b4f4.jpg?v=1688669063', 1, 0, '2023-07-07 00:14:23', '2023-07-07 00:14:23');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `user_id`, `description`) VALUES
(18, 27, 7, 'Nice Product');

-- --------------------------------------------------------

--
-- Table structure for table `seller_list`
--

CREATE TABLE `seller_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `shop_type_id` int(30) NOT NULL,
  `shop_name` text NOT NULL,
  `shop_owner` text NOT NULL,
  `contact` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seller_list`
--

INSERT INTO `seller_list` (`id`, `code`, `shop_type_id`, `shop_name`, `shop_owner`, `contact`, `username`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(6, '202307-00001', 7, 'Shop1', 'Owner1', '9888888888', 'shop1', 'd21aa1b1b0f83209cc622551e9ac0334', 'uploads/sellers/64a6fef6afad9.jpg?v=1688665846', 1, 0, '2023-07-06 23:20:46', '2023-07-08 19:34:06');

-- --------------------------------------------------------

--
-- Table structure for table `shop_type_list`
--

CREATE TABLE `shop_type_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shop_type_list`
--

INSERT INTO `shop_type_list` (`id`, `name`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(6, 'Small', 1, 0, '2023-07-06 23:03:41', NULL),
(7, 'Midium', 1, 0, '2023-07-06 23:03:50', NULL),
(8, 'Large', 1, 0, '2023-07-06 23:04:46', NULL),
(9, 'Industry', 1, 0, '2023-07-06 23:04:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Multi-Seller Online Leather Management System'),
(6, 'short_name', 'MSOLMS'),
(11, 'logo', 'uploads/1688664797_64a6fadd2b913.png?v=1688664797'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1688664797_64a6fadd2c37f.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_list`
--

CREATE TABLE `user_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_list`
--

INSERT INTO `user_list` (`id`, `code`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(7, '202307-00001', 'User', '', '1', 'Male', '9999999999', 'Banglore,\r\nBanglore,\r\nBanglore', 'user@user.com', '6edf26f6e0badff12fca32b16db38bf2', 'uploads/users/64a6fd753365e.jpg?v=1688665461', 1, 0, '2023-07-06 23:14:21', '2023-07-06 23:14:21'),
(8, '202307-00002', 'User', '', '2', 'Male', '9999999992', 'Shimoga,\r\nShimoga,\r\nShimoga', 'user2@user.com', '6edf26f6e0badff12fca32b16db38bf2', 'uploads/users/64a967b2e2d78.jpg?v=1688823730', 1, 0, '2023-07-08 19:12:10', '2023-07-08 19:12:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`seller_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`user_id`),
  ADD KEY `vendor_id` (`seller_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`seller_id`),
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_list`
--
ALTER TABLE `seller_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_type_id` (`shop_type_id`);

--
-- Indexes for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_list`
--
ALTER TABLE `user_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `seller_list`
--
ALTER TABLE `seller_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_list`
--
ALTER TABLE `user_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_list`
--
ALTER TABLE `category_list`
  ADD CONSTRAINT `category_list_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `seller_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seller_list`
--
ALTER TABLE `seller_list`
  ADD CONSTRAINT `seller_list_ibfk_1` FOREIGN KEY (`shop_type_id`) REFERENCES `shop_type_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
