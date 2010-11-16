-- phpMyAdmin SQL Dump
-- version 3.1.2deb1ubuntu0.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 16, 2010 at 12:09 PM
-- Server version: 5.0.75
-- PHP Version: 5.2.6-3ubuntu4.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `hspc`
--
CREATE DATABASE `hspc` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hspc`;

-- --------------------------------------------------------

--
-- Table structure for table `Competition`
--

CREATE TABLE IF NOT EXISTS `Competition` (
  `competition_id` int(11) NOT NULL auto_increment,
  `name` varchar(35) NOT NULL,
  `date` datetime NOT NULL,
  `type` enum('Test','School') NOT NULL,
  `duration` tinyint(4) NOT NULL default '1',
  `location` tinytext NOT NULL,
  `problem_set` int(11) NOT NULL,
  PRIMARY KEY  (`competition_id`),
  KEY `Name` (`name`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Competition`
--


-- --------------------------------------------------------

--
-- Table structure for table `FAQ`
--

CREATE TABLE IF NOT EXISTS `FAQ` (
  `faq_id` int(11) NOT NULL auto_increment,
  `question` tinytext NOT NULL,
  `answer` mediumtext NOT NULL,
  `status` enum('active','inactive') NOT NULL default 'active',
  PRIMARY KEY  (`faq_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `FAQ`
--

INSERT INTO `FAQ` (`faq_id`, `question`, `answer`, `status`) VALUES
(4, 'May one team utilize Visual Basic and another Visual C++?', 'Sure, we do not have a problem with different teams using different environments.', 'active'),
(2, 'How many members does each team consist of?', 'Teams may consist of 2 or 3 students.\r', 'active'),
(3, 'Can we have more than one team?', 'We are currently registering a maximum of 4 teams per school, but this may change depending on the number of schools that participate. We have a limited amount of space; therefore, in order for us to best service the contestants we may need to allow only one team per school.', 'active'),
(1, 'How many schools have been invited?', 'All Michigan high schools were included in the initial mailing, so you may be competing with schools from anywhere in the state.', 'active'),
(5, 'Will my team have access to materials in the testing area?', 'Yes, your students can bring with them anything that is Hard Copy. Examples: books and printouts. However they cannot bring the following: Key Drives, CDs, Disks, (Computer Media of any sort), calculators, or any electronic devices.', 'active'),
(6, 'If they cant bring a calculator, how will they do the math?', 'We will have the a calculator accessible on the desktop.', 'active'),
(7, 'What environment will the students be programming in?', 'The environment will be Windows XP.', 'active'),
(8, 'What languages will be supported?(UPDATED)', 'Visual Basic, ANSI C++, and Java 1.5.', 'active'),
(9, 'What programming environments are provided?', 'Visual Studio .NET 2005, NetBeans, and GNU C++ 2.95.', 'active'),
(10, 'Will the Java Keyboard class be provided?(UPDATED)', 'Java 1.5 already includes equivalent functionality with the Scanner (System.in).', 'active'),
(11, 'In what format should programs be in?', 'This year we will be accepting programs in Console mode, and GUI Interface mode.', 'active'),
(12, 'How will input and output be accepted?', 'In Console mode the students will need to be able to read data from standard in and write to standard out.', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `Participant`
--

CREATE TABLE IF NOT EXISTS `Participant` (
  `participant_id` int(11) NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) default NULL,
  `email` varchar(45) default NULL,
  `role` enum('coach','contestant') NOT NULL,
  `shirt_size` enum('S','M','L','XL','XXL') NOT NULL,
  `phone_number` char(12) default NULL,
  `password` char(32) default NULL,
  PRIMARY KEY  (`participant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Participant`
--


-- --------------------------------------------------------

--
-- Table structure for table `Problem`
--

CREATE TABLE IF NOT EXISTS `Problem` (
  `problem_id` int(11) NOT NULL auto_increment,
  `description` text NOT NULL,
  `input` text NOT NULL,
  `output` text NOT NULL,
  PRIMARY KEY  (`problem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Problem`
--


-- --------------------------------------------------------

--
-- Table structure for table `Problem_Set`
--

CREATE TABLE IF NOT EXISTS `Problem_Set` (
  `problem_id` int(11) NOT NULL auto_increment,
  `problem_set` int(11) NOT NULL,
  PRIMARY KEY  (`problem_id`,`problem_set`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Problem_Set`
--


-- --------------------------------------------------------

--
-- Table structure for table `School`
--

CREATE TABLE IF NOT EXISTS `School` (
  `school_id` int(11) NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `phone` char(13) NOT NULL,
  `address` varchar(135) NOT NULL,
  `status` enum('active','inactive') NOT NULL default 'active',
  PRIMARY KEY  (`school_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=602 ;

--
-- Dumping data for table `School`
--

INSERT INTO `School` (`school_id`, `name`, `phone`, `address`, `status`) VALUES
(1, 'A.C.E. High School', '(906) 265-235', '611 Jefferson Street Iron River, MI 49935', 'active'),
(2, 'Academy of the Sacred Heart', '(248) 646-890', '1250 Kensington Rd Bloomfield Hills, MI 48304', 'active'),
(3, 'Addison High School', '(517) 547-612', '219 Comstock St. Addison, MI 49220', 'active'),
(4, 'Adlai Stevenson High School', '(586) 797-190', '39701 Dodge Park Rd Sterling Heights, MI 48313', 'active'),
(5, 'Adrian High School', '(517) 263-218', '785 Riverside Avenue Adrian, MI 49221', 'active'),
(6, 'Airport Senior High School', '(734) 654-620', '11330 Grafton Rd. Carleton, MI 48117', 'active'),
(7, 'Akron-fairgrove Jr-sr High', '(989) 693-611', '2800 N. Thomas Fairgrove, Michigan 48733', 'active'),
(8, 'Albion Senior High School', '(517) 629-942', '225 Watson Street Albion, MI 49224', 'active'),
(9, 'Alcona Community High School', '(989) 736-853', '51 N. Barlow Road Lincoln, MI 48742', 'active'),
(10, 'Algoma Christian School', '(616) 678-748', 'PO Box 220 14471 Sparta Avenue Kent City, MI 49330', 'active'),
(11, 'Algonac High School', '(517) 629-942', '225 Watson Street Albion, MI 49224', 'active'),
(12, 'All Saints Central High School', '(989) 892-253', '217 S Monroe St Bay City, MI 48708', 'active'),
(13, 'Allegan High School', '(269) 673-700', '1560 M-40 North Allegan, MI 49010', 'active'),
(14, 'Allendale High School', '(616) 892-558', '10760 68th Avenue Allendale, MI 49401', 'active'),
(15, 'Alma Senior High School', '(989) 463-311', '1500 Pine Ave Alma, MI 48801', 'active'),
(16, 'Almont High School', '(810) 798-859', '4701 Howland Road Almont, MI 48003', 'active'),
(17, 'Alpena High School', '(989) 358-520', '3303 S 3rd Ave Alpena, MI 49707', 'active'),
(18, 'Anchor Bay High School', '(586) 648-250', '6319 County Line Road Fair Haven, MI 48023', 'active'),
(19, 'Andrews Academy', '(269) 471-313', '200 Garland Ave Berrien Springs, MI 49104', 'active'),
(20, 'Ann Arbor Academy', '(734) 747-664', '111 East Mosley Street Ann Arbor, MI 48104', 'active'),
(21, 'Annapolis High School', '(313) 278-987', '4650 Clippert St Dearborn Heights, MI 48125', 'active'),
(22, 'Armada High School', '(586) 784-240', '23655 Armada Center Road Armada, MI 48005', 'active'),
(23, 'Arthur Hill High School', '(989) 399-580', '3115 Mackinaw Street Saginaw, MI 48602', 'active'),
(24, 'Ashley High School', '(989) 847-400', '104 New Street Ashley, MI 48806', 'active'),
(25, 'Athens High School', '(269) 729-541', '300 E. Holcomb Street Athens, MI 49011', 'active'),
(26, 'Athens High School', '(248) 823-290', '4333 John R Troy, MI 48085', 'active'),
(27, 'Atherton High School', '(810) 591-918', '3354 S. Genesee Rd. Burton, MI 48519', 'active'),
(28, 'Avondale High School', '(248) 537-610', '2800 Waukegan St Auburn Hills, MI 48326', 'active'),
(29, 'Bad Axe High School', '(989) 269-959', '200 N. Barrie Road Bad Axe, MI 48413', 'active'),
(30, 'Baldwin Senior High School', '(231) 745-468', '525 Fourth Street Baldwin, MI 49304', 'active'),
(31, 'Bangor High School', '(269) 427-684', '801 W. Arlington Street Bangor, MI 49013', 'active'),
(32, 'Baraga High School', '(906) 353-666', '210 Lyons St Baraga, MI 49908', 'active'),
(33, 'Barry County Christian School', '(269) 948-215', '2999 McKeown Rd. Hastings, MI 49058', 'active'),
(34, 'Bath High School', '(517) 641-672', '6175 E. Clark Road Bath, MI 48808', 'active'),
(35, 'Battle Creek Central High School', '(269) 965-952', '100 W. Van Buren Street Battle Creek, MI 49017', 'active'),
(36, 'Bay City Central High School', '(989) 893-954', '1624 Columbus Avenue Bay City, MI 48708', 'active'),
(37, 'Bay City Western High School', '(989) 662-448', '500 W. Midland Road Auburn, MI 48611', 'active'),
(38, 'Bay-arenac Community High School', '(989) 893-881', '1608 Hudson Street Essexville, MI 48732', 'active'),
(39, 'Beal City High School', '(989) 644-394', '3117 Elias Road Mount Pleasant, MI 48858', 'active'),
(40, 'Beaverton High School', '(989) 246-301', '3090 Crockett Road Beaverton, MI 48612', 'active'),
(41, 'Bedford Senior High School', '(734) 850-610', '8285 Jackman Road Temperance, MI 48182', 'active'),
(42, 'Beecher High School', '(810) 591-922', '6255 Neff Rd Mt Morris, MI 48458', 'active'),
(43, 'Belleville High School', '(734) 697-913', '501 W. Columbia Avenue Belleville, MI 48111', 'active'),
(44, 'Bendle Senior High School', '(810) 591-510', '2283 E. Scottwood Ave. Burton, MI 48529', 'active'),
(45, 'Benedictine High School', '(313) 531-294', '8001 West Outer Drive Detroit, MI 48235', 'active'),
(46, 'Bentley High School', '(810)591-5811', '1150 N. Belsay Rd. Burton, Michigan 48509', 'active'),
(47, 'Benton Harbor High School', '(269) 605-120', '870 Colfax Avenue Benton Harbor, MI 49022', 'active'),
(48, 'Benzie Central High School', '(231) 882-449', '9300 Homestead Rd. Benzonia, MI 49616', 'active'),
(49, 'Berkley High School', '(248) 837-810', '2325 Catalpa Drive Berkley, MI 48072', 'active'),
(50, 'Berrien Springs High School', '(269) 471-174', '1 Sylvester Ave Berrien Springs, MI 49103', 'active'),
(51, 'Bethany Christian School', '(248) 689-482', '2601 John R Rd Troy, MI 48083', 'active'),
(52, 'Big Rapids High School', '(231)-796-765', '21175 15 Mile Rd. Big Rapids, MI 49307', 'active'),
(53, 'Birch Run High School', '(989) 624-939', '12450 Church Street Birch Run, MI 48415', 'active'),
(54, 'Bishop Borgess High School', '(313) 255-110', '11685 Appleton Redford, MI 48239', 'active'),
(55, 'Bishop Foley Catholic High School', '(248) 585-121', '32000 Campbell Rd. Madison Heights, MI 48071', 'active'),
(56, 'Bishop Gallagher High School', '(313) 886-085', '19360 Harper Avenue Harper Woods, MI 48225', 'active'),
(57, 'Blissfield High School', '(517) 486-214', '630 S. Lane Street Blissfield, MI 49228', 'active'),
(58, 'Bloomfield Hills Andover High School', '(248) 341.550', '4200 Andover Road, Bloomfield Hills, MI 48302', 'active'),
(59, 'Bloomfield Hills Lahser High School', '(248) 341.570', '3456 Lahser Road, Bloomfield Hills, MI 48302', 'active'),
(60, 'Bloomingdale High School', '(269) 521-391', '629 E Kalamazoo St Bloomingdale, MI 49026', 'active'),
(61, 'Boyne City High School', '(231) 439-810', '1025 Boyne Avenue Boyne City, MI 49712', 'active'),
(62, 'Brandon High School', '(248) 627-182', '1025 S. Ortonville Road Ortonville, MI 48462', 'active'),
(63, 'Brandywine Senior High School', '(269) 683-480', '1700 Bell Rd Niles, MI 49120', 'active'),
(64, 'Breckenridge High School', '(989) 842-318', '700 Wright St Breckenridge, MI 48615', 'active'),
(65, 'Brethren High School', '(231) 477-535', '4400 Highbridge Rd Brethren, MI 49619', 'active'),
(66, 'Bridgeport High School', '(989) 777-310', '4691 Bearcat Boulevard Bridgeport, MI 48722', 'active'),
(67, 'Bridgman High School', '(269) 466-022', '9964 Gast Road Bridgman, MI 49106', 'active'),
(68, 'Brighton High School', '(810) 299-410', '7878 Brighton Road Brighton, MI 48116', 'active'),
(69, 'Brockway Christian Academy', '(989) 352-136', '10951 3 Mile Rd Morley, MI 49336', 'active'),
(70, 'Bronson High School', '(517) 369-323', '450 E. Grant Street Bronson, Michigan 49028', 'active'),
(71, 'Brother Rice High School', '(248) 647-252', '7101 Lahser Road Bloomfield Hills, MI 48301', 'active'),
(72, 'Brown City High School', '(810) 346-278', '4400 Second Street Brown City, MI 48416', 'active'),
(73, 'Buchanan High School', '(269) 695-840', '401 W. Chicago Street Buchanan, MI 49107', 'active'),
(74, 'Buena Vista High School', '(989) 754-149', '3945 E. Holland Saginaw, MI 48601', 'active'),
(75, 'Bullock Creek High School', '(989) 631-234', '1420 S. Badour Road Midland, MI 48640', 'active'),
(76, 'Burr Oak High School', '(616) 489-553', '326 E. Eagle Street Burr Oak, MI 49030', 'active'),
(77, 'Byron Area High School', '(810) 266-462', '312 W. Maple Avenue Byron, MI 48418', 'active'),
(78, 'Byron Center High School', '(616) 878-660', '8500 Burlingame Ave SW Byron Center, MI 49315', 'active'),
(79, 'Cadillac High School', '(231) 876-580', '400 Linden Street Cadillac, MI 49601', 'active'),
(80, 'Caledonia High School', '(616) 891-812', '9050 Kraft Ave, Caledonia, MI 49316', 'active'),
(81, 'Calumet High School', '(906) 337-031', '57070 Mine Street Calumet, MI 49913', 'active'),
(82, 'Calvary Baptist Academy', '(989) 832-334', '6100 Perrine Rd. Midland, MI. 48640', 'active'),
(83, 'Calvary Christian Schools', '(231) 865-214', '5873 Kendra Road Fruitport, MI 49415', 'active'),
(84, 'Calvin Christian School', '(616) 532-237', '3750 Ivanrest Ave, SW Grandville, MI 49418', 'active'),
(85, 'Camden-frontier High School', '(517) 368-525', '4971 W Montgomery Rd Camden, MI 49232', 'active'),
(86, 'Canton High School', '(734) 416-285', '8415 N Canton Center Rd Canton, MI 48187', 'active'),
(87, 'Capac High School', '(810) 395-380', '541 N. Glassford Street Capac, MI 48014', 'active'),
(88, 'Carlson High School', '(734) 379-710', '30550 W. Jefferson Avenue Gibraltar, MI 48173', 'active'),
(89, 'Carman-Ainsworth High School', '(810) 591-324', '1300 N. Linden Road Flint, MI 48532', 'active'),
(90, 'Caro High School', '(989) 673-316', '301 N. Hooper Street Caro, MI 48723', 'active'),
(91, 'Carrollton High School', '(989) 753-343', '1235 Maple Ridge Road Carrollton, MI 48724', 'active'),
(92, 'Carson City High School', '(989) 584-317', '213 E. Sherman Carson City, MI 48811', 'active'),
(93, 'Casa Richard Academy', '(313) 963-775', '2635 HOward Detroit, MI 48216', 'active'),
(94, 'Caseville High School', '(989) 856-231', '6609 Vine Street Caseville, MI 48725', 'active'),
(95, 'Cass City High School', '(989) 872-214', '4868 Seeger St Cass City, MI 48726', 'active'),
(96, 'Cass Technical High School', '(313) 596-390', '2421 2nd Blvd Detroit, MI 48201', 'active'),
(97, 'Catholic Central High School', '(616) 233-580', '319 Sheldon Blvd. Grand Rapids, MI 49503', 'active'),
(98, 'Catholic Central High School', '(248) 596-381', '27225 Wixom Road Novi, MI 48374', 'active'),
(99, 'Cedar Springs High School', '(616) 696-120', '204 E. Muskegon Street Cedar Springs, MI 49319', 'active'),
(100, 'Cedarville High School', '(906) 484-225', '298 E M 134 Cedarville, MI 49719', 'active'),
(101, 'Center Line High School', '(586) 510-210', '26300 Arsenal Center Line, Michigan 48015', 'active'),
(102, 'Central High School', '(313) 252-300', '2425 Tuxedo Street Detroit, MI 48206', 'active'),
(103, 'Central High School', '(616) 819-231', '421 Fountain N.E. Grand Rapids, MI 49503', 'active'),
(104, 'Central Montcalm High School', '(989) 831-210', '1480 Sheridan Road SW Stanton, MI 48888', 'active'),
(105, 'Centreville High School', '(269) 467-521', '190 Hogan St Centreville, MI 49032', 'active'),
(106, 'Cesar ChavezAcademy High School', '(313) 551-061', '1761 Waterman, Detroit, MI 48209', 'active'),
(107, 'Chadsey High School', '(313) 596-369', '5335 Martin Street Detroit, MI 48210', 'active'),
(108, 'Charlevoix High School', '(231) 547-322', '05200 Marion Center Rd Charlevoix, MI 49720', 'active'),
(109, 'Charlotte Senior High School', '(517) 541-560', '378 State St Charlotte, MI 48813', 'active'),
(110, 'Cheboygan High School', '(231) 627-719', '801 W Lincoln Ave Cheboygan, MI 49721', 'active'),
(111, 'Chelsea High School', '(734) 433-220', '740 N. Freer Road Chelsea, MI 48118', 'active'),
(112, 'Chesaning Union High School', '(989) 845-204', '850 N 4th St Chesaning, MI 48616', 'active'),
(113, 'Chippewa Hills High School', '(989) 967-210', '3226 Arthur Rd. Remus, MI 49340', 'active'),
(114, 'Chippewa Valley High School', '(586) 723-230', '18300 19 Mile Road Clinton Township, MI 48038', 'active'),
(115, 'Churchill High School', '(734)744-2650', '8900 Newburgh Rd. Livonia, MI 48150', 'active'),
(116, 'City Middle-high School', '(616) 819-238', '1400 Fuller Ave NE Grand Rapids, MI 49505', 'active'),
(117, 'Clare High School', '(989) 386-778', '201 E. State Street, Clare, MI 48617', 'active'),
(118, 'Clarence M. Kimball High School', '(248) 435-850', '1500 Lexington Boulevard Royal Oak, MI 48073', 'active'),
(119, 'Clarenceville High School', '(248) 919-040', '20155 Middlebelt Road Livonia, MI 48152', 'active'),
(120, 'Clarkston High School', '(248) 623-360', '6093 Flemings Lake Road Clarkston, MI 48346', 'active'),
(121, 'Clawson High School', '(248) 655-420', '101 John M Avenue Clawson, MI 48017', 'active'),
(122, 'Climax Scotts High School', '(616) 746-230', '372 S. Main Street Climax, MI 49034', 'active'),
(123, 'Clinton High School', '(517) 456-651', '340 E. Michigan Ave Clinton, MI 49236', 'active'),
(124, 'Clintondale High School', '(586) 791-630', '35200 Little Mack Clinton Township, MI 48035', 'active'),
(125, 'Clio Area High School', '(810) 591-480', 'One Mustang Drive Clio, MI 48420', 'active'),
(126, 'Cody High School', '(313) 866-920', '18445 Cathedral Street Detroit, MI 48228', 'active'),
(127, 'Coldwater High School', '(517) 279-593', '275 North Fremont Ave. Coldwater, MI 49036', 'active'),
(128, 'Coleman High School', '(989) 465-617', '4951 N. Lewis Coleman, MI 48618', 'active'),
(129, 'Coloma High School', '(269) 468-240', '300 West St. Joseph Coloma, Michigan 49038', 'active'),
(130, 'Colon High School', '(269) 432-323', '400 Dallas St. Colon, MI 49040', 'active'),
(131, 'Columbia Central High School', '(517) 592-663', '11775 Hewitt Road Brooklyn, MI 49230', 'active'),
(132, 'Community High School', '(734) 994-202', '401 N. Division Street Ann Arbor, MI 48104', 'active'),
(133, 'Comstock High School', '(269) 388-940', '2107 N 26th St Kalamazoo, MI 49048', 'active'),
(134, 'Comstock Park High School', '(616) 254-520', '150 6 Mile Rd NE Comstock Park, MI 49321', 'active'),
(135, 'Concord High School', '(517) 524-838', '219 Monroe Street Concord, MI 49237', 'active'),
(136, 'Constantine High School', '(269) 435-892', 'One Falcon Dr Constantine, MI 49042', 'active'),
(137, 'Cooley High School', '(313) 270-001', '15055 Hubbell St Detroit, MI 48227', 'active'),
(138, 'Coopersville High School', '(616) 997-350', '198 East St Coopersville, MI 49404', 'active'),
(139, 'Copper Country Christian School', '(906) 487-171', '20980 Broemer Road Chassell, MI 49916', 'active'),
(140, 'Cornerstone Christian School', '(231) 627-216', '900 S Western Ave Cheboygan, MI 49721', 'active'),
(141, 'Corunna High School', '(989) 743-344', '417 E. King Street Corunna, MI 48817', 'active'),
(142, 'Countryside Academy-high School', '(269) 944-331', '4800 Meadowbrook Rd Benton Harbor, MI 49022', 'active'),
(143, 'Cousino High School', '(586) 574-310', '30333 Hoover Road Warren, MI 48093', 'active'),
(144, 'Covenant Christian High School', '(616) 453-504', '1401 Ferndale Ave. SW Grand Rapids, MI 49534', 'active'),
(145, 'Covert High School', '(269) 764-370', '35323 M140 Highway Covert, MI 49043', 'active'),
(146, 'Creston High School', '(616) 819-242', '1720 Plainfield NE Grand Rapids, MI 49505', 'active'),
(147, 'Crestwood High School', '(313) 278-747', '1501 N. Beech Daly Road Dearborn Heights, MI 48127', 'active'),
(148, 'Crockett High School', '(313) 866-739', '8950 St. Cyril Detroit, MI 48213', 'active'),
(149, 'Crosman High School', '(313) 873-156', '9027 John C. Lodge Detroit, MI 48202', 'active'),
(150, 'Croswell-lexington High School', '(810)679-1500', '5461 East Peck Rd. Croswell, MI 48422', 'active'),
(151, 'Dakota High School', '(586) 723-270', '21051 21 Mile Road Macomb, MI 48044', 'active'),
(152, 'Dansville High School', '(517) 623-612', '1264 Adams Street Dansville, MI 48819', 'active'),
(153, 'Davis Aerospace High School', '(313) 866-540', '10200 Erwin St Detroit, MI 48234', 'active'),
(154, 'Davison High School', '(810) 591-353', '1250 N. Oak Road Davison, MI 48423', 'active'),
(155, 'Daystar Christian Academy', '(616) 396-158', '11025 Paw Paw Dr Holland, MI 49424', 'active'),
(156, 'De la Salle Collegiate High School', '(586) 778-220', '14600 Common Road Warren, MI 48088', 'active'),
(157, 'Dearborn High School', '(313) 827-160', '19501 Outer Drive Dearborn, MI 48124', 'active'),
(158, 'Decatur High School', '(269) 423-685', '110 Cedar St Decatur, MI 49045', 'active'),
(159, 'Deckerville Community High School', '(810) 376-387', '2633 Black River Street Deckerville, MI 48427', 'active'),
(160, 'Deford Christian Academy', '(989) 872-405', '1392 N Kingston Rd Deford, MI 48729', 'active'),
(161, 'Delton-kellogg High School', '(269) 623-922', '10425 Panther Pride Drive Delton, MI 49046', 'active'),
(162, 'Denby High School', '(313) 866-720', '12800 Kelly Rd Detroit, MI 48224', 'active'),
(163, 'Detour High School', '(906) 297-201', '202 S. Division Street De Tour Village, MI 49725', 'active'),
(164, 'Detroit City High School', '(313) 596-001', '13141 Rosa Parks Detroit, MI 48238', 'active'),
(165, 'Dewitt High School', '(517) 668-315', '13601 Panther Drive DeWitt, MI 48820', 'active'),
(166, 'Dexter High School', '(734) 424-424', '2200 North Parker Road Dexter, MI 48130', 'active'),
(167, 'Divine Child High School', '(313) 562-199', '1001 North Silvery Lane Dearborn, Michigan 48128', 'active'),
(168, 'Dollar Bay High School', '(906) 482-581', '48475 Maple Drive Po Box 371 Dollar Bay, MI 49922', 'active'),
(169, 'Dondero High School', '(248) 541-710', '709 N. Washington Avenue Royal Oak, MI 48067', 'active'),
(170, 'Dow High School', '(989) 923-538', '3901 N. Saginaw Road Midland, MI 48640-2397', 'active'),
(171, 'Downriver High School', '(734) 379-470', '33211 McCann Road Rockwood, MI 48173', 'active'),
(172, 'Dryden High School', '(810) 796-226', '3866 Rochester Rd Dryden, MI 48428', 'active'),
(173, 'Dundee Community High School', '(734) 529-700', '130 Viking Drive Dundee, MI 48131', 'active'),
(174, 'Durand Area High School', '(989) 288-346', '9575 E. Monroe Road Durand, MI 48429', 'active'),
(175, 'East Catholic High School', '(313) 921-965', '7320 Saint Anthony Pl Detroit, MI 48213', 'active'),
(176, 'East Detroit High School', '(586) 445-440', '15115 Deerfield St. Eastpointe, MI 48021', 'active'),
(177, 'East Grand Rapids High School', '(616) 235-755', '2211 Lake Drive SE East Grand Rapids, MI 49506', 'active'),
(178, 'East Jackson High School', '(517) 764-170', '1566 N Sutton Rd Jackson, MI 49202', 'active'),
(179, 'East Jordan High School', '(231) 536-225', '101 Maple St East Jordan, MI 49727', 'active'),
(180, 'East Kentwood High School', '(616) 698-670', '6230 Kalamazoo Avenue SE Kentwood, MI 49508', 'active'),
(181, 'East Lansing High School', '(517) 333-750', '509 Burcham Dr East Lansing, MI 48823', 'active'),
(182, 'East Martin Christian High School', '(269) 672-767', '518-118th Ave. Martin, MI 49070', 'active'),
(183, 'Eastern High School', '(616) 493-883', '2200 Pettis Avenue NE Ada, MI 49301-9266', 'active'),
(184, 'Eastside Christian School', '(616) 942-293', '2792 Michigan St NE Grand Rapids, MI 49506', 'active'),
(185, 'Eaton Rapids Senior High School', '(517) 663-223', '800 State Street Eaton Rapids, MI 48827', 'active'),
(186, 'Eau Claire Middle-high School', '(269) 461-699', '7450 Hochberger Rd. Eau Claire, MI 49111', 'active'),
(187, 'Ecorse Community High School', '(313) 294-470', '27385 W Outer Dr Ecorse, MI 48229', 'active'),
(188, 'Edsel Ford High School', '(313) 827-150', '20601 Rotunda Dr Dearborn, MI 48124', 'active'),
(189, 'Edwardsburg High School', '(269) 663-104', '69410 Section Street Edwardsburg, MI 49112', 'active'),
(190, 'Eisenhower High School', '(586) 797-130', '6500 25 Mile Road Shelby Township, MI 48316', 'active'),
(191, 'Elk Rapids High School', '(231) 264-810', '308 Meguzee Pt Rd Elk, Rapids. Michigan', 'active'),
(192, 'Engadine High School', '(906) 477-644', 'W13920 Melville Street Engadine, MI 49827', 'active'),
(193, 'Escanaba High School', '(906) 786-652', '500 S Lincoln Rd Escanaba, MI 49829', 'active'),
(194, 'Evart High School', '(231) 734-555', '6221 95th Avenue Evart, MI 49631', 'active'),
(195, 'Everett High School', '(517) 325-660', '3900 Stabler Street Lansing, MI 48910', 'active'),
(196, 'Fairview High School', '(989) 848-705', '1879 E Miller Rd Fairview, MI 48621', 'active'),
(197, 'Faith Christian School', '(231) 924-232', '7729 W 48th St Fremont, MI 49412', 'active'),
(198, 'Faithway Christian School', '(810) 743-005', '1225 S. Center Road Burton, MI 48509', 'active'),
(199, 'Farmington High School', '(248) 489-345', '32000 Shiawassee Road Farmington, MI 48336', 'active'),
(200, 'Farwell High School', '(989) 588-991', '399 E. Michigan Avenue Farwell, MI 48622', 'active'),
(201, 'Fennville High School', '(269) 561-724', '4 Memorial Drive Fennville, MI 49408', 'active'),
(202, 'Fenton Senior High School', '(810) 591-260', '3200 W Shiawassee Ave Fenton, MI 48430', 'active'),
(203, 'Ferndale High School', '(248) 586-869', '2920 Burdette Ferndale, MI 48220', 'active'),
(204, 'Finney High School', '(313) 417-880', '17200 Southampton St Detroit, MI 48224', 'active'),
(205, 'First Assembly Christian School', '(704) 793-475', '154 Warren C. Coleman Blvd. Concord, NC 28027', 'active'),
(206, 'Fitzgerald Senior High School', '(586) 757-707', '23200 Ryan Road Warren, MI 48091', 'active'),
(207, 'Flat Rock Community High School', '(734) 782-127', '25600 Seneca Flat Rock, MI 48134', 'active'),
(208, 'Flint Central High School', '(810) 760-104', '601 Crapo Street Flint, MI 48503', 'active'),
(209, 'Flint Northwestern High School', '(810) 760-178', 'G-2138 W. Carpenter Road Flint, MI 48505', 'active'),
(210, 'Flushing High School', '(810) 591-377', '5039 Deland Road Flushing, MI 48433', 'active'),
(211, 'Fordson High School', '(313) 827-140', '13800 Ford Road Dearborn, MI 48126', 'active'),
(212, 'Forest Area High School', '(231) 369-288', '7661 Shippy Rd SW Fife Lake, MI 49633', 'active'),
(213, 'Forest Hills Central High School', '(616) 493-870', '5901 Hall St SE Grand Rapids, MI 49546', 'active'),
(214, 'Forest Hills Northern High School', '(616) 493-860', '3801 Leonard St NE Grand Rapids, MI 49525', 'active'),
(215, 'Fowler High School', '(989) 593-225', '700 S. Wright Road Fowler, MI 48835', 'active'),
(216, 'Fowlerville High School', '(517) 223-600', '700 N Grand Ave. Fowlerville, MI 48836', 'active'),
(217, 'Fr Gabriel Richard High School', '(734) 662-049', '4333 Whitehall Dr Ann Arbor, MI 48105', 'active'),
(218, 'Frankenmuth High School', '(989) 652-995', '525 E. Genesee Street Frankenmuth, MI 48734', 'active'),
(219, 'Frankfort High School', '(231)352-4781', '534 11th St. Frankfort, MI 49635', 'active'),
(220, 'Franklin High School', '(517) 279-590', '95 S. Fremont Street Coldwater, MI 49036', 'active'),
(221, 'Franklin High School', '(734) 744-265', '31000 Joy Road Livonia, MI 48150', 'active'),
(222, 'Franklin Road Christian School', '(248) 668-700', '40800 W. Thirteen Mile Road. Novi, MI 48377', 'active'),
(223, 'Fraser High School', '(586) 293-510', '34270 Garfield Road Fraser, MI 48026', 'active'),
(224, 'Free Soil Community High School', '(231) 464-565', '8480 N. Democrat Street Free Soil, MI 49411', 'active'),
(225, 'Freeland Middle School-high School', '(989) 695-258', '8250 Webster Rd. Freeland, MI 48623-8445', 'active'),
(226, 'Fremont High School', '(231) 924-530', '204 E. Main Street Fremont, MI 49412', 'active'),
(227, 'Fruitport Alternative High School', '(231) 865-311', '3255 E. Pontaluna Rd. Fruitport, MI 49415', 'active'),
(228, 'Fruitport High School', '(231) 865-310', '357 N. 6th Street Fruitport, MI 49415', 'active'),
(229, 'Fulton High School', '(989) 236-723', '8060 Ely Highway Middleton, MI 48856', 'active'),
(230, 'Gabriel Richard Catholic High School', '(734)284-1875', '15325 Pennsylvania Road Riverview, Michigan 48193', 'active'),
(231, 'Galesburg-Augusta High School', '(269)484-2000', '1076 N. 37th St. Galesburg, MI 49053', 'active'),
(232, 'Garber High School', '(989) 894-971', '213 Pine Street Essexville, MI 48732', 'active'),
(233, 'Garden City High School', '(734) 762-835', '6500 Middlebelt Road Garden City, MI 48135', 'active'),
(234, 'Gateway Middle-high School', '(616) 331-224', '10 Straight Ave SW Grand Rapids, MI 49504', 'active'),
(235, 'Gaylord High School', '(989) 731-096', '90 Livingston Boulevard Gaylord, MI 49735', 'active'),
(236, 'Genesee Christian School', '(810) 743-310', '1223 S. Belsay Rd. Burton, MI 48509', 'active'),
(237, 'Genesee High School', '(810) 591-145', '7347 N. Genesee Road Genesee, MI 48437', 'active'),
(238, 'Genesis High School', '(231) 734-305', '901 N Main St Evart, MI 49631', 'active'),
(239, 'George Crockett Consortium High School', '(313) 964-233', '1250 Rosa Parks Blvd Detroit, MI 48216', 'active'),
(240, 'Gladstone Area High School', '(906) 428-920', '2100 M-35 Gladstone, MI 49837', 'active'),
(241, 'Gladwin High School', '(989) 426-734', '1400 N. Spring St. Gladwin, MI 48624', 'active'),
(242, 'Glen Lake Community High School', '(231) 334-306', '3375 W. Burdickville Road Maple City, MI 49664', 'active'),
(243, 'Glenmor High School', '(616) 891-273', '8948 Kraft Ave SE Caledonia, MI 49316', 'active'),
(244, 'Gobles High School', '(269) 628-211', '409 N. State Street Gobles, MI 49055', 'active'),
(245, 'Godwin Heights High School', '(616) 252-205', '50 - 35th Street Grand Rapids, MI 49548', 'active'),
(246, 'Goodrich High School', '(810) 591-225', '8029 S. Gale Road Goodrich, MI 48438', 'active'),
(247, 'Grace Christian School', '(269) 463-554', '325 N M 140 Watervliet, MI 49098', 'active'),
(248, 'Grand Blanc Community High School', '(810) 591-663', '12500 Holly Road Grand Blanc, MI 48439', 'active'),
(249, 'Grand Haven High School', '(616) 850-600', '17001 Ferris St. Grand Haven, MI 49417', 'active'),
(250, 'Grand Ledge High School', '(517) 627-268', '820 Spring St Grand Ledge, MI 48837', 'active'),
(251, 'Grand Rapids Catholic High School', '(616) 459-455', '319 Sheldon Mall SE Grand Rapids, MI 49503', 'active'),
(252, 'Grand Rapids Christian High School', '(616) 574-550', '2300 Plymouth Ave SE Grand Rapids, MI 49506', 'active'),
(253, 'Grandville High School', '(616) 254-643', '4700 Canal SW Grandville, MI 49418', 'active'),
(254, 'Grant High School', '(231) 834-562', '331 E. State St. Grant, MI 49327', 'active'),
(255, 'Grass Lake High School', '(517) 522-849', '11500 Warrior Trail Grass Lake, MI 49240', 'active'),
(256, 'Grayling High School', '(989) 344-350', '1135 North Old U.S. 27 Grandville, MI 49418', 'active'),
(257, 'Great Lakes Adventist Academy', '(989) 427-246', '7477 Academy Road Cedar Lake, MI 48812', 'active'),
(258, 'Greenbush Christian Academy', '(989) 724-526', '2430 South State St Po Box 116 Greenbush, MI 48738', 'active'),
(259, 'Greenville Senior High School', '(616) 754-368', '111 N Hillcrest St Greenville, MI 48838', 'active'),
(260, 'Grosse Pointe South High School', '(313) 432-350', '11 Grosse Pointe Blvd Grosse Pte Farms, MI 48236', 'active'),
(261, 'Gull Lake High School', '(269) 488-502', '7753 N 34th St Richland, MI 49083', 'active'),
(262, 'Gwinn High School', '(906) 346-489', '50 West M-35 Gwinn, MI 49841', 'active'),
(263, 'H. H. Dow High School', '(989) 923-538', '3901 N. Saginaw Road Midland, MI 48640', 'active'),
(264, 'Hackett Catholic Central High School', '(269) 381-264', '1000 W. Kilgore Rd Kalamazoo, MI 49008', 'active'),
(265, 'Hale High School', '(989) 728-286', '415 E Main St Hale, MI 48739', 'active'),
(266, 'Hamady High School', '(810) 591-089', 'G-3223 W. Carpenter Road Flint, MI 48504', 'active'),
(267, 'Hamilton High School', '(269) 751-518', '4911 136th Avenue Hamilton, MI 49419', 'active'),
(268, 'Hamtramck High School', '(313) 892-750', '11410 Charest Hamtramck, MI 48212', 'active'),
(269, 'Hancock Central High School', '(906) 483-254', '501 Campus Drive Hancock, Mi. 49930', 'active'),
(270, 'Hanover Horton High School', '(517) 563-010', '10,000 Moscow Road Horton, MI 49246', 'active'),
(271, 'Harbor Beach High School', '(989) 479-326', '402 S. 5th Street Harbor Beach, MI 48441', 'active'),
(272, 'Harbor High School', '(248) 676-839', '5061 Duck Lake Road Highland, MI 48356', 'active'),
(273, 'Harbor Springs High School', '(231) 526-480', '327 East Bluff Dr. Harbor Springs, MI 49740', 'active'),
(274, 'Harper Creek High School', '(269) 441-845', '12677 Beadle Lake Road Battle Creek, MI 49014', 'active'),
(275, 'Harrison Community High School', '(989) 539-741', '700 S. Fifth Street Harrison, MI 48625', 'active'),
(276, 'Harrison High School', '(248) 489-349', '29995 W. 12 Mile Road Farmington Hills, MI 48334', 'active'),
(277, 'Hart High School', '(231) 873-569', '300 W. Johnson Street Hart, MI 49420', 'active'),
(278, 'Hartford High School', '(269) 621-710', '121 School St Hartford, MI 49057', 'active'),
(279, 'Hartland Alt. Ed. (LEGACY)', '(810) 746-210', '9525 Highland Road Howell, MI 48843', 'active'),
(280, 'Hartland High School', '(810) 746-220', '10635 Dunham Rd. Hartland, MI 48353', 'active'),
(281, 'Haslett High School', '(517) 339-824', '5450 Marsh Road Haslett, MI 48840', 'active'),
(282, 'Hastings High School', '(269) 948-440', '520 W South St Hastings, MI 49058', 'active'),
(283, 'Hazel Park High School', '(248) 544-521', '23400 Hughes Avenue Hazel Park, MI 48030', 'active'),
(284, 'Hemlock High School', '(989) 642-528', '733 N Hemlock Rd PO Box 260 Hemlock, MI 48626', 'active'),
(285, 'Henry Ford Academy', '(313) 982-619', '20900 Oakwood Boulevard Dearborn, MI 48124', 'active'),
(286, 'Henry Ford II High School', '(586) 797-160', '11911 Clinton River Road Sterling Heights, MI 48313', 'active'),
(287, 'Heritage High School', '(989) 799-579', '3465 N. Center Road Saginaw, MI 48603', 'active'),
(288, 'Hesperia High School', '(231) 854-638', '96 S Division St Hesperia, MI 49421', 'active'),
(289, 'Hill Mccloy High School', '(639) 6131-88', '301 Nanita Drive Montrose, MI 48457', 'active'),
(290, 'Holiness Christian School', '(734) 279-221', '400 E Elm St Petersburg, MI 49270', 'active'),
(291, 'Holland High School', '(616) 494-220', '600 Van Raalte Avenue Holland, MI 49423', 'active'),
(292, 'Holly High School', '(248) 328-320', '6161 E. Holly Road Holly, MI 48442', 'active'),
(293, 'Holt High School', '(517) 694-216', '5885 West Holt Road Holt, MI 48842', 'active'),
(294, 'Holton High School', '(231) 821-172', '6477 Syers Road Holton, MI 49425', 'active'),
(295, 'Homer Community High School', '(517) 568-446', '403 S Hillsdale St Homer, MI 49245', 'active'),
(296, 'Hopkins High School', '(269) 793-761', '333 S Clark St Hopkins, MI 49328', 'active'),
(297, 'Horizons Community High School', '(616) 530-753', '1585 36th Street S.W. Wyoming, MI 49509', 'active'),
(298, 'Houghton Central High School', '(906) 482-045', '1603 Gundlach Road Houghton, MI 49931', 'active'),
(299, 'Houghton Lake High School', '(989) 366-200', '4433 W Houghton Lake Dr Houghton Lake, MI 48629', 'active'),
(300, 'Howardsville Christian School', '(269) 646-936', '53441 Bent Rd. Marcellus, MI 49067', 'active'),
(301, 'Howell High School', '(517) 548-620', '1200 W. Grand River Howell, MI 48843', 'active'),
(302, 'Hudson Area High School', '(517) 448-891', '771 N. Maple Grove Ave. Hudson, MI 49247', 'active'),
(303, 'Huron High School', '(734) 994-204', '2727 Fuller Road Ann Arbor, MI 48105', 'active'),
(304, 'Huron Valley Lutheran High School', '(734) 525-016', '33740 Cowan Westland, MI 48185', 'active'),
(305, 'Ida High School', '(734) 269-900', '3145 Prairie St. Ida, MI 48140', 'active'),
(306, 'Imlay City High School', '(810) 724-981', '1001 Norlin Dr Imlay City, MI 48444', 'active'),
(307, 'Inkster High School', '(734) 326-851', '3250 Middlebelt Road Inkster, MI 48141', 'active'),
(308, 'Inland Lakes High School', '(231) 238-686', '4363 S. Straits Hwy Indian River, MI 49749', 'active'),
(309, 'International Academy of Flint', '(810) 251-515', '2820 S. Saginaw Street Flint, MI 48503', 'active'),
(310, 'Ionia High School', '(616) 527-060', '250 E. Tuttle Road Ionia, MI 48846', 'active'),
(311, 'Ionia Nazarene Christian School', '(616) 527-935', '83 East Tuttle Road Ionia, MI 48846', 'active'),
(312, 'Iron Mountain High School', '(906) 779-261', '300 W B St Iron Mountain, MI 49801', 'active'),
(313, 'Ishpeming High School', '(906) 485-106', '319 E. Division Street Ishpeming, Michigan 49849', 'active'),
(314, 'Ithaca High School', '(989) 875-337', '710 N. Union Street Ithaca, MI 48847', 'active'),
(315, 'Jackson High School', '(517) 841-370', '544 Wildwood Avenue Jackson, MI 49201', 'active'),
(316, 'Japanese School of Detroit', '(248) 540-479', '2436 W.Lincoln, Suite E101 Birmingham, MI 48009', 'active'),
(317, 'Jeffers High School', '(906) 482-058', '43084 Goodell Street Painesdale, MI 49955', 'active'),
(318, 'Jefferson High School', '(734) 289-555', '5707 Williams Rd Monroe, MI 48162', 'active'),
(319, 'Jenison High School', '(616) 457-340', '2140 Bauer Road Jenison, MI 49428', 'active'),
(320, 'Johannesburg-Lewiston High School', '(989) 731-442', '10854 M-32 Johannesburg, MI 49751', 'active'),
(321, 'John F. Kennedy High School', '(734) 374-122', '13505 J.F. Kennedy Drive Taylor, MI 48180', 'active'),
(322, 'John Glenn High School', '(989) 684-751', '3201 E. Kiesel Road Bay City, MI 48706', 'active'),
(323, 'Jonesville High School', '(517) 849-993', '460 Adrian Street Jonesville, MI 49250', 'active'),
(324, 'Kalamazoo Central High School', '(269) 337-030', '2432 N. Drake Road Kalamazoo, MI 49009', 'active'),
(325, 'Kalamazoo Christian High School', '(269) 381-225', '2121 Stadium Drive Kalamazoo, MI 49008', 'active'),
(326, 'Kalkaska High School', '(231) 258-916', '109 N Birch St Kalkaska, MI 49646', 'active'),
(327, 'Kearsley High School', '(810) 591-988', 'G-4302 Underhill Drive Flint, MI 48506', 'active'),
(328, 'Kelloggsville High School', '(616) 532-157', '23 Jean St SW Grand Rapids, MI 49548', 'active'),
(329, 'Kenowa Hills High School', '(616) 784-240', '3825 Hendershot Avenue NW Grand Rapids, MI 49544', 'active'),
(330, 'Kent City High School', '(616) 678-421', '351 N. Main Street Kent City, MI 49330', 'active'),
(331, 'Kettering High School', '(313) 866-533', '6101 Van Dyke Avenue Detroit, MI 48213', 'active'),
(332, 'Kettering High School', '(248) 673-126', '2800 Kettering Drive Waterford, MI 48329', 'active'),
(333, 'King High School', '(313) 494-737', '3200 E. Lafayette Street Detroit, MI 48207', 'active'),
(334, 'Kingsford High School', '(906) 779-267', '431 Hamilton Avenue Kingsford, MI 49802', 'active'),
(335, 'Kingsley Area High School', '(231) 263-526', '7475 Kingsley Road Kingsley, MI 49649', 'active'),
(336, 'Kingston Community High School', '(989) 683-255', '5790 State Street Kingston, MI 48741', 'active'),
(337, 'L''anse High School', '(906) 524-612', '201 N. 4th Street L Anse, MI 49946', 'active'),
(338, 'L.C. Mohr High School', '(269) 637-050', '600 Elkenburg St South Haven, MI 49090', 'active'),
(339, 'Ladywood High School', '(734) 591-154', '14680 Newburgh Rd Livonia, MI 48154', 'active'),
(340, 'Laingsburg High School', '(517) 651-509', '8008 Woodbury Road Laingsburg, MI 48848', 'active'),
(341, 'Lake City High School', '(231) 839-433', '251 E Russell St Lake City, MI 49651', 'active'),
(342, 'Lake Fenton High School', '(810) 591-959', '4070 Lahring Road Linden, MI 48451', 'active'),
(343, 'Lake Linden-hubbell High School', '(906) 296-050', '601 Calumet St. Lake Linden, Mi. 49945', 'active'),
(344, 'Lake Orion Community High School', '(248) 693-542', '495 E. Scripps Road Lake Orion, MI 48360', 'active'),
(345, 'Lake Shore High School', '(586) 285-890', '22980 East Thirteen Mile Road St. Clair Shores, MI 48082', 'active'),
(346, 'Lakeland High School', '(248) 676-832', '1630 Bogie Lake Road White Lake, MI 48383', 'active'),
(347, 'Laker High School', '(989) 453-460', '6136 Pigeon Road Pigeon, MI 48755', 'active'),
(348, 'Lakeshore Baptist Academy', '(616) 842-824', '13664 Lakeshore Dr Grand Haven, MI 49417', 'active'),
(349, 'Lakeshore High School', '(269) 428-140', '5771 Cleveland Avenue Stevensville, MI 49127', 'active'),
(350, 'Lakeview High School', '(269) 565-370', '15060 S. Helmer Road Battle Creek, MI 49015', 'active'),
(351, 'Lakeville Alternative High School', '(810) 591-335', '8254 Gale Rd Otisville, MI 48463', 'active'),
(352, 'Lakeville High School', '(810) 591-405', '12455 Wilson Road Otisville, MI 48463', 'active'),
(353, 'Lakewood High School', '(616) 374-886', '7223 Velte Rd Lake Odessa, MI 48849', 'active'),
(354, 'Lamphere High School', '(248) 589-394', '610 W. 13 Mile Road Madison Heights, MI 48071', 'active'),
(355, 'Lanse Creuse High School', '(586) 493-527', '23700 Twenty-One Mile Road Macomb, MI 48042-5106', 'active'),
(356, 'Lanse Creuse High School', '(586) 783-640', '38495 L''Anse Creuse Road Harrison Township, MI 48045-3483', 'active'),
(357, 'Lansing Catholic Central High School', '(517) 267-210', '501 N Marshall St Lansing, MI 48912', 'active'),
(358, 'Lansing Christian School', '(517) 882-577', '3405 Belle Chase Way Lansing, MI 48911', 'active'),
(359, 'Lapeer East High School', '(810) 667-241', '933 South Saginaw Street Lapeer, MI 48446-2698', 'active'),
(360, 'Lapeer West High School', '(810) 667-242', '170 Millville Road Lapeer, MI 48446-1644', 'active'),
(361, 'Lasalle High School', '(906) 643-880', 'W429 Portage St Saint Ignace, MI 49781', 'active'),
(362, 'Lawton High School', '(269) 624-419', '68443 29th St Lawton, MI 49065', 'active'),
(363, 'Learning Options High School', '(248) 693-545', '495 E. Scripps Lake Orion, MI 48360', 'active'),
(364, 'Lee High School', '(616) 241-479', '1335 Lee St Sw Wyoming, MI 49509', 'active'),
(365, 'Lee M. Thurston High School', '(313) 535-400', '26255 Schoolcraft Redford, MI 48239', 'active'),
(366, 'Leelanau Peninsula High School', '(231) 256-242', '7401 E. Duck Lake Rd Ste 200 Lake Leelanau, MI 49653', 'active'),
(367, 'Lenawee Christian School', '(517) 265-759', '111 Wolf Creek Hwy Adrian, MI 49221', 'active'),
(368, 'Leslie High School', '(517) 589-829', '4141 Hull Road Leslie, MI 49251', 'active'),
(369, 'Lincoln High School', '(586) 758-830', '22900 Federal Warren, MI 48089', 'active'),
(370, 'Linden High School', '(810) 591-041', '7201 W. Silver Lake Road Linden, MI 48451', 'active'),
(371, 'Litchfield High School', '(517) 542-238', '210 Williams St Litchfield, MI 49252', 'active'),
(372, 'Lowell Senior High School', '(616) 987-290', '11700 Vergennes St Lowell, MI 49331', 'active'),
(373, 'Loy Norrix High School', '(269)337-0200', '606 East Kilgore Road Kalamazoo, MI 49001', 'active'),
(374, 'Loyola High School', '(313) 861-240', '15235 Pinehurst Detroit, MI 48238', 'active'),
(375, 'Ludington High School', '(231) 845-730', '508 N Washington Ave Ludington, MI 49431', 'active'),
(376, 'Lumen Christi Catholic High School', '(517) 787-063', '3483 Spring Arbor Rd Jackson, MI 49203', 'active'),
(377, 'Lutheran High School Northwest', '(248) 852-667', '1000 Bagley Rochester Hills, MI 48309', 'active'),
(378, 'Lutheran High School South', '(734) 586-883', '8210 N. Telegraph Road Newport, MI 48166', 'active'),
(379, 'Mackenzie High School', '(313) 873-990', '9275 Wyoming Street Detroit, MI 48204', 'active'),
(380, 'Macomb Christian Schools', '(586) 751-898', '28501 Lorraine Ave, Warren, MI 48093', 'active'),
(381, 'Madison High School', '(248) 548-180', '915 E. 11 Mile Road Madison Heights, MI 48071', 'active'),
(382, 'Malcolm High School', '(906) 635-663', '460 W. Spruce Street Sault Ste. Marie, MI 49783', 'active'),
(383, 'Manchester High School', '(734) 428-733', '710 E Main St Manchester, MI 48158', 'active'),
(384, 'Manistee High School', '(231) 723-254', '525 Twelfth Street Manistee, MI 49660', 'active'),
(385, 'Manistique High School', '(906)341-4300', '100 North Cedar Street Manistique, MI 49854', 'active'),
(386, 'Manton High School', '(231) 824-641', '105 5th St Manton, MI 49663', 'active'),
(387, 'Maple Valley Jr-sr High School', '(517) 852-927', '11090 Nashville Highway Vermontville, MI 49096', 'active'),
(388, 'Marcellus High School', '(269) 646-508', '303 W. Arbor Marcellus, MI 49067', 'active'),
(389, 'Marian High School', '(248) 644-175', '7225 Lahser Road Bloomfield Hills, MI 48301', 'active'),
(390, 'Marine City High School', '(810) 676-190', '1085 Ward Street Marine City, MI 48039', 'active'),
(391, 'Marion High School', '(231) 743-283', '2213 Twenty Mile Road Marion, MI 49665', 'active'),
(392, 'Marlette High School', '(989) 635-494', '3051 Moore St. Marlette, MI 48453', 'active'),
(393, 'Marquette Senior High School', '(906) 225-535', '1201 West Fair Avenue Marquette, MI 49855', 'active'),
(394, 'Marshall High School', '(269) 781-125', '701 N. Marshall Avenue Marshall, MI 49068', 'active'),
(395, 'Marysville High School', '(810) 364-716', '1325 Michigan Avenue Marysville, MI 48040', 'active'),
(396, 'Mason County Central High School', '(231)-757-474', '210 W. Broadway Scottville, MI 49454', 'active'),
(397, 'Mason High School', '(734) 848-575', '2400 Mason Eagles Drive Erie, MI 48133', 'active'),
(398, 'Mattawan High School', '(269) 668-336', '56720 Murray St Mattawan, MI 49071', 'active'),
(399, 'Mayville High School', '(989) 843-611', '6250 Fulton St Mayville, MI 48744', 'active'),
(400, 'Mcbain High School', '(231) 825-241', '107 E. Maple Street McBain, Michigan 49657', 'active'),
(401, 'Melvindale High School', '(313) 389-332', '18656 Prospect St Melvindale, MI 48122', 'active'),
(402, 'Memphis High School', '(810) 392-218', '34130 Bordman Rd Memphis, MI 48041', 'active'),
(403, 'Menominee High School', '(906) 863-781', '2101 18th St Menominee, MI 49858', 'active'),
(404, 'Mercy High School', '(248) 476-802', '29300 W. 11 Mile Road Farmington Hills, MI 48336-1409', 'active'),
(405, 'Meridian High School', '(989) 687-330', '3303 N Meridian Rd Sanford, MI 48657', 'active'),
(406, 'Meridian High School', '(517) 339-606', '1590 Franklin St Haslett, MI 48840', 'active'),
(407, 'Merrill High School', '(989) 643-723', '555 W Alice St Merrill, MI 48637', 'active'),
(408, 'Mesick High School', '(231) 885-120', '581 S. Clark Street, PO Box 275 Mesick, MI 49668', 'active'),
(409, 'Michigan Center Jr-sr High School', '(517) 764-144', '400 S State St Michigan Center, MI 49254', 'active'),
(410, 'Michigan Lutheran High School', '(269) 429-786', '615 E. Marquette Woods Road St. Joseph, MI 49085', 'active'),
(411, 'Michigan Technical Academy High School', '(313) 537-931', '23750 Elmira Redford, MI 48239', 'active'),
(412, 'Midland Christian School', '(989)835-9881', '4417 W. Wackerly Road Midland, MI 48640', 'active'),
(413, 'Milan High School', '(734) 439-500', '200 Big Red Drive Milan, MI 48160', 'active'),
(414, 'Milford High School', '(248) 684-809', '2380 S Milford Rd Highland, MI 48357', 'active'),
(415, 'Millington High School', '(989) 871-522', '8780 Dean Drx Millington, MI 48746', 'active'),
(416, 'Mio Ausable High School', '(989) 826-240', '1110 West Eighth Street Mio, Michigan 48647', 'active'),
(417, 'Mona Shores High School', '(231) 780-471', '1121 Seminole Road Norton Shores, MI 49441', 'active'),
(418, 'Montabella High School', '(989) 427-517', '1456 N County Line Rd Blanchard, MI 49310', 'active'),
(419, 'Montague High School', '(231) 894-266', '4900 Stanton Blvd. Montague, MI 49437', 'active'),
(420, 'Morenci High School', '(517) 458-750', '788 Coomer St Morenci, MI 49256', 'active'),
(421, 'Morley Stanwood High School', '(231) 856-444', '4700 Northland Dr Morley, MI 49336', 'active'),
(422, 'Morrice Jr Sr High School', '(517) 625-314', '691 Purdy Ln, Morrice, MI 48857', 'active'),
(423, 'Mott Middle College High School', '(810) 232-853', '1401 E. Court Street Flint, MI 48503', 'active'),
(424, 'Mount Clemens High School', '(586) 461-340', '155 Cass Avenue Mount Clemens, MI 48043', 'active'),
(425, 'Mt. Pleasant Senior High School', '(989) 775-220', '1155 S. Elizabeth Street Mount Pleasant, MI 48858', 'active'),
(426, 'Mumford High School', '(313) 494-706', '17525 Wyoming St Detroit, MI 48221', 'active'),
(427, 'Munising High School', '(906) 387-210', '810 Highway M-28 West Munising, MI 49862', 'active'),
(428, 'Murray-wright High School', '(313) 596-355', '2001 W Warren Ave Detroit, MI 48208', 'active'),
(429, 'Muskegon High School', '(231) 720-280', '80 W Southern Ave Muskegon, MI 49441', 'active'),
(430, 'Napoleon High School', '(517) 536-866', '201 West Ave. Napoleon, MI 49261', 'active'),
(431, 'Negaunee High School', '(906) 475-786', '101 S Pioneer Ave Negaunee, MI 49866', 'active'),
(432, 'Neil E. Reid High School', '(586) 469-159', '37701 Harper Avenue Clinton Township, MI 48036', 'active'),
(433, 'New Beginnings Alternative High School', '(616) 696-120', '204 E Muskegon St Cedar Springs, MI 49319', 'active'),
(434, 'New Buffalo Senior High School', '(269) 469-600', '1112 E Clay St New Buffalo, MI 49117', 'active'),
(435, 'New Directions High School', '(231)-796-348', '14980 215th Ave. Big Rapids, Michigan 49307', 'active'),
(436, 'New Haven High School', '(586) 749-510', '57700 Gratiot Avenue New Haven, MI 48048', 'active'),
(437, 'New Lothrop High School', '(810) 638-505', '9285 Easton Road New Lothrop, MI 48460', 'active'),
(438, 'Newaygo High School', '(231) 652-164', '200 East Street P.O. Box 820 Newaygo, MI 49337', 'active'),
(439, 'Newberry High School', '(906) 293-324', '700 Newberry Ave Newberry, MI 49868', 'active'),
(440, 'Niles Senior High School', '(269) 683-289', '1441 Eagle St Niles, MI 49120', 'active'),
(441, 'North Adams High School', '(517) 287-421', '4555 Knowles Rd North Adams, MI 49262', 'active'),
(442, 'North Branch High School', '(810) 688-300', '6598 Brush Street North Branch, MI 48461', 'active'),
(443, 'North Central Area Junior-senior High School', '(906) 497-522', 'W3795 Hwy Us 2 & 41 Powers, MI 49874', 'active'),
(444, 'North Farmington High School', '(248) 785-200', '32900 W. 13 Mile Road Farmington Hills, MI 48334', 'active'),
(445, 'North Muskegon High School', '(231) 719-411', '1600 Mills Ave North Muskegon, MI 49445', 'active'),
(446, 'North Sharon Christian School', '(734) 475-979', '17999 Washburn Rd Grass Lake, MI 49240', 'active'),
(447, 'Northern High School', '(313) 873-125', '9026 Woodward Ave Detroit, MI 48202', 'active'),
(448, 'Northview Alternative High School', '(616) 361-739', '3801 E Beltline Ave NE Grand Rapids, MI 49525', 'active'),
(449, 'Northville High School', '(248) 344-842', '45700 6 Mile Rd Northville, MI 48168', 'active'),
(450, 'Northwest Alternative High School', '(517) 569-370', '4100 Van Horn Road Jackson, MI 49201', 'active'),
(451, 'Northwest High School', '(517) 569-224', '4200 Van Horn Rd Jackson, MI 49201', 'active'),
(452, 'Northwestern High School', '(313) 596-070', '2200 W Grand Blvd Detroit, MI 48208', 'active'),
(453, 'Notre Dame High School', '(313) 371-896', '20254 Kelly Road Harper Woods, MI 48225', 'active'),
(454, 'Nouvel Catholic Central High School', '(989) 791-433', '2555 Wieneke Rd. Saginaw, MI 48603', 'active'),
(455, 'Novi High School', '(248) 449-150', '24062 Taft Rd Novi, MI 48375', 'active'),
(456, 'Oak Park High School', '(248) 336-774', '13701 Oak Park Blvd. Oak Park, MI 48237', 'active'),
(457, 'Oakridge High School', '(231) 788-730', '5493 Hall Rd Muskegon, MI 49442', 'active'),
(458, 'Oceana High School', '(231) 894-558', '2930 W Winston Rd Rothbury, MI 49452', 'active'),
(459, 'Odyssey Middle-high School', '(989) 773-947', '3441 S. Wise Road Mount Pleasant, MI 48858', 'active'),
(460, 'Ogemaw Heights High School', '(989) 343-202', '960 S M 33 West Branch, MI 48661', 'active'),
(461, 'Okemos High School', '(517) 351-790', '2800 Jolly Rd Okemos, MI 48864', 'active'),
(462, 'Olivet High School', '(269) 749-367', '255 1st St Olivet, MI 49076', 'active'),
(463, 'Onaway Senior High School', '(989) 733-480', '4549 S. M-33 Highway Onaway, MI 49765', 'active'),
(464, 'Onsted Community High School', '(517) 467-217', '10109 Slee Rd # 10 Onsted, MI 49265', 'active'),
(465, 'Ontonagon Area Jr-sr High School', '(906) 884-443', '701 Parker Avenue Ontonagon, MI 49953', 'active'),
(466, 'Orchard View High School', '(231) 760-140', '16 N. Quarterline Muskegon, MI 49442', 'active'),
(467, 'Osborn High School', '(313) 866-034', '11600 E 7 Mile Rd Detroit, MI 48205', 'active'),
(468, 'Oscar Carlson High School', '(734) 379-710', '30550 W. Jefferson Avenue Gibraltar, MI 48173', 'active'),
(469, 'Oscoda High School', '(989) 739-912', '3550 E. River Road Oscoda, MI 48750', 'active'),
(470, 'Otsego High School', '(269) 692-616', '550 Washington Street Otsego, MI 49078', 'active'),
(471, 'Ottawa Hills High School', '(616) 819-725', '2055 Rosewood Ave SE Grand Rapids, MI 49506', 'active'),
(472, 'Ovid Elsie High School', '(989) 834-227', '8989 Colony Rd. Elsie, MI 48831', 'active'),
(473, 'Owosso High School', '(989) 723-823', '765 E. North St. Owosso, MI 48867', 'active'),
(474, 'Oxford High School', '(248) 969-510', '745 N. Oxford Rd. Oxford, MI 48371', 'active'),
(475, 'Parchment High School', '(269) 488-110', '1916 East G Avenue Parchment, MI 49004', 'active'),
(476, 'Paw Paw High School', '(269) 657-884', '30609 Red Arrow Hwy Paw Paw, MI 49079', 'active'),
(477, 'Peck Community High School', '(810) 378-550', '222 E Lapeer St Peck, MI 48466', 'active'),
(478, 'Pellston High School', '(231) 539-880', '172 Park St Pellston, MI 49769', 'active'),
(479, 'Quincy High School', '(517) 639-924', '18 Colfax St Quincy, MI 49082', 'active'),
(480, 'Ravenna High School', '(231) 853-221', '2766 S Ravenna Rd Ravenna, MI 49451', 'active'),
(481, 'Reading Jr/Sr High School', '(517) 283-214', '301 Chestnut St Reading, MI 49274', 'active'),
(482, 'Redford High School', '(248) 799-278', '8001 West Outer Drive Detroit, MI 48235', 'active'),
(483, 'Redford Union High School', '(313) 242-420', '17711 Kinloch Redford, MI 48240', 'active'),
(484, 'Reed City High School', '(231) 832-222', '225 W Church Ave Reed City, MI 49677', 'active'),
(485, 'Reese High School', '(989) 868-419', '1696 S Van Buren Rd Reese, MI 48757', 'active'),
(486, 'Reeths Puffer High School', '(231) 744-164', '1545 North Roberts Rd. Muskegon, MI 49445', 'active'),
(487, 'Regina High School', '(586) 585-050', '13900 Masonic Blvd Warren, Michigan 48088', 'active'),
(488, 'Renaissance High School', '(313) 494-721', '6565 W. Outer Drive Detroit, MI 48235', 'active'),
(489, 'Richmond Community High School', '(586) 727-322', '35320 Division Road Richmond, MI 48062', 'active'),
(490, 'River Rouge High School', '(313) 297-960', '1460 W. Coolidge Hwy. River Rouge, MI 48218', 'active'),
(491, 'River Valley High School', '(269) 756-954', '15480 Three Oaks Rd Three Oaks, MI 49128', 'active'),
(492, 'Riverview Community High School', '(734) 285-736', '12431 Longsdorf Street Riverview, MI 48193', 'active'),
(493, 'Riverview East High School', '(810) 676-160', '301 N. Sixth Street St. Clair, MI 48079', 'active'),
(494, 'Rochester High School', '(248) 726-540', '180 S Livernois Rd Rochester Hills, MI 48307', 'active'),
(495, 'Rockford High School', '(616) 863-603', '4100 Kroes Rockford, MI 49341', 'active'),
(496, 'Rogers High School', '(616) 530-758', '1350 Prairie Pkwy SW Wyoming, MI 49509', 'active');
INSERT INTO `School` (`school_id`, `name`, `phone`, `address`, `status`) VALUES
(497, 'Romeo High School', '(586) 752-030', '11091 W. 32 Mile Road Romeo, MI 48065', 'active'),
(498, 'Romulus High School', '(734) 532-195', '39000 Superior St Romulus, MI 48174', 'active'),
(499, 'Roosevelt High School', '(734) 246-100', '540 Eureka Avenue Wyandotte, MI 48192', 'active'),
(500, 'Roscommon High School PO Box 825,', '(989) 275-667', '10600 Oakwood Rd, Roscommon, MI 48653', 'active'),
(501, 'Roseville High School', '(586) 445-554', '17855 Common Road Roseville, MI 48066', 'active'),
(502, 'Ross Beatty High School', '(269) 445-054', 'Diamond Cove Road Cassopolis, MI 49031', 'active'),
(503, 'Rudyard High School', '(906) 478-347', '11185 West Second Street P.O. Box 246 Rudyard, MI 49780', 'active'),
(504, 'Saginaw High School', '(989) 399-600', '3100 Webber St Saginaw, MI 48601', 'active'),
(505, 'Saint Clair High School', '(810) 676-170', '2200 Clinton Avenue St. Clair, MI 48079', 'active'),
(506, 'Salem High School', '(734) 416-280', '46181 Joy Road Canton, MI 48187', 'active'),
(507, 'Saline High School', '(734) 429-803', '1300 Campus Pkwy Saline, MI 48176', 'active'),
(508, 'Sand Creek High School', '(517) 436-312', '6518 Sand Creek Highway Sand Creek, MI 49279', 'active'),
(509, 'Sandusky High School', '(810) 648-340', '191 Pine Tree Lane. Sandusky, MI 48471', 'active'),
(510, 'Saranac High School', '(616) 642-110', '150 S. Pleasant, Saranac, MI 48881', 'active'),
(511, 'Saugatuck High School', '(810) 648-340', '191 Pine Tree Lane. Sandusky, MI 48471', 'active'),
(512, 'Saugatuck High School', '(269) 857-213', '401 Elizabeth St Saugatuck, MI 49453', 'active'),
(513, 'Sault Area High School', '(906) 635-660', '904 Marquette Ave Sault Ste Marie, MI 49783', 'active'),
(514, 'Schoolcraft High School', '(269) 488-735', '551 E Lyons St Schoolcraft, MI 49087', 'active'),
(515, 'Shelby High School', '(231) 861-445', '641 N State St Shelby, MI 49455', 'active'),
(516, 'Shepherd High School', '(989) 828-660', '100 Hall St. Shepherd, MI 48883', 'active'),
(517, 'Shrine Catholic High School', '(248) 549-292', '3500 W 13 Mile Rd Royal Oak, MI 48073', 'active'),
(518, 'South Christian High School', '(616) 455-321', '160 68th Street SW Grand Rapids, MI 49548', 'active'),
(519, 'South Lake High School', '(586) 435-140', '21900 East Nine Mile Road St. Clair Shores, MI 48080', 'active'),
(520, 'South Lyon East High School', '(248) 573-870', '52200 10 Mile Rd South Lyon, MI 48178', 'active'),
(521, 'Southeastern High School', '(313) 866-450', '3030 Fairview Street Detroit, MI 48214', 'active'),
(522, 'Southfield High School', '(248) 746-860', '24675 Lahser Rd. Southfield, MI 48033', 'active'),
(523, 'Southfield-lathrup High School', '(248) 746-720', '19301 West Twelve Mile Road Lathrup Village, MI 48076', 'active'),
(524, 'Southgate Anderson High School', '(734) 246-461', '15475 Leroy St Southgate, MI 48195', 'active'),
(525, 'Southwestern High School', '(313) 849-452', '6921 W. Fort Street Detroit, MI 48209', 'active'),
(526, 'Sparta High School', '(616) 887-821', '475 W Spartan Drive Sparta, MI 49345', 'active'),
(527, 'Spring Lake High School', '(616) 846-550', '16140 148th Avenue Spring Lake, MI 49456', 'active'),
(528, 'Springport High School', '(517) 857-347', '300 W. Main St. Springport, MI 49284', 'active'),
(529, 'St Martin Deporres High School', '(313) 864-333', '13436 Grove St Detroit, MI 48235', 'active'),
(530, 'St Mary Cathedral Jr Sr High School', '(989) 732-530', '310 W Mitchell Street Gaylord, MI 49735', 'active'),
(531, 'St Thomas More Academy', '(810) 742-241', '6456 E Bristol Rd Burton, MI 48519', 'active'),
(532, 'St. Charles High School', '(989) 865-999', '881 West Walnut St. St. Charles, MI 48655', 'active'),
(533, 'St. Johns High School', '(989) 227-400', '501 W Sickles St St Johns, MI 48879', 'active'),
(534, 'St. Louis High School', '(989) 681-250', '113 E Saginaw St St Louis, MI 48880', 'active'),
(535, 'Standish-Sterling Central High School', '(989) 846-366', '2401 Grove Street Rd Standish, MI 48658', 'active'),
(536, 'Sterling Heights Senior High School', '(586) 825-270', '12901 15 Mile Rd Sterling Heights, MI 48312', 'active'),
(537, 'Stockbridge High School', '(517) 851-777', '416 N Clinton St Stockbridge, MI 49285', 'active'),
(538, 'Stone High School', '(734) 971-266', '2800 Stone School Road Ann Arbor, MI 48104', 'active'),
(539, 'Stoney Creek High School', '(248) 726-570', '575 E Tienken Rd Rochester Hills, MI 48306', 'active'),
(540, 'Sturgis High School', '(269) 659-151', '216 Vinewood Avenue Sturgis, MI 49091', 'active'),
(541, 'Summerfield High School', '(734) 279-101', '17555 Ida West Rd. Petersburg, MI 49270', 'active'),
(542, 'Suttons Bay Senior High School', '(231) 271-860', '500 S Elm St Suttons Bay, MI 49682', 'active'),
(543, 'Swan Valley High School', '(989) 921-240', '8400 Ohern Rd Saginaw, MI 48609', 'active'),
(544, 'Swartz Creek High School', '(810) 591-180', 'One Dragon Drive Swartz Creek, MI 48473', 'active'),
(545, 'Tawas Area High School', '(989) 984-210', '255 W M 55 Tawas City, MI 48763', 'active'),
(546, 'Tecumseh High School', '(517) 423-600', '760 Brown St. Tecumseh, MI 49286', 'active'),
(547, 'Tekonsha Senior High School', '(517) 767-412', '245 S Elm St Tekonsha, MI 49092', 'active'),
(548, 'Thornapple Kellogg High School', '(269) 795-339', '3885 Bender, Middleville, MI 49333', 'active'),
(549, 'Three Rivers High School', '(269) 279-112', '700 6th Avenue Three Rivers, MI 49093', 'active'),
(550, 'Trenton High School', '(734) 692-453', '2601 Charlton Road Trenton, MI 48183', 'active'),
(551, 'Tri County Senior High School', '(231) 937-433', '21338 Kendaville Road Howard City, MI 49329', 'active'),
(552, 'Trinity Catholic High School', '(313) 886-146', '19360 Harper Ave Harper Woods, MI 48225', 'active'),
(553, 'Troy High School', '(248) 823-270', '4777 Northfield Pkwy Troy, MI 48098', 'active'),
(554, 'Ubly Community High School', '(989) 658-855', '2020 Union St Ubly, MI 48475', 'active'),
(555, 'Union City High School', '(517) 741-856', '430 St. Joseph Street Union City, MI 49094', 'active'),
(556, 'Union High School', '(269) 782-442', '701 W. Prairie Ronde Street Dowagiac, MI 49047', 'active'),
(557, 'Unity Christian High Schools', '(616) 669-182', '3487 Oak Street Hudsonville, MI 49426', 'active'),
(558, 'Utica High School', '(586) 797-220', '47255 Shelby Rd. Utica, MI 48317', 'active'),
(559, 'Valley Christian Academy', '(810) 742-450', '3266 South Genesee Rd Burton, MI 48519', 'active'),
(560, 'Valley Lutheran High School', '(989) 790-167', '3560 McCarty Saginaw, MI 48603', 'active'),
(561, 'Vassar Senior High School', '(989) 823-853', '220 Athletic St Vassar, MI 48768', 'active'),
(562, 'Vestaburg Community High School', '(989) 268-528', '7188 Avenue B Vestaburg, MI 48891', 'active'),
(563, 'Vicksburg High School', '(269) 321-110', '501 East Highway St Vicksburg, MI 49097', 'active'),
(564, 'Voyageur Consortium High School', '(313) 964-233', '1250 Rosa Parks Blvd Detroit, MI 48216', 'active'),
(565, 'Walled Lake Central High School', '(248) 956-470', '1600 Oakley Park Road Commerce, MI 48390', 'active'),
(566, 'Walled Lake Northern High School', '(248) 956-530', '6000 Bogie Lake Rd Commerce Township, MI 48382', 'active'),
(567, 'Walled Lake Western High School', '(248) 956-440', '600 Beck Road Commerce, MI 48390', 'active'),
(568, 'Warren Mott High School', '(586) 574-325', '3131 E. 12 Mile Road Warren, MI 48092', 'active'),
(569, 'Warren Woods Enterprise High School', '(586) 439-440', '28600 Suburban Dr Warren, MI 48088', 'active'),
(570, 'Warren Woods Tower High School', '(586) 439-440', '27900 Bunert Road Warren, MI 48088', 'active'),
(571, 'Waterford Mott High School', '(248) 674-413', '1151 Scott Lake Road Waterford, MI 48328', 'active'),
(572, 'Watervliet Senior High School', '(269) 463-422', '450 E. Red Arrow Highway Watervliet, Michigan 49098', 'active'),
(573, 'Waverly Senior High School', '(517) 323-383', '160 Snow Rd Lansing, MI 48917', 'active'),
(574, 'Wayland Union High School', '(269) 792-225', '870 E. Superior St. Wayland, MI 49348', 'active'),
(575, 'Wayne Memorial High School', '(734) 419-220', '3001 Fourth Street Wayne, Michigan 48184', 'active'),
(576, 'Webberville Middle-high School', '(517) 521-344', '309 E. Grand River Avenue Webberville, MI 48892', 'active'),
(577, 'West Bloomfield High School', '(248) 865-672', '4925 Orchard Lake Rd West Bloomfield, MI 48323', 'active'),
(578, 'West Catholic High School', '(616) 453-446', '1801 Bristol Ave NW Grand Rapids, MI 49504', 'active'),
(579, 'West Ottawa High School', '(616) 994-500', '3685 Butternut Drive Holland, MI 49424', 'active'),
(580, 'Western High School', '(989) 662-448', '500 W. Midland Road Auburn, MI 48611', 'active'),
(581, 'Western High School', '(517) 841-820', '1400 S. Dearing Rd. Parma, MI 49269', 'active'),
(582, 'Western International High School', '(313) 849-475', '1500 Scotten Street Detroit, MI 48209', 'active'),
(583, 'Western Michigan Christian High School', '(231) 799-964', '455 E. Ellis Road Muskegon, MI 49441', 'active'),
(584, 'Westwood High School', '(906) 485-102', '300 S Westwood Dr Ishpeming, MI 49849', 'active'),
(585, 'White Pigeon Jr-sr High School', '(269) 483-767', '410 Prairie Ave White Pigeon, MI 49099', 'active'),
(586, 'Whitehall Senior High School', '(231) 893-102', '3100 White Lake Drive Whitehall, MI 49461', 'active'),
(587, 'Whitmore Lake High School', '(734) 449-446', '7430 Whitmore Lake Road Whitmore Lake, MI 48189', 'active'),
(588, 'Whittemore-prescott Area High School', '(989) 759-250', '6001 Mills Road Whittemore, MI 48770', 'active'),
(589, 'Williamston High School', '(517) 655-214', '3939 Vanneter Rd Williamston, MI 48895', 'active'),
(590, 'Willow Run High School', '(734) 481-830', '235 Spencer Lane Ypsilanti, Michigan 48198', 'active'),
(591, 'Windover High School', '(989) 832-085', '32 S. Homer Road Midland, MI 48640', 'active'),
(592, 'Wolverine Middle-high School', '(231) 525-905', '13131 Brook Street Wolverine, MI 49799', 'active'),
(593, 'Woodhaven High School', '(734) 783-333', '24787 Van Horn Road Brownstown, MI 48134', 'active'),
(594, 'Wyoming Park High School', '(616) 530-756', '2125 Wrenwood, Wyoming, MI 49519', 'active'),
(595, 'Yale Senior High School', '(810) 387-323', '247 School Dr Yale, MI 48097', 'active'),
(596, 'Ypsilanti High School', '(734) 714-100', '2095 Packard Rd Ypsilanti, MI 48197', 'active'),
(597, 'Zeeland East High School', '(616) 748-310', '3333 96th Ave Zeeland, MI 49464', 'active'),
(598, 'Zeeland West High School', '(616) 748-450', '3390 100th Avenue Zeeland, MI 49464', 'active'),
(599, 'Zion Christian School', '(616) 878-947', '7555 Byron Center Ave. Byron Center, MI 49315', 'active'),
(600, 'Saginaw Valley State University', '(989)372-1799', '7400 Bay Rd', 'active'),
(601, 'Saginaw Career Complex', '(989)399-6150', '2102 Weiss Saginaw, MI 48602', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `Team`
--

CREATE TABLE IF NOT EXISTS `Team` (
  `team_id` int(11) NOT NULL auto_increment,
  `member1` int(11) NOT NULL,
  `member2` int(11) default NULL,
  `member3` int(11) default NULL,
  `school` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `coach` int(11) NOT NULL,
  `competition_id` int(11) NOT NULL,
  `type` enum('School','Test') NOT NULL,
  PRIMARY KEY  (`team_id`,`competition_id`),
  KEY `school` (`school`,`coach`),
  KEY `member1` (`member1`,`member2`,`member3`,`coach`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Team`
--

--
-- Database: `information_schema`
--
CREATE DATABASE `information_schema` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `information_schema`;

-- --------------------------------------------------------

--
-- Table structure for table `CHARACTER_SETS`
--

CREATE TEMPORARY TABLE `CHARACTER_SETS` (
  `CHARACTER_SET_NAME` varchar(64) NOT NULL default '',
  `DEFAULT_COLLATE_NAME` varchar(64) NOT NULL default '',
  `DESCRIPTION` varchar(60) NOT NULL default '',
  `MAXLEN` bigint(3) NOT NULL default '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CHARACTER_SETS`
--

INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES
('big5', 'big5_chinese_ci', 'Big5 Traditional Chinese', 2),
('dec8', 'dec8_swedish_ci', 'DEC West European', 1),
('cp850', 'cp850_general_ci', 'DOS West European', 1),
('hp8', 'hp8_english_ci', 'HP West European', 1),
('koi8r', 'koi8r_general_ci', 'KOI8-R Relcom Russian', 1),
('latin1', 'latin1_swedish_ci', 'cp1252 West European', 1),
('latin2', 'latin2_general_ci', 'ISO 8859-2 Central European', 1),
('swe7', 'swe7_swedish_ci', '7bit Swedish', 1),
('ascii', 'ascii_general_ci', 'US ASCII', 1),
('ujis', 'ujis_japanese_ci', 'EUC-JP Japanese', 3),
('sjis', 'sjis_japanese_ci', 'Shift-JIS Japanese', 2),
('hebrew', 'hebrew_general_ci', 'ISO 8859-8 Hebrew', 1),
('tis620', 'tis620_thai_ci', 'TIS620 Thai', 1),
('euckr', 'euckr_korean_ci', 'EUC-KR Korean', 2),
('koi8u', 'koi8u_general_ci', 'KOI8-U Ukrainian', 1),
('gb2312', 'gb2312_chinese_ci', 'GB2312 Simplified Chinese', 2),
('greek', 'greek_general_ci', 'ISO 8859-7 Greek', 1),
('cp1250', 'cp1250_general_ci', 'Windows Central European', 1),
('gbk', 'gbk_chinese_ci', 'GBK Simplified Chinese', 2),
('latin5', 'latin5_turkish_ci', 'ISO 8859-9 Turkish', 1),
('armscii8', 'armscii8_general_ci', 'ARMSCII-8 Armenian', 1),
('utf8', 'utf8_general_ci', 'UTF-8 Unicode', 3),
('ucs2', 'ucs2_general_ci', 'UCS-2 Unicode', 2),
('cp866', 'cp866_general_ci', 'DOS Russian', 1),
('keybcs2', 'keybcs2_general_ci', 'DOS Kamenicky Czech-Slovak', 1),
('macce', 'macce_general_ci', 'Mac Central European', 1),
('macroman', 'macroman_general_ci', 'Mac West European', 1),
('cp852', 'cp852_general_ci', 'DOS Central European', 1),
('latin7', 'latin7_general_ci', 'ISO 8859-13 Baltic', 1),
('cp1251', 'cp1251_general_ci', 'Windows Cyrillic', 1),
('cp1256', 'cp1256_general_ci', 'Windows Arabic', 1),
('cp1257', 'cp1257_general_ci', 'Windows Baltic', 1),
('binary', 'binary', 'Binary pseudo charset', 1),
('geostd8', 'geostd8_general_ci', 'GEOSTD8 Georgian', 1),
('cp932', 'cp932_japanese_ci', 'SJIS for Windows Japanese', 2),
('eucjpms', 'eucjpms_japanese_ci', 'UJIS for Windows Japanese', 3);

-- --------------------------------------------------------

--
-- Table structure for table `COLLATIONS`
--

CREATE TEMPORARY TABLE `COLLATIONS` (
  `COLLATION_NAME` varchar(64) NOT NULL default '',
  `CHARACTER_SET_NAME` varchar(64) NOT NULL default '',
  `ID` bigint(11) NOT NULL default '0',
  `IS_DEFAULT` varchar(3) NOT NULL default '',
  `IS_COMPILED` varchar(3) NOT NULL default '',
  `SORTLEN` bigint(3) NOT NULL default '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COLLATIONS`
--

INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES
('big5_chinese_ci', 'big5', 1, 'Yes', 'Yes', 1),
('big5_bin', 'big5', 84, '', 'Yes', 1),
('dec8_swedish_ci', 'dec8', 3, 'Yes', 'Yes', 1),
('dec8_bin', 'dec8', 69, '', 'Yes', 1),
('cp850_general_ci', 'cp850', 4, 'Yes', 'Yes', 1),
('cp850_bin', 'cp850', 80, '', 'Yes', 1),
('hp8_english_ci', 'hp8', 6, 'Yes', 'Yes', 1),
('hp8_bin', 'hp8', 72, '', 'Yes', 1),
('koi8r_general_ci', 'koi8r', 7, 'Yes', 'Yes', 1),
('koi8r_bin', 'koi8r', 74, '', 'Yes', 1),
('latin1_german1_ci', 'latin1', 5, '', 'Yes', 1),
('latin1_swedish_ci', 'latin1', 8, 'Yes', 'Yes', 1),
('latin1_danish_ci', 'latin1', 15, '', 'Yes', 1),
('latin1_german2_ci', 'latin1', 31, '', 'Yes', 2),
('latin1_bin', 'latin1', 47, '', 'Yes', 1),
('latin1_general_ci', 'latin1', 48, '', 'Yes', 1),
('latin1_general_cs', 'latin1', 49, '', 'Yes', 1),
('latin1_spanish_ci', 'latin1', 94, '', 'Yes', 1),
('latin2_czech_cs', 'latin2', 2, '', 'Yes', 4),
('latin2_general_ci', 'latin2', 9, 'Yes', 'Yes', 1),
('latin2_hungarian_ci', 'latin2', 21, '', 'Yes', 1),
('latin2_croatian_ci', 'latin2', 27, '', 'Yes', 1),
('latin2_bin', 'latin2', 77, '', 'Yes', 1),
('swe7_swedish_ci', 'swe7', 10, 'Yes', 'Yes', 1),
('swe7_bin', 'swe7', 82, '', 'Yes', 1),
('ascii_general_ci', 'ascii', 11, 'Yes', 'Yes', 1),
('ascii_bin', 'ascii', 65, '', 'Yes', 1),
('ujis_japanese_ci', 'ujis', 12, 'Yes', 'Yes', 1),
('ujis_bin', 'ujis', 91, '', 'Yes', 1),
('sjis_japanese_ci', 'sjis', 13, 'Yes', 'Yes', 1),
('sjis_bin', 'sjis', 88, '', 'Yes', 1),
('hebrew_general_ci', 'hebrew', 16, 'Yes', 'Yes', 1),
('hebrew_bin', 'hebrew', 71, '', 'Yes', 1),
('tis620_thai_ci', 'tis620', 18, 'Yes', 'Yes', 4),
('tis620_bin', 'tis620', 89, '', 'Yes', 1),
('euckr_korean_ci', 'euckr', 19, 'Yes', 'Yes', 1),
('euckr_bin', 'euckr', 85, '', 'Yes', 1),
('koi8u_general_ci', 'koi8u', 22, 'Yes', 'Yes', 1),
('koi8u_bin', 'koi8u', 75, '', 'Yes', 1),
('gb2312_chinese_ci', 'gb2312', 24, 'Yes', 'Yes', 1),
('gb2312_bin', 'gb2312', 86, '', 'Yes', 1),
('greek_general_ci', 'greek', 25, 'Yes', 'Yes', 1),
('greek_bin', 'greek', 70, '', 'Yes', 1),
('cp1250_general_ci', 'cp1250', 26, 'Yes', 'Yes', 1),
('cp1250_czech_cs', 'cp1250', 34, '', 'Yes', 2),
('cp1250_croatian_ci', 'cp1250', 44, '', 'Yes', 1),
('cp1250_bin', 'cp1250', 66, '', 'Yes', 1),
('gbk_chinese_ci', 'gbk', 28, 'Yes', 'Yes', 1),
('gbk_bin', 'gbk', 87, '', 'Yes', 1),
('latin5_turkish_ci', 'latin5', 30, 'Yes', 'Yes', 1),
('latin5_bin', 'latin5', 78, '', 'Yes', 1),
('armscii8_general_ci', 'armscii8', 32, 'Yes', 'Yes', 1),
('armscii8_bin', 'armscii8', 64, '', 'Yes', 1),
('utf8_general_ci', 'utf8', 33, 'Yes', 'Yes', 1),
('utf8_bin', 'utf8', 83, '', 'Yes', 1),
('utf8_unicode_ci', 'utf8', 192, '', 'Yes', 8),
('utf8_icelandic_ci', 'utf8', 193, '', 'Yes', 8),
('utf8_latvian_ci', 'utf8', 194, '', 'Yes', 8),
('utf8_romanian_ci', 'utf8', 195, '', 'Yes', 8),
('utf8_slovenian_ci', 'utf8', 196, '', 'Yes', 8),
('utf8_polish_ci', 'utf8', 197, '', 'Yes', 8),
('utf8_estonian_ci', 'utf8', 198, '', 'Yes', 8),
('utf8_spanish_ci', 'utf8', 199, '', 'Yes', 8),
('utf8_swedish_ci', 'utf8', 200, '', 'Yes', 8),
('utf8_turkish_ci', 'utf8', 201, '', 'Yes', 8),
('utf8_czech_ci', 'utf8', 202, '', 'Yes', 8),
('utf8_danish_ci', 'utf8', 203, '', 'Yes', 8),
('utf8_lithuanian_ci', 'utf8', 204, '', 'Yes', 8),
('utf8_slovak_ci', 'utf8', 205, '', 'Yes', 8),
('utf8_spanish2_ci', 'utf8', 206, '', 'Yes', 8),
('utf8_roman_ci', 'utf8', 207, '', 'Yes', 8),
('utf8_persian_ci', 'utf8', 208, '', 'Yes', 8),
('utf8_esperanto_ci', 'utf8', 209, '', 'Yes', 8),
('utf8_hungarian_ci', 'utf8', 210, '', 'Yes', 8),
('ucs2_general_ci', 'ucs2', 35, 'Yes', 'Yes', 1),
('ucs2_bin', 'ucs2', 90, '', 'Yes', 1),
('ucs2_unicode_ci', 'ucs2', 128, '', 'Yes', 8),
('ucs2_icelandic_ci', 'ucs2', 129, '', 'Yes', 8),
('ucs2_latvian_ci', 'ucs2', 130, '', 'Yes', 8),
('ucs2_romanian_ci', 'ucs2', 131, '', 'Yes', 8),
('ucs2_slovenian_ci', 'ucs2', 132, '', 'Yes', 8),
('ucs2_polish_ci', 'ucs2', 133, '', 'Yes', 8),
('ucs2_estonian_ci', 'ucs2', 134, '', 'Yes', 8),
('ucs2_spanish_ci', 'ucs2', 135, '', 'Yes', 8),
('ucs2_swedish_ci', 'ucs2', 136, '', 'Yes', 8),
('ucs2_turkish_ci', 'ucs2', 137, '', 'Yes', 8),
('ucs2_czech_ci', 'ucs2', 138, '', 'Yes', 8),
('ucs2_danish_ci', 'ucs2', 139, '', 'Yes', 8),
('ucs2_lithuanian_ci', 'ucs2', 140, '', 'Yes', 8),
('ucs2_slovak_ci', 'ucs2', 141, '', 'Yes', 8),
('ucs2_spanish2_ci', 'ucs2', 142, '', 'Yes', 8),
('ucs2_roman_ci', 'ucs2', 143, '', 'Yes', 8),
('ucs2_persian_ci', 'ucs2', 144, '', 'Yes', 8),
('ucs2_esperanto_ci', 'ucs2', 145, '', 'Yes', 8),
('ucs2_hungarian_ci', 'ucs2', 146, '', 'Yes', 8),
('cp866_general_ci', 'cp866', 36, 'Yes', 'Yes', 1),
('cp866_bin', 'cp866', 68, '', 'Yes', 1),
('keybcs2_general_ci', 'keybcs2', 37, 'Yes', 'Yes', 1),
('keybcs2_bin', 'keybcs2', 73, '', 'Yes', 1),
('macce_general_ci', 'macce', 38, 'Yes', 'Yes', 1),
('macce_bin', 'macce', 43, '', 'Yes', 1),
('macroman_general_ci', 'macroman', 39, 'Yes', 'Yes', 1),
('macroman_bin', 'macroman', 53, '', 'Yes', 1),
('cp852_general_ci', 'cp852', 40, 'Yes', 'Yes', 1),
('cp852_bin', 'cp852', 81, '', 'Yes', 1),
('latin7_estonian_cs', 'latin7', 20, '', 'Yes', 1),
('latin7_general_ci', 'latin7', 41, 'Yes', 'Yes', 1),
('latin7_general_cs', 'latin7', 42, '', 'Yes', 1),
('latin7_bin', 'latin7', 79, '', 'Yes', 1),
('cp1251_bulgarian_ci', 'cp1251', 14, '', 'Yes', 1),
('cp1251_ukrainian_ci', 'cp1251', 23, '', 'Yes', 1),
('cp1251_bin', 'cp1251', 50, '', 'Yes', 1),
('cp1251_general_ci', 'cp1251', 51, 'Yes', 'Yes', 1),
('cp1251_general_cs', 'cp1251', 52, '', 'Yes', 1),
('cp1256_general_ci', 'cp1256', 57, 'Yes', 'Yes', 1),
('cp1256_bin', 'cp1256', 67, '', 'Yes', 1),
('cp1257_lithuanian_ci', 'cp1257', 29, '', 'Yes', 1),
('cp1257_bin', 'cp1257', 58, '', 'Yes', 1),
('cp1257_general_ci', 'cp1257', 59, 'Yes', 'Yes', 1),
('binary', 'binary', 63, 'Yes', 'Yes', 1),
('geostd8_general_ci', 'geostd8', 92, 'Yes', 'Yes', 1),
('geostd8_bin', 'geostd8', 93, '', 'Yes', 1),
('cp932_japanese_ci', 'cp932', 95, 'Yes', 'Yes', 1),
('cp932_bin', 'cp932', 96, '', 'Yes', 1),
('eucjpms_japanese_ci', 'eucjpms', 97, 'Yes', 'Yes', 1),
('eucjpms_bin', 'eucjpms', 98, '', 'Yes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `COLLATION_CHARACTER_SET_APPLICABILITY`
--

CREATE TEMPORARY TABLE `COLLATION_CHARACTER_SET_APPLICABILITY` (
  `COLLATION_NAME` varchar(64) NOT NULL default '',
  `CHARACTER_SET_NAME` varchar(64) NOT NULL default ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COLLATION_CHARACTER_SET_APPLICABILITY`
--

INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES
('big5_chinese_ci', 'big5'),
('big5_bin', 'big5'),
('dec8_swedish_ci', 'dec8'),
('dec8_bin', 'dec8'),
('cp850_general_ci', 'cp850'),
('cp850_bin', 'cp850'),
('hp8_english_ci', 'hp8'),
('hp8_bin', 'hp8'),
('koi8r_general_ci', 'koi8r'),
('koi8r_bin', 'koi8r'),
('latin1_german1_ci', 'latin1'),
('latin1_swedish_ci', 'latin1'),
('latin1_danish_ci', 'latin1'),
('latin1_german2_ci', 'latin1'),
('latin1_bin', 'latin1'),
('latin1_general_ci', 'latin1'),
('latin1_general_cs', 'latin1'),
('latin1_spanish_ci', 'latin1'),
('latin2_czech_cs', 'latin2'),
('latin2_general_ci', 'latin2'),
('latin2_hungarian_ci', 'latin2'),
('latin2_croatian_ci', 'latin2'),
('latin2_bin', 'latin2'),
('swe7_swedish_ci', 'swe7'),
('swe7_bin', 'swe7'),
('ascii_general_ci', 'ascii'),
('ascii_bin', 'ascii'),
('ujis_japanese_ci', 'ujis'),
('ujis_bin', 'ujis'),
('sjis_japanese_ci', 'sjis'),
('sjis_bin', 'sjis'),
('hebrew_general_ci', 'hebrew'),
('hebrew_bin', 'hebrew'),
('tis620_thai_ci', 'tis620'),
('tis620_bin', 'tis620'),
('euckr_korean_ci', 'euckr'),
('euckr_bin', 'euckr'),
('koi8u_general_ci', 'koi8u'),
('koi8u_bin', 'koi8u'),
('gb2312_chinese_ci', 'gb2312'),
('gb2312_bin', 'gb2312'),
('greek_general_ci', 'greek'),
('greek_bin', 'greek'),
('cp1250_general_ci', 'cp1250'),
('cp1250_czech_cs', 'cp1250'),
('cp1250_croatian_ci', 'cp1250'),
('cp1250_bin', 'cp1250'),
('gbk_chinese_ci', 'gbk'),
('gbk_bin', 'gbk'),
('latin5_turkish_ci', 'latin5'),
('latin5_bin', 'latin5'),
('armscii8_general_ci', 'armscii8'),
('armscii8_bin', 'armscii8'),
('utf8_general_ci', 'utf8'),
('utf8_bin', 'utf8'),
('utf8_unicode_ci', 'utf8'),
('utf8_icelandic_ci', 'utf8'),
('utf8_latvian_ci', 'utf8'),
('utf8_romanian_ci', 'utf8'),
('utf8_slovenian_ci', 'utf8'),
('utf8_polish_ci', 'utf8'),
('utf8_estonian_ci', 'utf8'),
('utf8_spanish_ci', 'utf8'),
('utf8_swedish_ci', 'utf8'),
('utf8_turkish_ci', 'utf8'),
('utf8_czech_ci', 'utf8'),
('utf8_danish_ci', 'utf8'),
('utf8_lithuanian_ci', 'utf8'),
('utf8_slovak_ci', 'utf8'),
('utf8_spanish2_ci', 'utf8'),
('utf8_roman_ci', 'utf8'),
('utf8_persian_ci', 'utf8'),
('utf8_esperanto_ci', 'utf8'),
('utf8_hungarian_ci', 'utf8'),
('ucs2_general_ci', 'ucs2'),
('ucs2_bin', 'ucs2'),
('ucs2_unicode_ci', 'ucs2'),
('ucs2_icelandic_ci', 'ucs2'),
('ucs2_latvian_ci', 'ucs2'),
('ucs2_romanian_ci', 'ucs2'),
('ucs2_slovenian_ci', 'ucs2'),
('ucs2_polish_ci', 'ucs2'),
('ucs2_estonian_ci', 'ucs2'),
('ucs2_spanish_ci', 'ucs2'),
('ucs2_swedish_ci', 'ucs2'),
('ucs2_turkish_ci', 'ucs2'),
('ucs2_czech_ci', 'ucs2'),
('ucs2_danish_ci', 'ucs2'),
('ucs2_lithuanian_ci', 'ucs2'),
('ucs2_slovak_ci', 'ucs2'),
('ucs2_spanish2_ci', 'ucs2'),
('ucs2_roman_ci', 'ucs2'),
('ucs2_persian_ci', 'ucs2'),
('ucs2_esperanto_ci', 'ucs2'),
('ucs2_hungarian_ci', 'ucs2'),
('cp866_general_ci', 'cp866'),
('cp866_bin', 'cp866'),
('keybcs2_general_ci', 'keybcs2'),
('keybcs2_bin', 'keybcs2'),
('macce_general_ci', 'macce'),
('macce_bin', 'macce'),
('macroman_general_ci', 'macroman'),
('macroman_bin', 'macroman'),
('cp852_general_ci', 'cp852'),
('cp852_bin', 'cp852'),
('latin7_estonian_cs', 'latin7'),
('latin7_general_ci', 'latin7'),
('latin7_general_cs', 'latin7'),
('latin7_bin', 'latin7'),
('cp1251_bulgarian_ci', 'cp1251'),
('cp1251_ukrainian_ci', 'cp1251'),
('cp1251_bin', 'cp1251'),
('cp1251_general_ci', 'cp1251'),
('cp1251_general_cs', 'cp1251'),
('cp1256_general_ci', 'cp1256'),
('cp1256_bin', 'cp1256'),
('cp1257_lithuanian_ci', 'cp1257'),
('cp1257_bin', 'cp1257'),
('cp1257_general_ci', 'cp1257'),
('binary', 'binary'),
('geostd8_general_ci', 'geostd8'),
('geostd8_bin', 'geostd8'),
('cp932_japanese_ci', 'cp932'),
('cp932_bin', 'cp932'),
('eucjpms_japanese_ci', 'eucjpms'),
('eucjpms_bin', 'eucjpms');

-- --------------------------------------------------------

--
-- Table structure for table `COLUMNS`
--

CREATE TEMPORARY TABLE `COLUMNS` (
  `TABLE_CATALOG` varchar(512) default NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL default '',
  `TABLE_NAME` varchar(64) NOT NULL default '',
  `COLUMN_NAME` varchar(64) NOT NULL default '',
  `ORDINAL_POSITION` bigint(21) NOT NULL default '0',
  `COLUMN_DEFAULT` longtext,
  `IS_NULLABLE` varchar(3) NOT NULL default '',
  `DATA_TYPE` varchar(64) NOT NULL default '',
  `CHARACTER_MAXIMUM_LENGTH` bigint(21) default NULL,
  `CHARACTER_OCTET_LENGTH` bigint(21) default NULL,
  `NUMERIC_PRECISION` bigint(21) default NULL,
  `NUMERIC_SCALE` bigint(21) default NULL,
  `CHARACTER_SET_NAME` varchar(64) default NULL,
  `COLLATION_NAME` varchar(64) default NULL,
  `COLUMN_TYPE` longtext NOT NULL,
  `COLUMN_KEY` varchar(3) NOT NULL default '',
  `EXTRA` varchar(20) NOT NULL default '',
  `PRIVILEGES` varchar(80) NOT NULL default '',
  `COLUMN_COMMENT` varchar(255) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COLUMNS`
--

INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES
(NULL, 'information_schema', 'CHARACTER_SETS', 'CHARACTER_SET_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'CHARACTER_SETS', 'DEFAULT_COLLATE_NAME', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'CHARACTER_SETS', 'DESCRIPTION', 3, '', 'NO', 'varchar', 60, 180, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(60)', '', '', 'select', ''),
(NULL, 'information_schema', 'CHARACTER_SETS', 'MAXLEN', 4, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'COLLATION_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'CHARACTER_SET_NAME', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'ID', 3, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(11)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'IS_DEFAULT', 4, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'IS_COMPILED', 5, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATIONS', 'SORTLEN', 6, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'COLLATION_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'CHARACTER_SET_NAME', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'ORDINAL_POSITION', 5, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_DEFAULT', 6, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'IS_NULLABLE', 7, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'DATA_TYPE', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'CHARACTER_MAXIMUM_LENGTH', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'CHARACTER_OCTET_LENGTH', 10, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'NUMERIC_PRECISION', 11, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'NUMERIC_SCALE', 12, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'CHARACTER_SET_NAME', 13, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLLATION_NAME', 14, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_TYPE', 15, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_KEY', 16, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'EXTRA', 17, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'PRIVILEGES', 18, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMNS', 'COLUMN_COMMENT', 19, '', 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'COLUMN_NAME', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'PRIVILEGE_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'IS_GRANTABLE', 7, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_CATALOG', 4, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_NAME', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'COLUMN_NAME', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'ORDINAL_POSITION', 8, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'POSITION_IN_UNIQUE_CONSTRAINT', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_TABLE_SCHEMA', 10, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_TABLE_NAME', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_COLUMN_NAME', 12, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'QUERY_ID', 1, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SEQ', 2, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'STATE', 3, '', 'NO', 'varchar', 30, 90, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(30)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'DURATION', 4, '0.000000', 'NO', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'CPU_USER', 5, NULL, 'YES', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'CPU_SYSTEM', 6, NULL, 'YES', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'CONTEXT_VOLUNTARY', 7, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'CONTEXT_INVOLUNTARY', 8, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'BLOCK_OPS_IN', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'BLOCK_OPS_OUT', 10, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'MESSAGES_SENT', 11, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'MESSAGES_RECEIVED', 12, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'PAGE_FAULTS_MAJOR', 13, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'PAGE_FAULTS_MINOR', 14, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SWAPS', 15, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SOURCE_FUNCTION', 16, NULL, 'YES', 'varchar', 30, 90, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(30)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SOURCE_FILE', 17, NULL, 'YES', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'PROFILING', 'SOURCE_LINE', 18, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SPECIFIC_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_TYPE', 5, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'DTD_IDENTIFIER', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_BODY', 7, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_DEFINITION', 8, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'EXTERNAL_NAME', 9, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'EXTERNAL_LANGUAGE', 10, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'PARAMETER_STYLE', 11, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'IS_DETERMINISTIC', 12, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SQL_DATA_ACCESS', 13, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SQL_PATH', 14, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SECURITY_TYPE', 15, '', 'NO', 'varchar', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(7)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'CREATED', 16, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'LAST_ALTERED', 17, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'SQL_MODE', 18, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'ROUTINE_COMMENT', 19, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'ROUTINES', 'DEFINER', 20, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'CATALOG_NAME', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'SCHEMA_NAME', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'DEFAULT_CHARACTER_SET_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'DEFAULT_COLLATION_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMATA', 'SQL_PATH', 5, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'PRIVILEGE_TYPE', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'IS_GRANTABLE', 5, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'NON_UNIQUE', 4, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(1)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'INDEX_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'INDEX_NAME', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'SEQ_IN_INDEX', 7, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(2)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'COLUMN_NAME', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'COLLATION', 9, NULL, 'YES', 'varchar', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'CARDINALITY', 10, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'SUB_PART', 11, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'PACKED', 12, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'NULLABLE', 13, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'INDEX_TYPE', 14, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
(NULL, 'information_schema', 'STATISTICS', 'COMMENT', 15, NULL, 'YES', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_TYPE', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'ENGINE', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'VERSION', 6, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'ROW_FORMAT', 7, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_ROWS', 8, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'AVG_ROW_LENGTH', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'DATA_LENGTH', 10, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'MAX_DATA_LENGTH', 11, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'INDEX_LENGTH', 12, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'DATA_FREE', 13, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'AUTO_INCREMENT', 14, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'CREATE_TIME', 15, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'UPDATE_TIME', 16, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'CHECK_TIME', 17, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_COLLATION', 18, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'CHECKSUM', 19, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'CREATE_OPTIONS', 20, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLES', 'TABLE_COMMENT', 21, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'TABLE_SCHEMA', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'TABLE_NAME', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'PRIVILEGE_TYPE', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'IS_GRANTABLE', 6, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'TRIGGER_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'TRIGGER_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'TRIGGER_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'EVENT_MANIPULATION', 4, '', 'NO', 'varchar', 6, 18, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(6)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_CATALOG', 5, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_SCHEMA', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_TABLE', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_ORDER', 8, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_CONDITION', 9, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_STATEMENT', 10, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_ORIENTATION', 11, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_TIMING', 12, '', 'NO', 'varchar', 6, 18, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(6)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_OLD_TABLE', 13, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_NEW_TABLE', 14, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_OLD_ROW', 15, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_NEW_ROW', 16, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'CREATED', 17, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'SQL_MODE', 18, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'TRIGGERS', 'DEFINER', 19, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'PRIVILEGE_TYPE', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'IS_GRANTABLE', 4, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'VIEW_DEFINITION', 4, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'CHECK_OPTION', 5, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'IS_UPDATABLE', 6, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'DEFINER', 7, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', ''),
(NULL, 'information_schema', 'VIEWS', 'SECURITY_TYPE', 8, '', 'NO', 'varchar', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(7)', '', '', 'select', ''),
(NULL, 'hspc', 'Competition', 'competition_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Competition', 'name', 2, NULL, 'NO', 'varchar', 35, 35, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(35)', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Competition', 'date', 3, NULL, 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Competition', 'type', 4, NULL, 'NO', 'enum', 6, 6, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'enum(''Test'',''School'')', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Competition', 'duration', 5, '1', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Competition', 'location', 6, NULL, 'NO', 'tinytext', 255, 255, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'tinytext', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Competition', 'problem_set', 7, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'FAQ', 'faq_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'hspc', 'FAQ', 'question', 2, NULL, 'NO', 'tinytext', 255, 255, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'tinytext', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'FAQ', 'answer', 3, NULL, 'NO', 'mediumtext', 16777215, 16777215, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'mediumtext', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'FAQ', 'status', 4, 'active', 'NO', 'enum', 8, 8, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'enum(''active'',''inactive'')', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Participant', 'participant_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Participant', 'name', 2, NULL, 'NO', 'varchar', 45, 45, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Participant', 'address', 3, NULL, 'YES', 'varchar', 45, 45, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Participant', 'email', 4, NULL, 'YES', 'varchar', 45, 45, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Participant', 'role', 5, NULL, 'NO', 'enum', 10, 10, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'enum(''coach'',''contestant'')', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Participant', 'shirt_size', 6, NULL, 'NO', 'enum', 3, 3, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'enum(''S'',''M'',''L'',''XL'',''XXL'')', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Participant', 'phone_number', 7, NULL, 'YES', 'char', 12, 12, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'char(12)', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Participant', 'password', 8, NULL, 'YES', 'char', 32, 32, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'char(32)', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Problem', 'problem_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Problem', 'description', 2, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'text', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Problem', 'input', 3, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'text', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Problem', 'output', 4, NULL, 'NO', 'text', 65535, 65535, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'text', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Problem_Set', 'problem_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Problem_Set', 'problem_set', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'School', 'school_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'hspc', 'School', 'name', 2, NULL, 'NO', 'varchar', 45, 45, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(45)', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'School', 'phone', 3, NULL, 'NO', 'char', 13, 13, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'char(13)', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'School', 'address', 4, NULL, 'NO', 'varchar', 135, 135, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(135)', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'School', 'status', 5, 'active', 'NO', 'enum', 8, 8, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'enum(''active'',''inactive'')', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Team', 'team_id', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', 'auto_increment', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Team', 'member1', 2, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Team', 'member2', 3, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Team', 'member3', 4, NULL, 'YES', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Team', 'school', 5, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'MUL', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Team', 'name', 6, NULL, 'NO', 'varchar', 45, 45, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'varchar(45)', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Team', 'coach', 7, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', '', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Team', 'competition_id', 8, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(11)', 'PRI', '', 'select,insert,update,references', ''),
(NULL, 'hspc', 'Team', 'type', 9, NULL, 'NO', 'enum', 6, 6, NULL, NULL, 'latin1', 'latin1_swedish_ci', 'enum(''School'',''Test'')', '', '', 'select,insert,update,references', '');

-- --------------------------------------------------------

--
-- Table structure for table `COLUMN_PRIVILEGES`
--

CREATE TEMPORARY TABLE `COLUMN_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL default '',
  `TABLE_CATALOG` varchar(512) default NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL default '',
  `TABLE_NAME` varchar(64) NOT NULL default '',
  `COLUMN_NAME` varchar(64) NOT NULL default '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL default '',
  `IS_GRANTABLE` varchar(3) NOT NULL default ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `COLUMN_PRIVILEGES`
--


-- --------------------------------------------------------

--
-- Table structure for table `KEY_COLUMN_USAGE`
--

CREATE TEMPORARY TABLE `KEY_COLUMN_USAGE` (
  `CONSTRAINT_CATALOG` varchar(512) default NULL,
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL default '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL default '',
  `TABLE_CATALOG` varchar(512) default NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL default '',
  `TABLE_NAME` varchar(64) NOT NULL default '',
  `COLUMN_NAME` varchar(64) NOT NULL default '',
  `ORDINAL_POSITION` bigint(10) NOT NULL default '0',
  `POSITION_IN_UNIQUE_CONSTRAINT` bigint(10) default NULL,
  `REFERENCED_TABLE_SCHEMA` varchar(64) default NULL,
  `REFERENCED_TABLE_NAME` varchar(64) default NULL,
  `REFERENCED_COLUMN_NAME` varchar(64) default NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `KEY_COLUMN_USAGE`
--

INSERT INTO `KEY_COLUMN_USAGE` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `POSITION_IN_UNIQUE_CONSTRAINT`, `REFERENCED_TABLE_SCHEMA`, `REFERENCED_TABLE_NAME`, `REFERENCED_COLUMN_NAME`) VALUES
(NULL, 'hspc', 'PRIMARY', NULL, 'hspc', 'Competition', 'competition_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'hspc', 'PRIMARY', NULL, 'hspc', 'FAQ', 'faq_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'hspc', 'PRIMARY', NULL, 'hspc', 'Participant', 'participant_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'hspc', 'PRIMARY', NULL, 'hspc', 'Problem', 'problem_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'hspc', 'PRIMARY', NULL, 'hspc', 'Problem_Set', 'problem_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'hspc', 'PRIMARY', NULL, 'hspc', 'Problem_Set', 'problem_set', 2, NULL, NULL, NULL, NULL),
(NULL, 'hspc', 'PRIMARY', NULL, 'hspc', 'School', 'school_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'hspc', 'PRIMARY', NULL, 'hspc', 'Team', 'team_id', 1, NULL, NULL, NULL, NULL),
(NULL, 'hspc', 'PRIMARY', NULL, 'hspc', 'Team', 'competition_id', 2, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PROFILING`
--

CREATE TEMPORARY TABLE `PROFILING` (
  `QUERY_ID` bigint(20) NOT NULL default '0',
  `SEQ` bigint(20) NOT NULL default '0',
  `STATE` varchar(30) NOT NULL default '',
  `DURATION` decimal(9,6) NOT NULL default '0.000000',
  `CPU_USER` decimal(9,6) default NULL,
  `CPU_SYSTEM` decimal(9,6) default NULL,
  `CONTEXT_VOLUNTARY` bigint(20) default NULL,
  `CONTEXT_INVOLUNTARY` bigint(20) default NULL,
  `BLOCK_OPS_IN` bigint(20) default NULL,
  `BLOCK_OPS_OUT` bigint(20) default NULL,
  `MESSAGES_SENT` bigint(20) default NULL,
  `MESSAGES_RECEIVED` bigint(20) default NULL,
  `PAGE_FAULTS_MAJOR` bigint(20) default NULL,
  `PAGE_FAULTS_MINOR` bigint(20) default NULL,
  `SWAPS` bigint(20) default NULL,
  `SOURCE_FUNCTION` varchar(30) default NULL,
  `SOURCE_FILE` varchar(20) default NULL,
  `SOURCE_LINE` bigint(20) default NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PROFILING`
--


-- --------------------------------------------------------

--
-- Table structure for table `ROUTINES`
--

CREATE TEMPORARY TABLE `ROUTINES` (
  `SPECIFIC_NAME` varchar(64) NOT NULL default '',
  `ROUTINE_CATALOG` varchar(512) default NULL,
  `ROUTINE_SCHEMA` varchar(64) NOT NULL default '',
  `ROUTINE_NAME` varchar(64) NOT NULL default '',
  `ROUTINE_TYPE` varchar(9) NOT NULL default '',
  `DTD_IDENTIFIER` varchar(64) default NULL,
  `ROUTINE_BODY` varchar(8) NOT NULL default '',
  `ROUTINE_DEFINITION` longtext,
  `EXTERNAL_NAME` varchar(64) default NULL,
  `EXTERNAL_LANGUAGE` varchar(64) default NULL,
  `PARAMETER_STYLE` varchar(8) NOT NULL default '',
  `IS_DETERMINISTIC` varchar(3) NOT NULL default '',
  `SQL_DATA_ACCESS` varchar(64) NOT NULL default '',
  `SQL_PATH` varchar(64) default NULL,
  `SECURITY_TYPE` varchar(7) NOT NULL default '',
  `CREATED` datetime NOT NULL default '0000-00-00 00:00:00',
  `LAST_ALTERED` datetime NOT NULL default '0000-00-00 00:00:00',
  `SQL_MODE` longtext NOT NULL,
  `ROUTINE_COMMENT` varchar(64) NOT NULL default '',
  `DEFINER` varchar(77) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ROUTINES`
--


-- --------------------------------------------------------

--
-- Table structure for table `SCHEMATA`
--

CREATE TEMPORARY TABLE `SCHEMATA` (
  `CATALOG_NAME` varchar(512) default NULL,
  `SCHEMA_NAME` varchar(64) NOT NULL default '',
  `DEFAULT_CHARACTER_SET_NAME` varchar(64) NOT NULL default '',
  `DEFAULT_COLLATION_NAME` varchar(64) NOT NULL default '',
  `SQL_PATH` varchar(512) default NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SCHEMATA`
--

INSERT INTO `SCHEMATA` (`CATALOG_NAME`, `SCHEMA_NAME`, `DEFAULT_CHARACTER_SET_NAME`, `DEFAULT_COLLATION_NAME`, `SQL_PATH`) VALUES
(NULL, 'information_schema', 'utf8', 'utf8_general_ci', NULL),
(NULL, 'hspc', 'latin1', 'latin1_swedish_ci', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SCHEMA_PRIVILEGES`
--

CREATE TEMPORARY TABLE `SCHEMA_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL default '',
  `TABLE_CATALOG` varchar(512) default NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL default '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL default '',
  `IS_GRANTABLE` varchar(3) NOT NULL default ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SCHEMA_PRIVILEGES`
--

INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES
('''hspc''@''localhost''', NULL, 'hspc', 'SELECT', 'NO'),
('''hspc''@''localhost''', NULL, 'hspc', 'INSERT', 'NO'),
('''hspc''@''localhost''', NULL, 'hspc', 'UPDATE', 'NO'),
('''hspc''@''localhost''', NULL, 'hspc', 'DELETE', 'NO'),
('''hspc''@''localhost''', NULL, 'hspc', 'CREATE', 'NO'),
('''hspc''@''localhost''', NULL, 'hspc', 'DROP', 'NO'),
('''hspc''@''localhost''', NULL, 'hspc', 'REFERENCES', 'NO'),
('''hspc''@''localhost''', NULL, 'hspc', 'INDEX', 'NO'),
('''hspc''@''localhost''', NULL, 'hspc', 'ALTER', 'NO'),
('''hspc''@''localhost''', NULL, 'hspc', 'CREATE TEMPORARY TABLES', 'NO'),
('''hspc''@''localhost''', NULL, 'hspc', 'LOCK TABLES', 'NO'),
('''hspc''@''localhost''', NULL, 'hspc', 'EXECUTE', 'NO'),
('''hspc''@''localhost''', NULL, 'hspc', 'CREATE VIEW', 'NO'),
('''hspc''@''localhost''', NULL, 'hspc', 'SHOW VIEW', 'NO'),
('''hspc''@''localhost''', NULL, 'hspc', 'CREATE ROUTINE', 'NO'),
('''hspc''@''localhost''', NULL, 'hspc', 'ALTER ROUTINE', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `STATISTICS`
--

CREATE TEMPORARY TABLE `STATISTICS` (
  `TABLE_CATALOG` varchar(512) default NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL default '',
  `TABLE_NAME` varchar(64) NOT NULL default '',
  `NON_UNIQUE` bigint(1) NOT NULL default '0',
  `INDEX_SCHEMA` varchar(64) NOT NULL default '',
  `INDEX_NAME` varchar(64) NOT NULL default '',
  `SEQ_IN_INDEX` bigint(2) NOT NULL default '0',
  `COLUMN_NAME` varchar(64) NOT NULL default '',
  `COLLATION` varchar(1) default NULL,
  `CARDINALITY` bigint(21) default NULL,
  `SUB_PART` bigint(3) default NULL,
  `PACKED` varchar(10) default NULL,
  `NULLABLE` varchar(3) NOT NULL default '',
  `INDEX_TYPE` varchar(16) NOT NULL default '',
  `COMMENT` varchar(16) default NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `STATISTICS`
--

INSERT INTO `STATISTICS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `NON_UNIQUE`, `INDEX_SCHEMA`, `INDEX_NAME`, `SEQ_IN_INDEX`, `COLUMN_NAME`, `COLLATION`, `CARDINALITY`, `SUB_PART`, `PACKED`, `NULLABLE`, `INDEX_TYPE`, `COMMENT`) VALUES
(NULL, 'hspc', 'Competition', 0, 'hspc', 'PRIMARY', 1, 'competition_id', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'hspc', 'Competition', 1, 'hspc', 'Name', 1, 'name', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'hspc', 'Competition', 1, 'hspc', 'Name', 2, 'date', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'hspc', 'FAQ', 0, 'hspc', 'PRIMARY', 1, 'faq_id', 'A', 12, NULL, NULL, '', 'BTREE', ''),
(NULL, 'hspc', 'Participant', 0, 'hspc', 'PRIMARY', 1, 'participant_id', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'hspc', 'Problem', 0, 'hspc', 'PRIMARY', 1, 'problem_id', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'hspc', 'Problem_Set', 0, 'hspc', 'PRIMARY', 1, 'problem_id', 'A', NULL, NULL, NULL, '', 'BTREE', ''),
(NULL, 'hspc', 'Problem_Set', 0, 'hspc', 'PRIMARY', 2, 'problem_set', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'hspc', 'School', 0, 'hspc', 'PRIMARY', 1, 'school_id', 'A', 616, NULL, NULL, '', 'BTREE', ''),
(NULL, 'hspc', 'School', 1, 'hspc', 'name', 1, 'name', 'A', 616, NULL, NULL, '', 'BTREE', ''),
(NULL, 'hspc', 'Team', 0, 'hspc', 'PRIMARY', 1, 'team_id', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'hspc', 'Team', 0, 'hspc', 'PRIMARY', 2, 'competition_id', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'hspc', 'Team', 1, 'hspc', 'school', 1, 'school', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'hspc', 'Team', 1, 'hspc', 'school', 2, 'coach', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'hspc', 'Team', 1, 'hspc', 'member1', 1, 'member1', 'A', 0, NULL, NULL, '', 'BTREE', ''),
(NULL, 'hspc', 'Team', 1, 'hspc', 'member1', 2, 'member2', 'A', 0, NULL, NULL, 'YES', 'BTREE', ''),
(NULL, 'hspc', 'Team', 1, 'hspc', 'member1', 3, 'member3', 'A', 0, NULL, NULL, 'YES', 'BTREE', ''),
(NULL, 'hspc', 'Team', 1, 'hspc', 'member1', 4, 'coach', 'A', 0, NULL, NULL, '', 'BTREE', '');

-- --------------------------------------------------------

--
-- Table structure for table `TABLES`
--

CREATE TEMPORARY TABLE `TABLES` (
  `TABLE_CATALOG` varchar(512) default NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL default '',
  `TABLE_NAME` varchar(64) NOT NULL default '',
  `TABLE_TYPE` varchar(64) NOT NULL default '',
  `ENGINE` varchar(64) default NULL,
  `VERSION` bigint(21) default NULL,
  `ROW_FORMAT` varchar(10) default NULL,
  `TABLE_ROWS` bigint(21) default NULL,
  `AVG_ROW_LENGTH` bigint(21) default NULL,
  `DATA_LENGTH` bigint(21) default NULL,
  `MAX_DATA_LENGTH` bigint(21) default NULL,
  `INDEX_LENGTH` bigint(21) default NULL,
  `DATA_FREE` bigint(21) default NULL,
  `AUTO_INCREMENT` bigint(21) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL,
  `CHECK_TIME` datetime default NULL,
  `TABLE_COLLATION` varchar(64) default NULL,
  `CHECKSUM` bigint(21) default NULL,
  `CREATE_OPTIONS` varchar(255) default NULL,
  `TABLE_COMMENT` varchar(80) NOT NULL default ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TABLES`
--

INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES
(NULL, 'information_schema', 'CHARACTER_SETS', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 576, 0, 16661376, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=29127', ''),
(NULL, 'information_schema', 'COLLATIONS', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 423, 0, 16737264, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=39662', ''),
(NULL, 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 387, 0, 16733880, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=43351', ''),
(NULL, 'information_schema', 'COLUMNS', 'SYSTEM VIEW', 'MyISAM', 0, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2010-11-16 12:09:36', '2010-11-16 12:09:36', NULL, 'utf8_general_ci', NULL, 'max_rows=8715', ''),
(NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 2565, 0, 16757145, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6540', ''),
(NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 4637, 0, 16762755, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=3618', ''),
(NULL, 'information_schema', 'PROFILING', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 356, 0, 16590668, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=47127', ''),
(NULL, 'information_schema', 'ROUTINES', 'SYSTEM VIEW', 'MyISAM', 0, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2010-11-16 12:09:36', '2010-11-16 12:09:36', NULL, 'utf8_general_ci', NULL, 'max_rows=9172', ''),
(NULL, 'information_schema', 'SCHEMATA', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 3656, 0, 16755448, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=4588', ''),
(NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 2179, 0, 16767405, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=7699', ''),
(NULL, 'information_schema', 'STATISTICS', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 2679, 0, 16770540, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6262', ''),
(NULL, 'information_schema', 'TABLES', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 3641, 0, 16763164, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=4607', ''),
(NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 2504, 0, 16749256, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=6700', ''),
(NULL, 'information_schema', 'TABLE_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 2372, 0, 16748692, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=7073', ''),
(NULL, 'information_schema', 'TRIGGERS', 'SYSTEM VIEW', 'MyISAM', 0, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2010-11-16 12:09:36', '2010-11-16 12:09:36', NULL, 'utf8_general_ci', NULL, 'max_rows=7652', ''),
(NULL, 'information_schema', 'USER_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 1986, 0, 16759854, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=8447', ''),
(NULL, 'information_schema', 'VIEWS', 'SYSTEM VIEW', 'MyISAM', 0, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2010-11-16 12:09:36', '2010-11-16 12:09:36', NULL, 'utf8_general_ci', NULL, 'max_rows=15073', ''),
(NULL, 'hspc', 'Competition', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 16384, 0, 1, '2010-11-13 20:55:50', NULL, NULL, 'latin1_swedish_ci', NULL, '', 'InnoDB free: 11264 kB'),
(NULL, 'hspc', 'FAQ', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 12, 159, 1916, 281474976710655, 2048, 0, 13, '2010-11-13 12:44:39', '2010-11-13 12:44:39', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'hspc', 'Participant', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 0, 0, 1, '2010-11-13 20:55:50', NULL, NULL, 'latin1_swedish_ci', NULL, '', 'InnoDB free: 11264 kB'),
(NULL, 'hspc', 'Problem', 'BASE TABLE', 'MyISAM', 10, 'Dynamic', 0, 0, 0, 281474976710655, 1024, 0, 1, '2010-11-13 09:37:56', '2010-11-13 09:37:56', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'hspc', 'Problem_Set', 'BASE TABLE', 'MyISAM', 10, 'Fixed', 0, 0, 0, 2533274790395903, 1024, 0, 1, '2010-11-13 09:38:25', '2010-11-13 09:38:25', NULL, 'latin1_swedish_ci', NULL, '', ''),
(NULL, 'hspc', 'School', 'BASE TABLE', 'InnoDB', 10, 'Compact', 561, 175, 98304, 0, 49152, 0, 602, '2010-11-13 20:55:50', NULL, NULL, 'latin1_swedish_ci', NULL, '', 'InnoDB free: 11264 kB'),
(NULL, 'hspc', 'Team', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 32768, 0, 1, '2010-11-13 20:55:50', NULL, NULL, 'latin1_swedish_ci', NULL, '', 'InnoDB free: 11264 kB');

-- --------------------------------------------------------

--
-- Table structure for table `TABLE_CONSTRAINTS`
--

CREATE TEMPORARY TABLE `TABLE_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) default NULL,
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL default '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL default '',
  `TABLE_SCHEMA` varchar(64) NOT NULL default '',
  `TABLE_NAME` varchar(64) NOT NULL default '',
  `CONSTRAINT_TYPE` varchar(64) NOT NULL default ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TABLE_CONSTRAINTS`
--

INSERT INTO `TABLE_CONSTRAINTS` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_SCHEMA`, `TABLE_NAME`, `CONSTRAINT_TYPE`) VALUES
(NULL, 'hspc', 'PRIMARY', 'hspc', 'Competition', 'PRIMARY KEY'),
(NULL, 'hspc', 'PRIMARY', 'hspc', 'FAQ', 'PRIMARY KEY'),
(NULL, 'hspc', 'PRIMARY', 'hspc', 'Participant', 'PRIMARY KEY'),
(NULL, 'hspc', 'PRIMARY', 'hspc', 'Problem', 'PRIMARY KEY'),
(NULL, 'hspc', 'PRIMARY', 'hspc', 'Problem_Set', 'PRIMARY KEY'),
(NULL, 'hspc', 'PRIMARY', 'hspc', 'School', 'PRIMARY KEY'),
(NULL, 'hspc', 'PRIMARY', 'hspc', 'Team', 'PRIMARY KEY');

-- --------------------------------------------------------

--
-- Table structure for table `TABLE_PRIVILEGES`
--

CREATE TEMPORARY TABLE `TABLE_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL default '',
  `TABLE_CATALOG` varchar(512) default NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL default '',
  `TABLE_NAME` varchar(64) NOT NULL default '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL default '',
  `IS_GRANTABLE` varchar(3) NOT NULL default ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TABLE_PRIVILEGES`
--


-- --------------------------------------------------------

--
-- Table structure for table `TRIGGERS`
--

CREATE TEMPORARY TABLE `TRIGGERS` (
  `TRIGGER_CATALOG` varchar(512) default NULL,
  `TRIGGER_SCHEMA` varchar(64) NOT NULL default '',
  `TRIGGER_NAME` varchar(64) NOT NULL default '',
  `EVENT_MANIPULATION` varchar(6) NOT NULL default '',
  `EVENT_OBJECT_CATALOG` varchar(512) default NULL,
  `EVENT_OBJECT_SCHEMA` varchar(64) NOT NULL default '',
  `EVENT_OBJECT_TABLE` varchar(64) NOT NULL default '',
  `ACTION_ORDER` bigint(4) NOT NULL default '0',
  `ACTION_CONDITION` longtext,
  `ACTION_STATEMENT` longtext NOT NULL,
  `ACTION_ORIENTATION` varchar(9) NOT NULL default '',
  `ACTION_TIMING` varchar(6) NOT NULL default '',
  `ACTION_REFERENCE_OLD_TABLE` varchar(64) default NULL,
  `ACTION_REFERENCE_NEW_TABLE` varchar(64) default NULL,
  `ACTION_REFERENCE_OLD_ROW` varchar(3) NOT NULL default '',
  `ACTION_REFERENCE_NEW_ROW` varchar(3) NOT NULL default '',
  `CREATED` datetime default NULL,
  `SQL_MODE` longtext NOT NULL,
  `DEFINER` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TRIGGERS`
--


-- --------------------------------------------------------

--
-- Table structure for table `USER_PRIVILEGES`
--

CREATE TEMPORARY TABLE `USER_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL default '',
  `TABLE_CATALOG` varchar(512) default NULL,
  `PRIVILEGE_TYPE` varchar(64) NOT NULL default '',
  `IS_GRANTABLE` varchar(3) NOT NULL default ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `USER_PRIVILEGES`
--

INSERT INTO `USER_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES
('''hspc''@''localhost''', NULL, 'USAGE', 'NO');

-- --------------------------------------------------------

--
-- Table structure for table `VIEWS`
--

CREATE TEMPORARY TABLE `VIEWS` (
  `TABLE_CATALOG` varchar(512) default NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL default '',
  `TABLE_NAME` varchar(64) NOT NULL default '',
  `VIEW_DEFINITION` longtext NOT NULL,
  `CHECK_OPTION` varchar(8) NOT NULL default '',
  `IS_UPDATABLE` varchar(3) NOT NULL default '',
  `DEFINER` varchar(77) NOT NULL default '',
  `SECURITY_TYPE` varchar(7) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `VIEWS`
--


