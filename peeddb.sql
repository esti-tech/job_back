-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2024 at 04:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peeddb`
--

-- --------------------------------------------------------

--
-- Table structure for table `branding`
--

CREATE TABLE `branding` (
  `id` int(11) NOT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`fields`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `description`, `location`, `created_at`) VALUES
(1, 'nw', 'gsb', 'rthsrhrst', '2024-07-21 08:52:18');

-- --------------------------------------------------------

--
-- Table structure for table `job_vacancies`
--

CREATE TABLE `job_vacancies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `position` text NOT NULL,
  `location` text NOT NULL,
  `department` text NOT NULL,
  `reportsTo` text NOT NULL,
  `jobDescription` text NOT NULL,
  `keyResponsibilities` text NOT NULL,
  `qualifications` text NOT NULL,
  `applicationDeadline` date NOT NULL,
  `salary` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_vacancies`
--

INSERT INTO `job_vacancies` (`id`, `position`, `location`, `department`, `reportsTo`, `jobDescription`, `keyResponsibilities`, `qualifications`, `applicationDeadline`, `salary`) VALUES
(4, 'Travel Operations Manager (Peep Navigator)', 'Bahirdar ethiopia', 'TICKET OFFICER', 'AMAN', 'SOME DEC', '  Oversee the daily operations of the travel services division.\n  Ensure smooth coordination between various stakeholders including bus operators, fleet managers, and station admins.\n  Implement and monitor operational strategies to enhance service efficiency.', ' Bachelor\'s degree in Business Management, Travel & Tourism, or a related field.\n  Minimum of 5 years experience in travel operations management.\n  Strong leadership and organizational skills.', '2024-07-28', '500'),
(5, 'Ticket Management Coordinator ', 'Bahirdar', 'TICKET OFFICER', 'aman', 'Ticket Maestro', ' Manage ticket sales operations, including online and offline channels.\n Coordinate with bus operators and station staff to ensure accurate and timely ticket issuance.\n Handle customer inquiries and resolve ticket-related issues', 'Bachelor\'s degree in Marketing, Business Administration, or a related field.\n Minimum of 3 years experience in ticket management or sales coordination.\n Excellent communication and customer service skills.', '2024-07-29', '200'),
(6, 'Travel Advisor', 'Bahirdar', 'TICKET OFFICER', 'aman', 'Travel Consultant Extraordinaire', ' Provide travel advice and assistance to customers.\n Assist in booking travel arrangements and ensuring customer satisfaction.\n Stay updated on travel trends and offer personalized travel solutions.', ' Bachelor\'s degree in Travel & Tourism, Hospitality Management, or a related field.\n Minimum of 2 years experience as a travel advisor or consultant.\n Strong knowledge of travel products and services', '2024-07-29', '200'),
(7, 'Ticketing Specialist ', ' Peep Travel Agent Office@BahirDar Gojam Ber(አዲሱ) Bus Station', 'Travel Services Division', 'Travel Operations Manager (Peep Navigator)', 'We are seeking enthusiastic and detail-oriented Ticketing Specialists to\n manage and coordinate ticket reservations and bookings. The ideal candidate\n will possess a strong understanding of ticketing systems, exceptional\n customer service skills, and the ability to handle high-pressure situations\n effectively. Experience with virtual game operations will be considered an\n asset.', 'Manage and process ticket reservations and bookings.\n  Assist customers with inquiries and resolve issues related to ticketing.\n  Ensure accurate and efficient ticketing operations.\nMaintain and update ticketing records and databases.\nCollaborate with virtual game operations teams to streamline ticketing processes for gaming\n events.\n Support the integration of ticketing systems with virtual game platforms to enhance user\n experience.', 'Experience in ticketing or a related field.\n Proficiency in ticketing software and systems (such as Amadeus, Sabre, or similar platforms).\n Strong communication and organizational skills.\n Ability to work in a fast-paced environment.\n Experience in virtual game operations, including familiarity with online ticketing and\n booking systems for gaming events, is a plus.\n Technical proficiency with virtual game platforms and an understanding of gaming industry\n standards and practices are highly desirable.', '2024-07-29', '200'),
(8, 'Travel Experience Architect  (Journey Master)', ' Peep Travel Agent Office@BahirDar Gojam Ber(አዲሱ) Bus Station', 'Travel Services Division', 'Ticket Management Coordinator (Ticket Maestro)', 'We are looking for a creative and experienced Travel Experience Architect to\n design and enhance travel experiences for our clients. The successful\n candidate will focus on creating memorable and seamless travel journeys that\n exceed client expectations.', ' Design and develop travel itineraries and experiences.\n Collaborate with clients to understand their travel preferences and\n needs.\n Ensure a high level of customer satisfaction through tailored travel\n solutions.\n Monitor and improve the quality of travel experiences.', 'Proven experience in travel planning or experience design.\n Excellent understanding of customer needs and preferences.\n Strong problem-solving skills and attention to detail.\n Creative thinking and innovation in travel experience design.', '2024-07-29', '200'),
(9, ' Destination Guru (Explorer Guide)', ' Peep Travel Agent Office@BahirDar Gojam Ber(አዲሱ) Bus Station', 'Travel Services Division', 'Ticket Management Coordinator (Ticket Maestro)', 'We are seeking a knowledgeable and passionate Destination Guru to provide\n expert guidance and information about travel destinations. This role involves\n researching destinations, creating travel recommendations, and helping\n clients make informed travel decisions', ' Research and provide detailed information about travel destinations.\n  Offer personalized travel advice based on client interests.\n  Develop and update destination content and resources.\n  Assist clients with destination-specific queries and recommendations.', ' In-depth knowledge of various travel destinations.\n Strong research and analytical skills.\n Excellent communication and presentation abilities.\n Passion for travel and helping clients explore new destinations', '2024-07-29', '500'),
(10, 'Logistics Coordinator (Travel Logistics Specialist)', 'Peep Travel Agent Office@BahirDar Gojam Ber(አዲሱ) Bus Station', 'Travel Services Division', 'Ticket Management Coordinator (Ticket Maestro)', 'We are in search of an efficient and organized Logistics Coordinator to\n manage travel logistics and ensure smooth operations. The role involves\n coordinating transportation, accommodations, and other travel-related\n arrangements to deliver an exceptional travel experience.', ' Coordinate and manage travel logistics for clients and groups.\n Ensure timely and accurate transportation and accommodation\n arrangements.\n Resolve logistical issues and provide solutions.\n Maintain detailed records of travel arrangements and schedules', 'Experience in travel logistics or operations.\n Strong organizational and multitasking skills.\n Ability to handle complex logistical challenges.\n Proficiency in travel management systems and tools.', '2024-07-29', '500'),
(11, 'Culture Connoisseur (Local Insight Specialist)', ' Peep Travel Agent Office@BahirDar Gojam Ber(አዲሱ) Bus Station', ' Travel Services Division', ' Ticket Management Coordinator (Ticket Maestro)', 'We are seeking a Culture Connoisseur with a deep understanding of local\n cultures to provide valuable insights and enhance the travel experience. This\n role involves sharing cultural knowledge, offering recommendations, and\n helping clients appreciate the local customs and traditions.', ' Provide expert knowledge on local cultures and traditions.\n Offer cultural insights and recommendations to enhance the travel\n experience.\n Assist clients in understanding and respecting local customs.\n Develop and maintain cultural content for travel resources.', 'Strong knowledge of various cultures and traditions.\n Excellent communication and interpersonal skills.\n Ability to convey cultural insights effectively.\n Passion for promoting cultural understanding and appreciation.', '2024-07-30', '123'),
(12, ' Language Liaison (Global Communication Specialist)', ' Language Liaison (Global Communication Specialist)', 'Travel Services Division', 'Ticket Management Coordinator (Ticket Maestro)', 'We are looking for a skilled Language Liaison to facilitate effective\n communication between our clients and service providers across different\n languages. This role involves translating and interpreting information to\n ensure clear and accurate communication.', 'Provide translation and interpretation services for clients and team\n members.\n Assist in the development of multilingual travel resources and materials.\n Ensure clear and accurate communication in all language interactions.\n Address language-related issues and resolve misunderstandings.', ' Proficiency in multiple languages (specify languages required).\n Strong translation and interpretation skills.\n Excellent communication and interpersonal abilities.\n Experience in a language liaison or similar role', '2024-07-29', '500'),
(13, 'Support Agents (Travel Assistants)', ' Peep Travel Agent Office@BahirDar Gojam Ber(አዲሱ) Bus Station', 'Travel Services Division', 'Travel Operations Manager (Peep Navigator)', ' We are seeking dedicated and customer-focused Support Agents to assist\n travelers with various needs and inquiries. This role involves providing\n support before, during, and after travel to ensure a smooth and enjoyable\n experience for our clients. Previous experience with BahirDar Gojam Ber Bus\n Station, as well as roles such as Weyala and Driver Assistant, will be\n considered an asset.', 'Assist travelers with inquiries, bookings, and issues.\n Provide information and support related to travel arrangements.\n Handle customer service requests and resolve problems effectively.\n Maintain accurate records of traveler interactions and support provided.\n Collaborate with travel operations and bus station teams to address and resolve\n travel-related issues.\n Support the coordination of travel schedules and logistics to ensure a seamless\n travel experience for clients.', 'Experience in customer service or travel support.\n Previous experience with BahirDar Gojam Ber Bus Station, including roles such\n as Weyala and Driver Assistant, is a plus.\n Strong problem-solving and communication skills.\n Ability to handle multiple tasks and work under pressure.\n Knowledge of travel industry practices and systems.\n Familiarity with bus station operations and travel logistics is advantageous', '2024-07-29', '200');

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `primaryColor` varchar(7) DEFAULT NULL,
  `secondaryColor` varchar(7) DEFAULT NULL,
  `accentColor` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `filePath` text NOT NULL,
  `jobid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `password`, `created_at`, `filePath`, `jobid`) VALUES
(18, 'Estifanos Abebaw', '09417892646', 'tekle.estifanddddoddfffffffdds.17@gmail.com', '$2b$10$25csBFZLbrW5rQjKcq8O0OpxV0kVhqJncfErpcAtDKgyfJ74sBcae', '2024-07-22 11:43:50', 'uploads\\file-1721648630870.pdf', 3),
(19, 'Aman Worku', '0000831', 'aman@peep.et', '$2b$10$XTiXT/NvVqayddr/wC8YXuKlUvvoE4eshyTEe3mCSLS7h.aJBY11S', '2024-07-22 11:56:14', 'uploads\\file-1721649374282.pdf', 2),
(20, 'peep', '0941789264', 'peep@eplusapp.et', '$2b$10$bNcGq4/RVRUSuqq0YZr5eeVOb.ZQUnR79Nwq5JQAkT3eY6l4i4jRK', '2024-07-22 13:57:31', 'uploads\\file-1721656651564.pdf', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branding`
--
ALTER TABLE `branding`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_vacancies`
--
ALTER TABLE `job_vacancies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branding`
--
ALTER TABLE `branding`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `job_vacancies`
--
ALTER TABLE `job_vacancies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
