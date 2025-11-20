-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2025 at 01:29 AM
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
-- Database: `immnewsnetwork`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id` int(11) NOT NULL DEFAULT 0,
  `content` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `content`) VALUES
(0, 'Math, coding, and shitty memes! Welcome to this Notion page! 😸\r\nThis is a page of all kinds of resources, experiences and tips & tricks I collected. Most of them is about all kinds of different parts of Houdini, and you can always find something interesting here!\r\nI once learnt a lot about softwares like Substance Painter, Marvelous Designer, 3D Coat and so on, but I end up forgetting how to use them because I don’t often work with these tools. So taking notes, especially things I seldom use has become a significant task for me. Because of not taking notes, I’ve lost too much precious time.\r\nIn the beginning I wanted some of my friends and classmates put their precious notes here too, and we can communicate and discuss all these archives of knowledge. However, it seems that I’m the only one writing all the contents here…\r\nBut if you are interested, you can contact me at any time and I will invite you to this workspace! 😎\r\nAhh, I feel sick of all this loneliness lmao 😭 🕶️ 👌');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `articleid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(30) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `image` varchar(300) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `isfeature` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`articleid`, `title`, `author`, `content`, `image`, `likes`, `isfeature`) VALUES
(1, 'Homemade Raytracing Renderer with Vex', 'Xinyu (Robin) Cai', 'I used to make a very simple renderer in sop wrangle, and after the release of Copernicus in H20.5, I realized that I could manipulate pixels directly in a cop wrangle.\r\nDidn\'t really read any renderer theories. Most of these are figured out by myself, because I have a few years of sketching experience, and I know how dot product and some other math functions works.\r\nWhy do I do this? Because it\'s fun of course!', 'https://cdnb.artstation.com/p/assets/images/images/084/354/469/large/xinyu-robin-cai-snipaste-2025-01-07-15-48-27.jpg?1738163978', 1, 1),
(2, 'Moth to a Candle: Story and Storyboards', 'Xinyu (Robin) Cai', 'It was a totally normal day in October, 2022. I was so bored and suddenly a sparkle flashed through my mind, telling me like: hey hey why not making a short film? At that time I had a fire accident scene and a fully rigged and cloth-setuped character, so I just responded like: why not?I started my production before spending some time to draw storyboards. All I needed to do was animating, doing cloth, hair and pyro sims, rendering them out and compositing together.I did work on a few shots at the same time. Sometimes I was doing rendering tests for this shot when I was doing comping for another shot. 2 weeks passed and my film was almost done. After spending another week to adjust and tweak millions of small stuff, I could gladly claim that my film was finally out.Considering every school project I did there was unfinished and fizzled out, nay, I didn\'t wanna spend any more time to contribute to that miserable little college. So that\'s it. This was my glorious graduation project in my heart.', 'https://cdna.artstation.com/p/assets/images/images/080/076/426/large/xinyu-robin-cai-colorscript.jpg?1726601934', 1, 0),
(3, 'Moth to a Candle: Geo Techniques', 'Xinyu (Robin) Cai', 'I used a Draw Curve node to draw some simple tear lines. After some noise on position and pscale, a Carve node allowed me to animate tear lines, making them slide through Miss. Candleheart\'s face.\r\nI then extracted some polygons around her left eye, slightly extruded them and converted to vdb, and then some reshape and smooth process will finally result in organic tear shapes.\r\nFinally, I just needed a Point Deform node to fit the tears to the animation.', 'https://cdnb.artstation.com/p/assets/images/images/080/076/365/large/xinyu-robin-cai-1.jpg?1726601829', 0, 0),
(4, 'Cloth & Hair Simulation Pipeline of CLS', 'Xinyu (Robin) Cai', 'In September 2023, I joined Crash Landing Studio to do cloth & hair simulation for their stunning animation works, but as there were more and more shots to handle, I realized that I need to clean up my node network and make my pipeline more clear and efficient.\r\nBasically I did all of these to save my time. But of course, this pipeline isn’t build in a day. There are many versions and each update makes it better and handier to use.\r\nWell CLS is a place for volunteer artists (we don’t get salaries from that), and everyone has flexible schedules. So I guess I can post these docs publicly.', 'https://img.youtube.com/vi/T9DiPQO_0_k/maxresdefault.jpg', 0, 0),
(5, 'Time Management System', 'Xinyu (Robin) Cai', 'These days I\'m trying a new method of time management from Alexander Alexandrovich Lyubishchev, a Soviet entomologist and philosopher. I believe you heard about the 10,000 hours theory, and he spent about 6 years to reach this level multiple times in so many different areas. He never stopped writing journals since about 1912 for a single day, even with 2 world wars and the death of his son. He did so much in his life that could be a sum of multiple lifetimes.\r\nIt\'s basically writing down the time you spent on each task, and adjusting strategies & learning from statistics of every week, month, year, even every 5 years.\r\nCurrently I\'m writing everything in my Notion diaries and I wrote some codes to get key words of each line and calculate overall time on each task. Well, because I have so many things I want to do besides school stuff, and it\'s really clear that it allows me to do more things than before.', 'https://raw.githubusercontent.com/RobinEversunshine/Portfolio_Website/refs/heads/main/images/code.jpg', 0, 0),
(6, 'Moth to a Candle: Compositing', 'Xinyu (Robin) Cai', 'There weren’t really much techniques I used in the compositing part, for the most frequent things I did was grading, color correcting, adjusting values, color splitting (slight scale at red channel) and adding grains.\r\nHowever, the full process is highly compositing-based, which means I wound render one specific frame, test comping and adjust geo & render settings, then when the comping shows a decent result I will render the full animation out.\r\nI always split bg, ember and volumes like fire and mist into different layers for comping use, and sometimes I would split characters too, because they need noticeably more sampling than bg or volumes, especially the hair and reflecting stuff like Miss. Candleheart’s golden ribbon.\r\nMaybe I should consider removing some of the unused AOVs when rendering because the rendered exr files are extremely large, for about 30-50 mb per frame. My disk will burn out if I continue like this.', 'https://cdna.artstation.com/p/assets/images/images/080/076/390/large/xinyu-robin-cai-8.jpg?1726601879', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `personid` int(11) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`personid`, `fname`, `lname`) VALUES
(1, 'fname', 'lname'),
(2, 'fname2', 'lname2');

-- --------------------------------------------------------

--
-- Table structure for table `user-article`
--

CREATE TABLE `user-article` (
  `userid` int(11) NOT NULL,
  `articleid` int(11) NOT NULL,
  `liked` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user-article`
--

INSERT INTO `user-article` (`userid`, `articleid`, `liked`) VALUES
(2, 1, 1),
(2, 8, 0),
(2, 2, 1),
(2, 3, 0),
(2, 10, 0),
(2, 6, 0),
(2, 5, 0),
(2, 4, 0),
(2, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `password`, `role`) VALUES
(1, 'admin', 'adminpassword', 1),
(2, 'guest', 'guestpassword', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`articleid`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`personid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `articleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `personid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
