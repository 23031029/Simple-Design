-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2024 at 06:06 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `c237_idweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `orderId` int(5) NOT NULL,
  `furnitureId` int(10) NOT NULL,
  `userId` varchar(200) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(5) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`orderId`, `furnitureId`, `userId`, `name`, `price`, `quantity`, `image`) VALUES
(25, 1, 'name@gmail.com', 'Verona Chaise Lounge', 1200, 3, 'Verona.png'),
(27, 8, 'name@gmail.com', 'Executive Office Chair', 299, 9, 'ExecutiveOfficeChair.png'),
(28, 3, 'name@gmail.com', 'The Aspen Dining Table', 899, 1, 'aspen.png'),
(29, 9, 'Jia23@gmail.com', 'Contemporary Coffee Table', 449, 1, 'ContemporaryCoffeeTable.png'),
(30, 2, 'Jia23@gmail.com', 'The Aurora Pendant Light', 350, 1, 'auren.png');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(100) NOT NULL,
  `name` varchar(500) NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` int(10) NOT NULL,
  `housetype` varchar(50) NOT NULL,
  `floorplan` varchar(10000) DEFAULT NULL,
  `design` varchar(50) NOT NULL,
  `service` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contactId`, `name`, `email`, `contact`, `housetype`, `floorplan`, `design`, `service`) VALUES
(12, 'Ser Jia', '23031029@myrp.edu.sg', 12345678, 'hdb', 'IMG_1071.JPG', 'Wabi-Sabi', 'Basic ID consultant');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `deliveryId` int(5) NOT NULL,
  `userId` varchar(200) NOT NULL,
  `postalcode` int(7) NOT NULL,
  `area` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `unit` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`deliveryId`, `userId`, `postalcode`, `area`, `address`, `unit`) VALUES
(5, 'name@gmail.com', 1234567, 'Orchard', 'dvsffbsr', '10-287');

-- --------------------------------------------------------

--
-- Table structure for table `design`
--

CREATE TABLE `design` (
  `designId` int(11) NOT NULL,
  `style` text NOT NULL,
  `color_scheme` text NOT NULL,
  `material` varchar(1000) NOT NULL,
  `image` varchar(10000) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `design`
--

INSERT INTO `design` (`designId`, `style`, `color_scheme`, `material`, `image`, `description`) VALUES
(1, 'Scandinavian', 'Whites, grays, pale blues, and soft pastels.', 'Light woods like pine and birch, natural fibers such as wool and linen, smooth surfaces like polished wood and matte finishes.', 'scandinavian.png', 'Known for its simplicity, minimalism, and functionality, Scandinavian design often features clean lines, natural materials, and plenty of natural light.'),
(2, 'Modern', 'Neutrals like white, beige, gray, with occasional bold accents of black or primary colors.', 'Glass, metal, polished concrete, leather, and plastics.', 'Contemporary.png', 'Emphasizes sleek lines, open spaces, and a minimalist approach. It often incorporates industrial materials like metal and glass.\r\n'),
(3, 'Industrial', 'Neutral tones like grays, browns, and blacks with pops of metallic accents.', 'Exposed brick, concrete, reclaimed wood, metal (especially steel and iron), and distressed finishes.', 'Industrial.png', 'Inspired by old factories and industrial spaces, this style features raw, unfinished textures, exposed brick or concrete walls, and utilitarian objects.'),
(4, 'Bohemian', 'Vibrant and eclectic, with jewel tones like deep purples, blues, and greens alongside earthy hues like terracotta and ochre.', 'Natural materials like rattan, wicker, bamboo, and colorful textiles from around the world.', 'bohemian.png', 'Reflects a carefree and artistic lifestyle, with layered textiles, mismatched furniture, and global influences. It celebrates individuality and creativity.\r\n'),
(5, 'Minimalist', 'Predominantly whites, blacks, and grays with occasional touches of primary colors or pastels.', 'White or light-colored woods, metals like stainless steel, and glass.', 'minimalism.png', 'Characterized by simplicity and functionality, minimalist design focuses on essential elements, clean spaces, and a sense of calmness and order.');

-- --------------------------------------------------------

--
-- Table structure for table `enquires`
--

CREATE TABLE `enquires` (
  `equiresId` int(5) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `type` text NOT NULL,
  `orderId` int(10) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `furniture`
--

CREATE TABLE `furniture` (
  `furnitureId` int(11) NOT NULL,
  `name` text NOT NULL,
  `category` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `description` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `material` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `furniture`
--

INSERT INTO `furniture` (`furnitureId`, `name`, `category`, `price`, `description`, `quantity`, `image`, `material`) VALUES
(1, 'Verona Chaise Lounge', 'Living Room', 1200, 'The Verona Chaise Lounge combines contemporary design with classic comfort. Featuring a sleek, low-profile frame and plush cushioning, this chaise lounge is perfect for relaxing in style. Upholstered in high-quality, stain-resistant fabric, it comes in a variety of colors to match any décor. The gently sloping backrest and extended seat provide excellent support for your back and legs, making it an ideal addition to your living room or reading nook.', 22, 'Verona.png', 'Plush velvet upholstery with a hardwood frame'),
(2, 'The Aurora Pendant Light', 'Lighting', 350, 'The Aurora Pendant Light is a stunning addition to any modern or contemporary space. This elegant fixture features a sleek, brushed nickel finish and a frosted glass shade that diffuses light beautifully. Perfect for dining areas, kitchen islands, or entryways, the Aurora Pendant Light provides both style and functionality. Its adjustable height allows for customized installation, making it a versatile choice for various ceiling heights.', 6, 'auren.png', 'Metal frame with frosted glass shade'),
(3, 'The Aspen Dining Table', 'Dining Room', 899, ' The Aspen Dining Table is a blend of rustic charm and modern elegance. Crafted from solid oak wood with a natural finish, its sturdy construction ensures durability while adding warmth to any dining room. The table features clean lines and a simple, rectangular design, complemented by subtly tapered legs for a touch of sophistication. With enough space to comfortably seat six, the Aspen Dining Table is ideal for family gatherings or dinner parties.', 3, 'aspen.png', 'Solid oak with a natural finish'),
(4, 'The Serenity Upholstered Bed', 'Bedroom', 2500, 'The Serenity Upholstered Bed exudes luxury and comfort. Upholstered in soft, plush velvet fabric, this bed features a tall, button-tufted headboard that adds a touch of elegance to any bedroom. The sturdy wooden frame provides stability and support, while the slat system ensures proper mattress ventilation. Available in various colors to suit different decor styles, the Serenity Upholstered Bed brings a sense of tranquility and style to your sleeping sanctuary.', 13, 'serenity.png', 'Luxurious fabric upholstery with a wooden frame'),
(5, 'Larkspur Modern Sofa', 'Living Room', 1299, 'The Larkspur Modern Sofa is a sleek and stylish addition to any living room. It features a minimalist design with clean lines, a sturdy wooden frame, and plush cushions for maximum comfort. Upholstered in high-quality, durable fabric, this sofa comes in a variety of colors to match any decor. The Larkspur\'s deep seating and supportive back make it perfect for lounging or entertaining guests.', 19, 'Larkspur.png', 'Premium upholstery with a hardwood frame'),
(6, 'Modern Sofa', 'living room', 1199, 'Indulge in contemporary comfort with our Modern Sofa. Featuring plush, tufted upholstery in a versatile neutral tone, this sofa blends seamlessly into any living space. Its sleek silhouette and sturdy hardwood frame ensure durability, while the deep cushions provide ample support for relaxation. ', 15, 'mordern.png', 'Upholstered in high-quality leather with a hardwood frame.'),
(7, 'Rustic Dining Table', 'Dining Room', 699, 'Gather your family around our Rustic Dining Table, crafted from solid reclaimed wood with a rich, weathered finish. This table exudes charm and character, making each meal a rustic dining experience. Its sturdy construction and classic design ensure longevity, while the spacious tabletop accommodates family gatherings and dinner parties with ease.', 0, 'RusticDiningTable.png', 'Reclaimed wood with a weathered finish.'),
(8, 'Executive Office Chair', 'Office', 299, 'Elevate your workspace with our Executive Office Chair, designed for ultimate comfort and productivity. Upholstered in premium leatherette, this chair features ergonomic contours and adjustable settings to support your posture throughout the workday. The padded armrests and high back provide optimal lumbar support, promoting concentration and reducing fatigue.', 109, 'ExecutiveOfficeChair.png', 'Upholstered in premium leatherette with a metal base'),
(9, 'Contemporary Coffee Table', 'Living room', 449, 'Define your living room with our Contemporary Coffee Table, a stunning blend of glass and metal craftsmanship. The sleek, tempered glass top rests gracefully on a geometrically inspired metal base, adding a touch of modern elegance to your space. With its open design and minimalist appeal, this coffee table enhances the visual openness of any room while providing a practical surface for books, beverages, and decor.', 87, 'ContemporaryCoffeeTable.png', 'Tempered glass top with a metal base'),
(10, 'Vintage Armchair', 'Living Room', 549, 'Embrace nostalgia with our Vintage Armchair, a classic piece that combines timeless elegance with comfort. Upholstered in a floral pattern fabric and adorned with rolled arms, this armchair exudes vintage charm and sophistication. Its sturdy hardwood frame and plush cushioning provide exceptional comfort and durability, making it an ideal choice for reading corners or cozy sitting areas in traditional and eclectic interiors. ', 73, 'vintagearmchair.png', 'Upholstered in floral pattern fabric with a hardwood frame'),
(11, 'Scandinavian Sideboard', 'Others', 789, 'Organize in style with our Scandinavian Sideboard, a minimalist masterpiece that combines form and function effortlessly. Crafted from solid wood with a matte finish, this sideboard features clean lines and ample storage space, ideal for storing dinnerware, linens, and more. The sleek design and tapered legs embody Scandinavian design principles, making it a versatile addition to modern and Nordic-inspired interiors. Made from solid wood with a matte finish.', 7, 'scandside.png', ' solid wood with a matte finish');

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `portfolioId` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `style` varchar(200) NOT NULL,
  `type` varchar(100) NOT NULL,
  `duration` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `portfolio`
--

INSERT INTO `portfolio` (`portfolioId`, `name`, `address`, `style`, `type`, `duration`, `price`, `image`) VALUES
(1, 'John Doe', 'No address', 'Recycle/Upcycle, Furniture Fusion', 'Furniture making', '4 Weeks', 4000, 'portfolio1.png'),
(2, 'Jessica Chan', '123 Orchard Road\r\n#01-456\r\nSingapore 238879', 'Contemporary Design', 'Commercial Designing', '10 Months', 150000, 'portfolio2.png'),
(3, 'Sebestian Teo', '456 Serangoon Avenue 3\r\n#13-965\r\nSingapore 550456', 'Scandinavian Design', 'HDB', '5 Months', 13000, 'portfolio3.png'),
(4, 'John Doe', '789 Bukit Timah Road\r\n#04-716\r\nSingapore 269876', 'Wabi-Sabi Design', 'HDB', '8 Months', 20000, 'portfolio4.png');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `serviceId` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `additional` text DEFAULT NULL,
  `duration` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`serviceId`, `name`, `description`, `additional`, `duration`, `price`) VALUES
(1, 'Basic Interior Design Consultation', 'Our Basic Interior Design Consultation service provides expert advice on enhancing the aesthetics and functionality of your space. This package includes a one-time consultation where we discuss your design goals, review your space, and offer recommendations on color schemes, furniture placement, and decor. Ideal for those looking for professional guidance to kickstart their design project.', NULL, '1 hours', 'Free (For First) $200(For 2nd Consultation)'),
(2, 'Full-Service Interior Design', 'Our Full-Service Interior Design Consultation offers a comprehensive design solution from concept to completion. This service includes an initial consultation, space planning, color and material selection, furniture and decor sourcing, and project management. We handle every detail to transform your space into a beautifully designed, cohesive environment that reflects your style and needs.', NULL, '6-12 weeks (depending on project size and complexi', 'Starting at $2,500 (final price based on project s'),
(3, 'Bedroom MakeOvers', 'Transform your bedroom into a serene and stylish retreat with our Bedroom Makeover service. We focus on optimizing space, selecting soothing color palettes, and incorporating comfortable furnishings and decor. Whether you desire a cozy sanctuary or a luxurious escape, our design team will create a personalized bedroom that ensures relaxation and comfort.', '', '2-4 weeks', 'Starting at $1,000'),
(4, 'Speciality Design Services', 'Our Specialty Design Service caters to unique design needs and bespoke projects. Whether you\'re looking to create a themed room, a specialized home office, or a unique entertainment space, our team will provide innovative solutions tailored to your vision. We specialize in translating your distinct ideas into a one-of-a-kind space. This service includes concept development, sourcing unique materials, and custom installations to make your specialty project truly unique.', '', '4-8 weeks (depending on project requirements)', 'Starting at $1,500 (final price based on project s'),
(5, 'Custom Furniture Design', 'Enhance your interiors with our Custom Furniture service. We design and create bespoke furniture pieces that perfectly fit your space and style. From custom sofas and tables to unique cabinetry and built-ins, our craftsmanship ensures that each piece is both functional and aesthetically pleasing, adding a personalized touch to your home. This service includes design consultations, material selection, and detailed craftsmanship to ensure your furniture is a perfect match for your space.', '', '4-6 weeks (per piece)', 'Varies based on piece (starting at $500 per piece)'),
(6, 'Home Staging Services', 'Our Home Staging Services prepare your property for sale by creating an inviting and attractive environment that appeals to potential buyers. We strategically arrange furniture, decor, and accessories to highlight the home\'s best features and create a welcoming atmosphere. This service aims to maximize the property\'s market appeal and help it sell faster at the best possible price. Our staging experts provide comprehensive solutions, including decluttering, furniture rental, and styling to ensure your home makes a lasting impression on potential buyers.', NULL, '1-2 weeks', 'Starting at $1,200');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(200) NOT NULL,
  `password` varchar(30) NOT NULL,
  `deliveryId` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `password`, `deliveryId`) VALUES
('Jia23@gmail.com', '12345', NULL),
('name@gmail.com', '123456789', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `product` (`furnitureId`),
  ADD KEY `users` (`userId`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`deliveryId`),
  ADD KEY `user` (`userId`);

--
-- Indexes for table `design`
--
ALTER TABLE `design`
  ADD PRIMARY KEY (`designId`);

--
-- Indexes for table `enquires`
--
ALTER TABLE `enquires`
  ADD PRIMARY KEY (`equiresId`);

--
-- Indexes for table `furniture`
--
ALTER TABLE `furniture`
  ADD PRIMARY KEY (`furnitureId`);

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`portfolioId`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`serviceId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `orderId` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `deliveryId` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `design`
--
ALTER TABLE `design`
  MODIFY `designId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `enquires`
--
ALTER TABLE `enquires`
  MODIFY `equiresId` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `furniture`
--
ALTER TABLE `furniture`
  MODIFY `furnitureId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `portfolioId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `serviceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `product` FOREIGN KEY (`furnitureId`) REFERENCES `furniture` (`furnitureId`),
  ADD CONSTRAINT `users` FOREIGN KEY (`userId`) REFERENCES `user` (`email`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `user` FOREIGN KEY (`userId`) REFERENCES `user` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
