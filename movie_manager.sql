-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 07, 2024 at 12:44 PM
-- Server version: 8.0.36
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `director` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `release_year` int NOT NULL,
  `genre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `director`, `release_year`, `genre`, `description`) VALUES
(1, 'La la land ', 'Damien Chazelle', 2016, 'Drama', 'Mia, an aspiring actress, serves lattes to movie stars in between auditions and Sebastian, a jazz musician, scrapes by playing cocktail party gigs in dingy bars, but as success mounts they are faced with decisions that begin to fray the fragile fabric of their love affair, and the dreams they worked so hard to maintain in each other threaten to rip them apart.'),
(2, 'Interstellar', 'Christopher Nolan', 2014, 'Science Fiction', 'The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.'),
(3, 'Everything Everywhere All at Once', 'Daniel Scheinert, Daniel Kwan', 2069, 'Science Fiction', 'An aging Chinese immigrant is swept up in an insane adventure, where she alone can save what\'s important to her by connecting with the lives she could have led in other universes.'),
(4, 'F**** C*** ', 'David Fincher', 1999, 'Drama', 'A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.'),
(5, 'Whiplash', 'Damien Chazelle', 2014, 'Drama', 'Under the direction of a ruthless instructor, a talented young drummer begins to pursue perfection at any cost, even his humanity.'),
(6, 'Eternal Sunshine of the Spotless Mind', 'Michel Gondry', 2004, 'Science Fiction', 'Joel Barish, heartbroken that his girlfriend underwent a procedure to erase him from her memory, decides to do the same. However, as he watches his memories of her fade away, he realises that he still loves her, and may be too late to correct his mistake.'),
(7, 'Little Women', 'Greta Gerwig', 2015, 'Romance', 'Four sisters come of age in America in the aftermath of the Civil War.'),
(8, 'Dead Poets Society', 'Peter Weir', 1989, 'Drama', 'At an elite, old-fashioned boarding school in New England, a passionate English teacher inspires his students to rebel against convention and seize the potential of every day, courting the disdain of the stern headmaster.'),
(9, 'Parasite', 'Bong Joon-ho', 2019, 'Dark Comedy', 'All unemployed, Ki-taek\'s family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.'),
(10, 'The Dark Knight', 'Christopher Nolan', 2008, 'Drama', 'Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.'),
(11, 'Spider-Man: Into the Spider-Verse', 'Rodney Rothman, Peter Ramsey, …', 2018, 'Adventure', 'Struggling to find his place in the world while juggling school and family, Brooklyn teenager Miles Morales is unexpectedly bitten by a radioactive spider and develops unfathomable powers just like the one and only Spider-Man. While wrestling with the implications of his new abilities, Miles discovers a super collider created by the madman Wilson \"Kingpin\" Fisk, causing others from across the Spider-Verse to be inadvertently transported to his dimension.'),
(12, 'Spirited Away', 'Hayao Miyazaki', 2001, 'Family', 'A young girl, Chihiro, becomes trapped in a strange new world of spirits. When her parents undergo a mysterious transformation, she must call upon the courage she never knew she had to free her family.'),
(13, 'Pride & Prejudice', 'Joe Wright', 2005, 'Drama', 'A story of love and life among the landed English gentry during the Georgian era. Mr. Bennet is a gentleman living in Hertfordshire with his overbearing wife and five daughters, but if he dies their house will be inherited by a distant cousin whom they have never met, so the family\'s future happiness and security is dependent on the daughters making good marriages.'),
(14, '10 Things I Hate About You', 'Gil Junger', 1999, 'Comedy', 'On the first day at his new school, Cameron instantly falls for Bianca, the gorgeous girl of his dreams. The only problem is that Bianca is forbidden to date until her ill-tempered, completely un-dateable older sister Kat goes out, too. In an attempt to solve his problem, Cameron singles out the only guy who could possibly be a match for Kat: a mysterious bad boy with a nasty reputation of his own.'),
(15, 'Howl\'s Moving Castle', 'Hayao Miyazaki', 2004, 'Fantasy', 'When Sophie, a shy young woman, is cursed with an old body by a spiteful witch, her only chance of breaking the spell lies with a self-indulgent yet insecure young wizard and his companions in his legged, walking castle.'),
(16, 'The Perks of Being a Wallflower', 'Stephen Chbosky', 2012, 'Drama', 'Pittsburgh, Pennsylvania, 1991. High school freshman Charlie is a wallflower, always watching life from the sidelines, until two senior students, Sam and her stepbrother Patrick, become his mentors, helping him discover the joys of friendship, music and love…'),
(17, 'Pulp Fiction', 'Quentin Tarantino', 1994, 'Crime', 'A burger-loving hit man, his philosophical partner, a drug-addled gangster\'s moll and a washed-up boxer converge in this sprawling, comedic crime caper. Their adventures unfurl in three stories that ingeniously trip back and forth in time.'),
(18, 'Fantastic Mr. Fox', 'Wes Anderson', 2009, 'Family', 'The Fantastic Mr. Fox, bored with his current life, plans a heist against the three local farmers. The farmers, tired of sharing their chickens with the sly fox, seek revenge against him and his family.'),
(19, 'The Shawshank Redemption', 'Frank Darabont', 1994, 'Crime', 'Imprisoned in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.'),
(20, 'Coraline', 'Henry Selick', 2009, 'Animation', 'When Coraline moves to an old house, she feels bored and neglected by her parents. She finds a hidden door with a bricked up passage. During the night, she crosses the passage and finds a parallel world where everybody has buttons instead of eyes, with caring parents and all her dreams coming true. When the Other Mother invites Coraline to stay in her world forever, the girl refuses and finds that the alternate reality where she is trapped is only a trick to lure her.'),
(21, 'The Godfather', 'Francis Ford Coppola', 1972, 'Crime', 'Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.'),
(22, 'Call Me by Your Name', 'Luca Guadagnino', 2017, 'Romance', 'In 1980s Italy, a relationship begins between seventeen-year-old teenage Elio and the older adult man hired as his father\'s research assistant.'),
(23, 'Scream', 'Wes Craven', 1996, 'Mystery', 'A killer known as Ghostface begins killing off teenagers, and as the body count begins rising, one girl and her friends find themselves contemplating the \'rules\' of horror films as they find themselves living in a real-life one.'),
(24, 'Inception', 'Christopher Nolan', 2010, 'Action', 'Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: \"inception\", the implantation of another person\'s idea into a target\'s subconscious.'),
(25, 'Black Swan', 'Darren Aronofsky', 2088, 'Drama', 'A journey through the psyche of a young ballerina whose starring role as the duplicitous swan queen turns out to be a part for which she becomes frighteningly perfect.'),
(26, 'The Grand Budapest Hotel', 'Wes Anderson', 2014, 'Mobil', 'The Grand Budapest Hotel tells of a legendary concierge at a famous European hotel between the wars and his friendship with a young employee who becomes his trusted protégé. The story involves the theft and recovery of a priceless Renaissance painting, the battle for an enormous family fortune and the slow and then sudden upheavals that transformed Europe during the first half of the 20th century.'),
(27, 'Lady Bird', 'Greta Gerwig', 2017, 'Comedy', 'A California high school student plans to escape from her family and small town by going to college in New York, much to the disapproval of wildly loving, deeply opinionated and strong-willed mother.'),
(28, 'Scott Pilgrim vs. the World', 'Edgar Wright', 2010, 'Comedy', 'Scott Pilgrim is a 22 year old radical Canadian wannabe rockstar who falls in love with an American delivery girl, Ramona Flowers, and must defeat her seven evil exes to be able to date her.'),
(29, 'GoodFellas', 'Martin Scorsese', 1990, 'Drama', 'The true story of Henry Hill, a half-Irish, half-Sicilian Brooklyn kid who is adopted by neighbourhood gangsters at an early age and climbs the ranks of a Mafia family under the guidance of Jimmy Conway.'),
(30, 'Good Will Hunting', 'Gus Van Sant', 1997, 'Drama', 'Will Hunting has a genius-level IQ but chooses to work as a janitor at MIT. When he solves a difficult graduate-level math problem, his talents are discovered by Professor Gerald Lambeau, who decides to help the misguided youth reach his potential. When Will is arrested for attacking a police officer, Professor Lambeau makes a deal to get leniency for him if he will get treatment from therapist Sean Maguire.'),
(31, 'Aftersun', 'Charlotte Wells', 2022, 'Drama', 'Sophie reflects on the shared joy and private melancholy of a holiday she took with her father twenty years earlier. Memories real and imagined fill the gaps between miniDV footage as she tries to reconcile the father she knew with the man she didn’t.'),
(32, 'Before Sunrise', 'Richard Linklater', 1995, 'Horor', 'A young man and woman meet on a train in Europe, and wind up spending one evening together in Vienna. Unfortunately, both know that this will probably be their only night together.'),
(33, 'Back to the Future', 'Robert Zemeckis', 1985, 'Comedy', 'Eighties teenager Marty McFly is accidentally sent back in time to 1955, inadvertently disrupting his parents\' first meeting and attracting his mother\'s romantic interest. Marty must repair the damage to history by rekindling his parents\' romance and - with the help of his eccentric inventor friend Doc Brown - return to 1985.'),
(34, 'Inglourious Basterds', 'Quentin Tarantino', 2009, 'Drama', 'In Nazi-occupied France during World War II, a group of Jewish-American soldiers known as \"The Basterds\" are chosen specifically to spread fear throughout the Third Reich by scalping and brutally killing Nazis. The Basterds, lead by Lt. Aldo Raine soon cross paths with a French-Jewish teenage girl who runs a movie theater in Paris which is targeted by the soldiers.'),
(35, 'The Lord of the Rings: The Return of the King', 'Peter Jackson', 2003, 'Fantasy', 'Aragorn is revealed as the heir to the ancient kings as he, Gandalf and the other members of the broken fellowship struggle to save Gondor from Sauron\'s forces. Meanwhile, Frodo and Sam take the ring closer to the heart of Mordor, the dark lord\'s realm.'),
(36, 'Spider-Man: Across the Spider-Verse', 'Joaquim Dos Santos, Justin K. Thompson, …', 2023, 'Animation', 'After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood Spider-Man is catapulted across the Multiverse, where he encounters the Spider Society, a team of Spider-People charged with protecting the Multiverse’s very existence. But when the heroes clash on how to handle a new threat, Miles finds himself pitted against the other Spiders and must set out on his own to save those he loves most.'),
(37, 'Donnie Darko', 'Richard Kelly', 2001, 'Fantasy', 'After narrowly escaping a bizarre accident, a troubled teenager is plagued by visions of a large bunny rabbit that manipulates him to commit a series of crimes.'),
(38, 'Portrait of a Lady on Fire', 'Céline Sciamma', 2019, 'Drama', 'On an isolated island in Brittany at the end of the eighteenth century, a female painter is obliged to paint a wedding portrait of a young woman.'),
(39, 'Little Miss Sunshine', 'Jonathan Dayton, Valerie Faris', 2006, 'Drama', 'A family loaded with quirky, colorful characters piles into an old van and road trips to California for little Olive to compete in a beauty pageant.'),
(40, 'The Truman Show', 'Peter Weir', 1998, 'Comedy', 'Truman Burbank is the star of The Truman Show, a 24-hour-a-day reality TV show that broadcasts every aspect of his life without his knowledge. His entire life has been an unending soap opera for consumption by the rest of the world. And everyone he knows, including his wife and his best friend is really an actor, paid to be part of his life.'),
(41, 'Dune: Part Two', 'Denis Villeneuve', 2024, 'Adventure', 'Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee.'),
(42, 'The Empire Strikes Back', 'Irvin Kershner', 1980, 'Action', 'The epic saga continues as Luke Skywalker, in hopes of defeating the evil Galactic Empire, learns the ways of the Jedi from aging master Yoda. But Darth Vader is more determined than ever to capture Luke. Meanwhile, rebel leader Princess Leia, cocky Han Solo, Chewbacca, and droids C-3PO and R2-D2 are thrown into various stages of capture, betrayal and despair.'),
(43, 'The Shining', 'Stanley Kubrick', 1980, 'Horror', 'Jack Torrance accepts a caretaker job at the Overlook Hotel, where he, along with his wife Wendy and their son Danny, must live isolated from the rest of the world for the winter. But they aren\'t prepared for the madness that lurks within.'),
(44, 'Se7en', 'David Fincher', 1995, 'Crime', 'Two homicide detectives are on a desperate hunt for a serial killer whose crimes are based on the \"seven deadly sins\" in this dark and haunting film that takes viewers from the tortured remains of one victim to the next. The seasoned Det. Sommerset researches each sin in an effort to get inside the killer\'s mind, while his novice partner, Mills, scoffs at his efforts to unravel the case.'),
(45, 'Forrest Gump', 'Robert Zemeckis', 1994, 'Drama', 'A man with a low IQ has accomplished great things in his life and been present during significant historic events—in each case, far exceeding what anyone imagined he could do. But despite all he has achieved, his one true love eludes him.'),
(46, 'Blade Runner 2049', 'Denis Villeneuve', 2017, 'Science Fiction', 'Thirty years after the events of the first film, a new blade runner, LAPD Officer K, unearths a long-buried secret that has the potential to plunge what\'s left of society into chaos. K\'s discovery leads him on a quest to find Rick Deckard, a former LAPD blade runner who has been missing for 30 years.'),
(47, 'The Batman', 'Matt Reeves', 2022, 'Crime', 'In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.'),
(48, '2001: A Space Odyssey', 'Stanley Kubrick', 1968, 'Adventure', 'Humanity finds a mysterious object buried beneath the lunar surface and sets off to find its origins with the help of HAL 9000, the world\'s most advanced super computer.'),
(49, 'Amélie', 'Jean-Pierre Jeunet', 2001, 'Romance', 'At a tiny Parisian café, the adorable yet painfully shy Amélie (Audrey Tautou) accidentally discovers a gift for helping others. Soon Amelie is spending her days as a matchmaker, guardian angel, and all-around do-gooder. But when she bumps into a handsome stranger, will she find the courage to become the star of her very own love story?'),
(50, 'Mamma Mia!', 'Phyllida Lloyd', 2008, 'Comedy', 'An independent, single mother who owns a small hotel on a Greek island is about to marry off the spirited young daughter she\'s raised alone. But, the daughter has secretly invited three of her mother\'s ex-lovers in the hopes of finding her biological father.'),
(51, 'The Lord of the Rings: The Fellowship of the Ring', 'Peter Jackson', 2001, 'Fantasy', 'Young hobbit Frodo Baggins, after inheriting a mysterious ring from his uncle Bilbo, must leave his home in order to keep it from falling into the hands of its evil creator. Along the way, a fellowship is formed to protect the ringbearer and make sure that the ring arrives at its final destination: Mt. Doom, the only place where it can be destroyed.'),
(52, 'Taxi Driver', 'Martin Scorsese', 1976, 'Drama', 'A mentally unstable Vietnam War veteran works as a night-time taxi driver in New York City where the perceived decadence and sleaze feed his urge for violent action.'),
(53, 'Kill Bill: Vol. 1', 'Quentin Tarantino', 2003, 'Comedy', 'An assassin is shot by her ruthless employer, Bill, and other members of their assassination circle – but she lives to plot her vengeance.'),
(54, 'Arrival', 'Denis Villeneuve', 2016, 'Science Fiction', 'Taking place after alien crafts land around the world, an expert linguist is recruited by the military to determine whether they come in peace or are a threat.'),
(55, 'Star Wars: Episode III - Revenge of the Sith', 'George Lucas', 2005, 'Science Fiction', 'The evil Darth Sidious enacts his final plan for unlimited power -- and the heroic Jedi Anakin Skywalker must choose a side.'),
(56, 'Blade Runner', 'Ridley Scott', 1982, 'Thriller', 'In the smog-choked dystopian Los Angeles of 2019, blade runner Rick Deckard is called out of retirement to terminate a quartet of replicants who have escaped to Earth seeking their creator for a way to extend their short life spans.'),
(57, 'La Haine', 'Mathieu Kassovitz', 1995, 'Drama', 'After a chaotic night of rioting in a marginal suburb of Paris, three young friends, Vinz, Hubert and Saïd, wander around unoccupied waiting for news about the state of health of a mutual friend who has been seriously injured when confronting the police.'),
(58, 'Midsommar', 'Ari Aster', 2019, 'Mystery', 'Several friends travel to Sweden to study as anthropologists a summer festival that is held every ninety years in the remote hometown of one of them. What begins as a dream vacation in a place where the sun never sets, gradually turns into a dark nightmare as the mysterious inhabitants invite them to participate in their disturbing festive activities.'),
(59, 'Gone Girl', 'David Fincher', 2014, 'Drama', 'With his wife\'s disappearance having become the focus of an intense media circus, a man sees the spotlight turned on him when it\'s suspected that he may not be innocent.'),
(60, 'Princess Mononoke', 'Hayao Miyazaki', 1997, 'Adventure', 'Ashitaka, a prince of the disappearing Emishi people, is cursed by a demonized boar god and must journey to the west to find a cure. Along the way, he encounters San, a young human woman fighting to protect the forest, and Lady Eboshi, who is trying to destroy it. Ashitaka must find a way to bring balance to this conflict.'),
(61, 'About Time', 'Richard Curtis', 2013, 'Fantasy', 'The night after another unsatisfactory New Year party, Tim\'s father tells his son that the men in his family have always had the ability to travel through time. Tim can\'t change history, but he can change what happens and has happened in his own life – so he decides to make his world a better place... by getting a girlfriend. Sadly, that turns out not to be as easy as he thinks.'),
(62, 'The Thing', 'John Carpenter', 1982, 'Mystery', 'In remote Antarctica, a group of American research scientists are disturbed at their base camp by a helicopter shooting at a sled dog. When they take in the dog, it brutally attacks both human beings and canines in the camp and they discover that the beast can assume the shape of its victims. A resourceful helicopter pilot and the camp doctor lead the camp crew in a desperate, gory battle against the vicious creature before it picks them all off, one by one.'),
(63, 'The Silence of the Lambs', 'Jonathan Demme', 1991, 'Horror', 'Clarice Starling is a top student at the FBI\'s training academy.  Jack Crawford wants Clarice to interview Dr. Hannibal Lecter, a brilliant psychiatrist who is also a violent psychopath, serving life behind bars for various acts of murder and cannibalism.  Crawford believes that Lecter may have insight into a case and that Starling, as an attractive young woman, may be just the bait to draw him out.'),
(64, 'In the Mood for Love', 'Wong Kar-wai', 2000, 'Drama', 'Taking place in Hong Kong of 1962, a melancholy story about the love between a woman and a man who live in the same building and one day find out that their husband and wife had an affair with each other.'),
(65, 'Django Unchained', 'Quentin Tarantino', 2012, 'Drama', 'With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal Mississippi plantation owner.'),
(66, 'Jurassic Park', 'Steven Spielberg', 1993, 'Science Fiction', 'A wealthy entrepreneur secretly creates a theme park featuring living dinosaurs drawn from prehistoric DNA. Before opening day, he invites a team of experts and his two eager grandchildren to experience the park and help calm anxious investors. However, the park is anything but amusing as the security systems go off-line and the dinosaurs escape.'),
(67, 'Her', 'Spike Jonze', 2013, 'Science Fiction', 'In the not so distant future, Theodore, a lonely writer purchases a newly developed operating system designed to meet the user\'s every needs. To Theodore\'s surprise, a romantic relationship develops between him and his operating system. This unconventional love story blends science fiction and romance in a sweet tale that explores the nature of love and the ways that technology isolates and connects us all.'),
(68, 'Mulholland Drive', 'David Lynch', 2001, 'Mystery', 'Blonde Betty Elms has only just arrived in Hollywood to become a movie star when she meets an enigmatic brunette with amnesia. Meanwhile, as the two set off to solve the second woman\'s identity, filmmaker Adam Kesher runs into ominous trouble while casting his latest project.'),
(69, 'Shutter Island', 'Martin Scorsese', 2010, 'Mystery', 'World War II soldier-turned-U.S. Marshal Teddy Daniels investigates the disappearance of a patient from a hospital for the criminally insane, but his efforts are compromised by his troubling visions and also by a mysterious doctor.'),
(70, 'American Psycho', 'Mary Harron', 2000, 'Crime', 'A wealthy New York investment banking executive hides his alternate psychopathic ego from his co-workers and friends as he escalates deeper into his illogical, gratuitous fantasies.'),
(71, 'Trainspotting', 'Danny Boyle', 1996, 'Drama', 'Mark Renton, deeply immersed in the Edinburgh drug scene, tries to clean up and get out, despite the allure of the drugs and influence of friends.'),
(72, 'Oldboy', 'Park Chan-wook', 2003, 'Thriller', 'With no clue how he came to be imprisoned, drugged and tortured for 15 years, a desperate businessman seeks revenge on his captors.'),
(73, 'Hereditary', 'Ari Aster', 2018, 'Thriller', 'When Ellen, the matriarch of the Graham family, passes away, her daughter’s family begins to unravel cryptic and increasingly terrifying secrets about their ancestry.'),
(74, 'Oppenheimer', 'Christopher Nolan', 2023, 'Drama', 'The story of J. Robert Oppenheimer\'s role in the development of the atomic bomb during World War II.'),
(75, 'The Matrix', 'Lilly Wachowski, Lana Wachowski', 1999, 'Science Fiction', 'Set in the 22nd century, The Matrix tells the story of a computer hacker who joins a group of underground insurgents fighting the vast and powerful computers who now rule the earth.'),
(76, '12 Angry Men', 'Sidney Lumet', 1957, 'Drama', 'The defense and the prosecution have rested and the jury is filing into the jury room to decide if a young Spanish-American is guilty or innocent of murdering his father. What begins as an open and shut case soon becomes a mini-drama of each of the jurors\' prejudices and preconceptions about the trial, the accused, and each other.'),
(77, 'Perfect Blue', 'Satoshi Kon', 1997, 'Thriller', 'A retired pop singer turned actress\' sense of reality is shaken when she is stalked by an obsessed fan and seemingly a ghost of her past.'),
(78, 'The Social Network', 'David Fincher', 2010, 'Drama', 'On a fall night in 2003, Harvard undergrad and computer programming genius Mark Zuckerberg sits down at his computer and heatedly begins working on a new idea. In a fury of blogging and programming, what begins in his dorm room as a small site among friends soon becomes a global social network and a revolution in communication. A mere six years and 500 million friends later, Mark Zuckerberg is the youngest billionaire in history... but for this entrepreneur, success leads to both personal and legal complications.'),
(79, 'The Handmaiden', 'Park Chan-wook', 2016, 'Thriller', 'In 1930s Korea, a swindler and a young woman pose as a Japanese count and a handmaiden to seduce a Japanese heiress and steal her fortune.'),
(80, 'City of God', 'Fernando Meirelles', 2002, 'Drama', 'Buscapé was raised in a very violent environment. Despite the feeling that all odds were against him, he finds out that life can be seen with other eyes...'),
(81, 'Alien', 'Ridley Scott', 1979, 'Horror', 'During its return to the earth, commercial spaceship Nostromo intercepts a distress signal from a distant planet. When a three-member team of the crew discovers a chamber containing thousands of eggs on the planet, a creature inside one of the eggs attacks an explorer. The entire crew is unaware of the impending nightmare set to descend upon them when the alien parasite planted inside its unfortunate host is birthed.'),
(82, 'Knives Out', 'Rian Johnson', 2019, 'Mystery', 'When renowned crime novelist Harlan Thrombey is found dead at his estate just after his 85th birthday, the inquisitive and debonair Detective Benoit Blanc is mysteriously enlisted to investigate. From Harlan\'s dysfunctional family to his devoted staff, Blanc sifts through a web of red herrings and self-serving lies to uncover the truth behind Harlan\'s untimely death.'),
(83, 'Ratatouille', 'Brad Bird', 2007, 'Animation', 'A rat named Remy dreams of becoming a great French chef despite his family\'s wishes and the obvious problem of being a rat in a decidedly rodent-phobic profession. When fate places Remy in the sewers of Paris, he finds himself ideally situated beneath a restaurant made famous by his culinary hero, Auguste Gusteau. Despite the apparent dangers of being an unlikely - and certainly unwanted - visitor in the kitchen of a fine French restaurant, Remy\'s passion for cooking soon sets into motion a hilarious and exciting rat race that turns the culinary world of Paris upside down.'),
(84, 'There Will Be Blood', 'Paul Thomas Anderson', 2007, 'Drama', 'Ruthless silver miner, turned oil prospector, Daniel Plainview moves to oil-rich California. Using his son to project a trustworthy, family-man image, Plainview cons local landowners into selling him their valuable properties for a pittance. However, local preacher Eli Sunday suspects Plainview\'s motives and intentions, starting a slow-burning feud that threatens both their lives.'),
(85, 'A Clockwork Orange', 'Stanley Kubrick', 1971, 'Science Fiction', 'In a near-future Britain, young Alexander DeLarge and his pals get their kicks beating and raping anyone they please. When not destroying the lives of others, Alex swoons to the music of Beethoven. The state, eager to crack down on juvenile crime, gives an incarcerated Alex the option to undergo an invasive procedure that\'ll rob him of all personal agency. In a time when conscience is a commodity, can Alex change his tune?'),
(86, 'Chungking Express', 'Wong Kar-wai', 1994, 'Comedy', 'Two melancholic Hong Kong policemen fall in love: one with a mysterious underworld figure, the other with a beautiful and ethereal server at a late-night restaurant he frequents.'),
(87, 'Titanic', 'James Cameron', 1997, 'Drama', '101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic, 84 years later. A young Rose boards the ship with her mother and fiancé. Meanwhile, Jack Dawson and Fabrizio De Rossi win third-class tickets aboard the ship. Rose tells the whole story from Titanic\'s departure through to its death—on its first and last voyage—on April 15, 1912.'),
(89, 'The Virgin Suicides', 'Sofia Coppola', 1999, 'Romance', 'A group of male friends become obsessed with five mysterious sisters who are sheltered by their strict, religious parents.'),
(90, 'Moonlight', 'Barry Jenkins', 2016, 'Drama', 'The tender, heartbreaking story of a young man’s struggle to find himself, told across three defining chapters in his life as he experiences the ecstasy, pain, and beauty of falling in love, while grappling with his own sexuality.'),
(91, 'No Country for Old Men', 'Joel Coen, Ethan Coen', 2007, 'Crime', 'Llewelyn Moss stumbles upon dead bodies, $2 million and a hoard of heroin in a Texas desert, but methodical killer Anton Chigurh comes looking for it, with local sheriff Ed Tom Bell hot on his trail. The roles of prey and predator blur as the violent pursuit of money and justice collide.'),
(93, 'Lost in Translation', 'Sofia Coppola', 2003, 'Drama', 'Two lost souls visiting Tokyo -- the young, neglected wife of a photographer and a washed-up movie star shooting a TV commercial -- find an odd solace and pensive freedom to be real in each other\'s company, away from their lives in America.'),
(94, 'Baby Driver', 'Edgar Wright', 2017, 'Crime', 'After being coerced into working for a crime boss, a young getaway driver finds himself taking part in a heist doomed to fail.'),
(95, 'The Big Lebowski', 'Joel Coen', 1998, 'Crime', 'Jeffrey \"The Dude\" Lebowski, a Los Angeles slacker who only wants to bowl and drink White Russians, is mistaken for another Jeffrey Lebowski, a wheelchair-bound millionaire, and finds himself dragged into a strange series of events involving nihilists, adult film producers, ferrets, errant toes, and large sums of money.'),
(96, 'Mad Max: Fury Road', 'George Miller', 2015, 'Adventure', 'An apocalyptic story set in the furthest reaches of our planet, in a stark desert landscape where humanity is broken, and most everyone is crazed fighting for the necessities of life. Within this world exist two rebels on the run who just might be able to restore order.'),
(97, 'Barbie', 'Greta Gerwig', 2023, 'Comedy', 'Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.'),
(98, 'Tangled', 'Byron Howard, Nathan Greno', 2010, 'Family', 'When the kingdom\'s most wanted-and most charming-bandit Flynn Rider hides out in a mysterious tower, he\'s taken hostage by Rapunzel, a beautiful and feisty tower-bound teen with 70 feet of magical, golden hair. Flynn\'s curious captor, who\'s looking for her ticket out of the tower where she\'s been locked away for years, strikes a deal with the handsome thief and the unlikely duo sets off on an action-packed escapade, complete with a super-cop horse, an over-protective chameleon and a gruff gang of pub thugs.'),
(99, 'The Wolf of Wall Street', 'Martin Scorsese', 2013, 'Comedy', 'A New York stockbroker refuses to cooperate in a large securities fraud case involving corruption on Wall Street, corporate banking world and mob infiltration. Based on Jordan Belfort\'s autobiography.'),
(100, 'Drive', 'Nicolas Winding Refn', 2011, 'Thriller', 'Driver is a skilled Hollywood stuntman who moonlights as a getaway driver for criminals. Though he projects an icy exterior, lately he\'s been warming up to a pretty neighbor named Irene and her young son, Benicio. When Irene\'s husband gets out of jail, he enlists Driver\'s help in a million-dollar heist. The job goes horribly wrong, and Driver must risk his life to protect Irene and Benicio from the vengeful masterminds behind the robbery.'),
(101, 'Apocalypse Now', 'Francis Ford Coppola', 1979, 'Drama', 'At the height of the Vietnam war, Captain Benjamin Willard is sent on a dangerous mission that, officially, \"does not exist, nor will it ever exist.\" His goal is to locate - and eliminate - a mysterious Green Beret Colonel named Walter Kurtz, who has been leading his personal army on illegal guerrilla missions into enemy territory.'),
(102, 'Your Name.', 'Makoto Shinkai', 2016, 'Romance', 'High schoolers Mitsuha and Taki are complete strangers living separate lives. But one night, they suddenly switch places. Mitsuha wakes up in Taki’s body, and he in hers. This bizarre occurrence continues to happen randomly, and the two must adjust their lives around each other.'),
(103, 'The Godfather: Part II', 'Francis Ford Coppola', 1974, 'Crime', 'In the continuing saga of the Corleone crime family, a young Vito Corleone grows up in Sicily and in 1910s New York. In the 1950s, Michael Corleone attempts to expand the family business into Las Vegas, Hollywood and Cuba.'),
(104, 'Fallen Angels', 'Wong Kar-wai', 1995, 'Crime', 'In this bifurcated crime narrative, a disillusioned hitman attempts to escape from his violent lifestyle against the wishes of his partner, who is infatuated with him, and an eccentric mute repeatedly encounters, then subsequently falls for a depressed woman looking for the prostitute who supposedly stole her ex-boyfriend\'s affections.'),
(105, 'Harry Potter and the Prisoner of Azkaban', 'Alfonso Cuarón', 2004, 'Fantasy', 'Year three at Hogwarts means new fun and challenges as Harry learns the delicate art of approaching a Hippogriff, transforming shape-shifting Boggarts into hilarity and even turning back time. But the term also brings danger: soul-sucking Dementors hover over the school, an ally of the accursed He-Who-Cannot-Be-Named lurks within the castle walls, and fearsome wizard Sirius Black escapes Azkaban. And Harry will confront them all.'),
(106, '(500) Days of Summer', 'Marc Webb', 2009, 'Romance', 'Tom, greeting-card writer and hopeless romantic, is caught completely off-guard when his girlfriend, Summer, suddenly dumps him. He reflects on their 500 days together to try to figure out where their love affair went sour, and in doing so, Tom rediscovers his true passions in life.'),
(107, 'When Harry Met Sally...', 'Rob Reiner', 1989, 'Drama', 'During their travel from Chicago to New York, Harry and Sally debate whether or not sex ruins a friendship between a man and a woman. Eleven years later, and they\'re still no closer to finding the answer.'),
(108, 'Ferris Bueller\'s Day Off', 'John Hughes', 1986, 'Comedy', 'After high school slacker Ferris Bueller successfully fakes an illness in order to skip school for the day, he goes on a series of adventures throughout Chicago with his girlfriend Sloane and best friend Cameron, all the while trying to outwit his wily school principal and fed-up sister.'),
(109, 'The Hunger Games: Catching Fire', 'Francis Lawrence', 2013, 'Science Fiction', 'Katniss Everdeen has returned home safe after winning the 74th Annual Hunger Games along with fellow tribute Peeta Mellark. Winning means that they must turn around and leave their family and close friends, embarking on a \"Victor\'s Tour\" of the districts. Along the way Katniss senses that a rebellion is simmering, but the Capitol is still very much in control as President Snow prepares the 75th Annual Hunger Games (The Quarter Quell) - a competition that could change Panem forever.'),
(110, 'Past Lives', 'Celine Song', 2023, 'Drama', 'Nora and Hae Sung, two childhood friends, are reunited in New York for one fateful week as they confront notions of destiny, love, and the choices that make a life.'),
(111, 'Get Out', 'Jordan Peele', 2017, 'Horror', 'Chris and his girlfriend Rose go upstate to visit her parents for the weekend. At first, Chris reads the family\'s overly accommodating behavior as nervous attempts to deal with their daughter\'s interracial relationship, but as the weekend progresses, a series of increasingly disturbing discoveries lead him to a truth that he never could have imagined.'),
(112, 'Paris, Texas', 'Wim Wenders', 1984, 'Drama', 'A man wanders out of the desert not knowing who he is. His brother finds him, and helps to pull his memory back of the life he led before he walked out on his family and disappeared four years earlier.'),
(113, 'Star Wars', 'George Lucas', 1977, 'Adventure', 'Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.'),
(114, 'Poor Things', 'Yorgos Lanthimos', 2023, 'Romance', 'Brought back to life by an unorthodox scientist, a young woman runs off with a lawyer on a whirlwind adventure across the continents. Free from the prejudices of her times, she grows steadfast in her purpose to stand for equality and liberation.'),
(115, 'Neon Genesis Evangelion: The End of Evangelion', 'Hideaki Anno, Kazuya Tsurumaki', 1997, 'Science Fiction', 'The second of two theatrically released follow-ups to the Neon Genesis Evangelion series. Comprising of two alternate episodes which were first intended to take the place of episodes 25 and 26, this finale answers many of the questions surrounding the series, while also opening up some new possibilities.'),
(116, 'The Notebook', 'Nick Cassavetes', 2004, 'Romance', 'An epic love story centered around an older man who reads aloud to a woman with Alzheimer\'s. From a faded notebook, the old man\'s words bring to life the story about a couple who is separated by World War II, and is then passionately reunited, seven years later, after they have taken different paths.'),
(117, 'Requiem for a Dream', 'Darren Aronofsky', 2000, 'Drama', 'The hopes and dreams of four ambitious people are shattered when their drug addictions begin spiraling out of control. A look into addiction and how it overcomes the mind and body.'),
(118, 'The Prestige', 'Christopher Nolan', 2006, 'Science Fiction', 'A mysterious story of two magicians whose intense rivalry leads them on a life-long battle for supremacy -- full of obsession, deceit and jealousy with dangerous and deadly consequences.'),
(119, 'Joker', 'Todd Phillips', 2019, 'Crime', 'During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.'),
(120, 'The Lighthouse', 'Robert Eggers', 2019, 'Horror', 'Two lighthouse keepers try to maintain their sanity while living on a remote and mysterious New England island in the 1890s.'),
(121, 'Almost Famous', 'Cameron Crowe', 2000, 'Drama', 'In 1973, 15-year-old William Miller\'s unabashed love of music and aspiration to become a rock journalist lands him an assignment from Rolling Stone magazine to interview and tour with the up-and-coming band, Stillwater.'),
(122, 'The Princess Bride', 'Rob Reiner', 1987, 'Adventure', 'In this enchantingly cracked fairy tale, the beautiful Princess Buttercup and the dashing Westley must overcome staggering odds to find happiness amid six-fingered swordsmen, murderous princes, Sicilians and rodents of unusual size. But even death can\'t stop these true lovebirds from triumphing.'),
(123, 'Dune', 'Denis Villeneuve', 2021, 'Science Fiction', 'Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet\'s exclusive supply of the most precious resource in existence-a commodity capable of unlocking humanity\'s greatest potential-only those who can conquer their fear will survive.'),
(124, 'The Royal Tenenbaums', 'Wes Anderson', 2001, 'Drama', 'Royal Tenenbaum and his wife Etheline had three children and then they separated. All three children are extraordinary --- all geniuses. Virtually all memory of the brilliance of the young Tenenbaums was subsequently erased by two decades of betrayal, failure, and disaster. Most of this was generally considered to be their father\'s fault. \"The Royal Tenenbaums\" is the story of the family\'s sudden, unexpected reunion one recent winter.'),
(125, 'Scarface', 'Brian De Palma', 1983, 'Drama', 'After getting a green card in exchange for assassinating a Cuban government official, Tony Montana stakes a claim on the drug trade in Miami. Viciously murdering anyone who stands in his way, Tony eventually becomes the biggest drug lord in the state, controlling nearly all the cocaine that comes through Miami. But increased pressure from the police, wars with Colombian drug cartels and his own drug-fueled paranoia serve to fuel the flames of his eventual downfall.'),
(126, 'The Devil Wears Prada', 'David Frankel', 2006, 'Comedy', 'Andy moves to New York to work in the fashion industry. Her boss is extremely demanding, cruel and won\'t let her succeed if she doesn\'t fit into the high class elegant look of their magazine.'),
(127, 'Twilight', 'Catherine Hardwicke', 2008, 'Romance', 'When Bella Swan moves to a small town in the Pacific Northwest to live with her father, she meets the reclusive Edward Cullen, a mysterious classmate who reveals himself to be a 108-year-old vampire. Despite Edward\'s repeated cautions, Bella can\'t help but fall in love with him, a fatal move that endangers her own life when a coven of bloodsuckers try to challenge the Cullen clan.'),
(128, 'Bottoms', 'Emma Seligman', 2023, 'Comedy', 'PJ and Josie start a fight club as a way to lose their virginities to cheerleaders. The fight club gains traction and soon the most popular girls in school are beating each other up in the name of self-defense. But the pair find themselves in over their heads and in need of a way out before their plan is exposed.'),
(129, 'The Worst Person in the World', 'Joachim Trier', 2021, 'Drama', 'Chronicles four years in the life of Julie, a young woman who navigates the troubled waters of her love life and struggles to find her career path, leading her to take a realistic look at who she really is.'),
(130, 'The Rocky Horror Picture Show', 'Jim Sharman', 1975, 'Science Fiction', 'Sweethearts Brad and Janet, stuck with a flat tire during a storm, discover the eerie mansion of Dr. Frank-N-Furter, a transvestite scientist. As their innocence is lost, Brad and Janet meet a houseful of wild characters, including a rocking biker and a creepy butler. Through elaborate dances and rock songs, Frank-N-Furter unveils his latest creation: a muscular man named \'Rocky\'.'),
(131, 'Frances Ha', 'Noah Baumbach', 2012, 'Drama', 'An aspiring dancer moves to New York City and becomes caught up in a whirlwind of flighty fair-weather friends, diminishing fortunes and career setbacks.'),
(132, 'Cinema Paradiso', 'Giuseppe Tornatore', 1988, 'Drama', 'A filmmaker recalls his childhood, when he fell in love with the movies at his village\'s theater and formed a deep friendship with the theater\'s projectionist.'),
(133, 'Superbad', 'Greg Mottola', 2007, 'Comedy', 'Two co-dependent high school seniors are forced to deal with separation anxiety after their plan to stage a booze-soaked party goes awry.'),
(134, 'Beautiful Boy', 'Felix van Groeningen', 2018, 'Drama', 'After he and his first wife separate, journalist David Sheff struggles to help their teenage son, who goes from experimenting with drugs to becoming devastatingly addicted to methamphetamine.'),
(135, 'Shrek 2', 'Andrew Adamson, Kelly Asbury, …', 2004, 'Family', 'Shrek, Fiona and Donkey set off to Far, Far Away to meet Fiona\'s mother and father. But not everyone is happy. Shrek and the King find it hard to get along, and there\'s tension in the marriage. The fairy godmother discovers that Shrek has married Fiona instead of her Son Prince Charming and sets about destroying their marriage.'),
(136, 'Jojo Rabbit', 'Taika Waititi', 2019, 'War', 'A World War II satire that follows a lonely German boy whose world view is turned upside down when he discovers his single mother is hiding a young Jewish girl in their attic. Aided only by his idiotic imaginary friend, Adolf Hitler, Jojo must confront his blind nationalism.'),
(137, 'The Lord of the Rings: The Two Towers', 'Peter Jackson', 2002, 'Fantasy', 'Frodo and Sam are trekking to Mordor to destroy the One Ring of Power while Gimli, Legolas and Aragorn search for the orc-captured Merry and Pippin. All along, nefarious wizard Saruman awaits the Fellowship members at the Orthanc Tower in Isengard.'),
(138, 'Stand by Me', 'Rob Reiner', 1986, 'Drama', 'After learning that a stranger has been accidentally killed near their rural homes, four Oregon boys decide to go see the body. On the way, Gordie Lachance, Vern Tessio, Chris Chambers and Teddy Duchamp encounter a mean junk man and a marsh full of leeches, as they also learn more about one another and their very different home lives. Just a lark at first, the boys\' adventure evolves into a defining event in their lives.'),
(139, 'Once Upon a Time… in Hollywood', 'Quentin Tarantino', 2019, 'Drama', 'Los Angeles, 1969. TV star Rick Dalton, a struggling actor specializing in westerns, and stuntman Cliff Booth, his best friend, try to survive in a constantly changing movie industry. Dalton is the neighbor of the young and promising actress and model Sharon Tate, who has just married the prestigious Polish director Roman Polanski…'),
(140, 'Mean Girls', 'Mark Waters', 2004, 'Comedy', 'Cady Heron is a hit with The Plastics, the A-list girl clique at her new school, until she makes the mistake of falling for Aaron Samuels, the ex-boyfriend of alpha Plastic Regina George.'),
(141, 'Avengers: Endgame', 'Anthony Russo, Joe Russo', 2019, 'Science Fiction', 'After the devastating events of Avengers: Infinity War, the universe is in ruins due to the efforts of the Mad Titan, Thanos. With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos\' actions and restore order to the universe once and for all, no matter what consequences may be in store.'),
(142, 'Juno', 'Jason Reitman', 2007, 'Romance', 'Faced with an unplanned pregnancy, an offbeat young woman makes an unusual decision regarding her unborn child.'),
(143, 'The Breakfast Club', 'John Hughes', 1985, 'Drama', 'Five disparate high school students meet in Saturday detention, and discover they have a lot more in common than they thought.'),
(144, 'Memento', 'Christopher Nolan', 2000, 'Mystery', 'Leonard Shelby is tracking down the man who raped and murdered his wife. The difficulty of locating his wife\'s killer, however, is compounded by the fact that he suffers from a rare, untreatable form of short-term memory loss. Although he can recall details of life before his accident, Leonard cannot remember what happened fifteen minutes ago, where he\'s going, or why.'),
(145, 'Spider-Man: No Way Home', 'Jon Watts', 2021, 'Action', 'Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.'),
(146, 'The Good, the Bad and the Ugly', 'Sergio Leone', 1966, 'Western', 'While the Civil War rages on between the Union and the Confederacy, three men – a quiet loner, a ruthless hitman, and a Mexican bandit – comb the American Southwest in search of a strongbox containing $200,000 in stolen gold.'),
(147, 'Léon: The Professional', 'Luc Besson', 1994, 'Crime', 'Léon, the top hit man in New York, has earned a rep as an effective \"cleaner\". But when his next-door neighbors are wiped out by a loose-cannon DEA agent, he becomes the unwilling custodian of 12-year-old Mathilda. Before long, Mathilda\'s thoughts turn to revenge, and she considers following in Léon\'s footsteps.'),
(148, 'Before Sunset', 'Richard Linklater', 2004, 'Drama', 'Nine years ago two strangers met by chance and spent a night in Vienna that ended before sunrise. They are about to meet for the first time since. Now they have one afternoon to find out if they belong together.'),
(149, 'Pan\'s Labyrinth', 'Guillermo del Toro', 2006, 'War', 'Living with her tyrannical stepfather in a new home with her pregnant mother, 10-year-old Ofelia feels alone until she explores a decaying labyrinth guarded by a mysterious faun who claims to know her destiny. If she wishes to return to her real father, Ofelia must complete three terrifying tasks.'),
(150, 'Pearl', 'Ti West', 2022, 'Horror', 'Trapped on her family’s isolated farm, Pearl must tend to her ailing father under the bitter and overbearing watch of her devout mother. Lusting for a glamorous life like she’s seen in the movies, Pearl’s ambitions, temptations, and repressions all collide, in the stunning, technicolor-inspired origin story of X’s iconic villain.');
INSERT INTO `movies` (`id`, `title`, `director`, `release_year`, `genre`, `description`) VALUES
(151, 'Brokeback Mountain', 'Ang Lee', 2005, 'Romance', 'Two modern-day cowboys meet on a shepherding job in the summer of \'63, the two share a raw and powerful summer together that turns into a lifelong relationship conflicting with the lives they are supposed to live.'),
(152, 'WALL·E', 'Andrew Stanton', 2008, 'Animation', 'WALL·E is the last robot left on an Earth that has been overrun with garbage and all humans have fled to outer space. For 700 years he has continued to try and clean up the mess, but has developed some rather interesting human-like qualities. When a ship arrives with a sleek new type of robot, WALL·E thinks he\'s finally found a friend and stows away on the ship when it leaves.'),
(153, 'How to Train Your Dragon', 'Chris Sanders, Dean DeBlois', 2010, 'Fantasy', 'As the son of a Viking leader on the cusp of manhood, shy Hiccup Horrendous Haddock III faces a rite of passage: he must kill a dragon to prove his warrior mettle. But after downing a feared dragon, he realizes that he no longer wants to destroy it, and instead befriends the beast – which he names Toothless – much to the chagrin of his warrior father'),
(154, 'The Departed', 'Martin Scorsese', 2006, 'Crime', 'To take down South Boston\'s Irish Mafia, the police send in one of their own to infiltrate the underworld, not realizing the syndicate has done likewise. While an undercover cop curries favor with the mob kingpin, a career criminal rises through the police ranks. But both sides soon discover there\'s a mole among them.'),
(155, 'The Florida Project', 'Sean Baker', 2017, 'Drama', 'The story of a precocious six year-old and her ragtag group of friends whose summer break is filled with childhood wonder, possibility and a sense of adventure while the adults around them struggle with hard times.'),
(156, 'Memories of Murder', 'Bong Joon-ho', 2003, 'Thriller', '1986 Gyunggi Province. The body of a young woman is found brutally raped and murdered. Two months later, a series of rapes and murders commences under similar circumstances. And in a country that had never known such crimes, the dark whispers about a serial murderer grow louder. A special task force is set up in the area, with two local detectives Park Doo-Man and Jo Young-Goo joined by a detective from Seoul who requested to be assigned to the case.'),
(157, 'Clueless', 'Amy Heckerling', 1995, 'Drama', 'Shallow, rich and socially successful Cher is at the top of her Beverly Hills high school\'s pecking scale. Seeing herself as a matchmaker, Cher first coaxes two teachers into dating each other. Emboldened by her success, she decides to give hopelessly klutzy new student Tai a makeover. When Tai becomes more popular than she is, Cher realizes that her disapproving ex-stepbrother was right about how misguided she was -- and falls for him.'),
(158, 'Jaws', 'Steven Spielberg', 1975, 'Adventure', 'When an insatiable great white shark terrorizes the townspeople of Amity Island, the police chief, an oceanographer and a grizzled shark hunter seek to destroy the blood-thirsty beast.'),
(159, 'Avengers: Infinity War', 'Anthony Russo, Joe Russo', 2018, 'Action', 'As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment - the fate of Earth and existence itself has never been more uncertain.'),
(160, 'Heat', 'Michael Mann', 1995, 'Crime', 'Obsessive master thief Neil McCauley leads a top-notch crew on various daring heists throughout Los Angeles while determined detective Vincent Hanna pursues him without rest. Each man recognizes and respects the ability and the dedication of the other even though they are aware their cat-and-mouse game may end in violence.'),
(161, 'The Secret Life of Walter Mitty', 'Ben Stiller', 2013, 'Comedy', 'A timid magazine photo manager who lives life vicariously through daydreams embarks on a true-life adventure when a negative goes missing.'),
(162, 'Akira', 'Katsuhiro Otomo', 1988, 'Animation', 'A secret military project endangers Neo-Tokyo when it turns a biker gang member into a rampaging psychic psychopath that only two teenagers and a group of psychics can stop.'),
(163, 'Babylon', 'Damien Chazelle', 2022, 'Comedy', 'A tale of outsized ambition and outrageous excess, tracing the rise and fall of multiple characters in an era of unbridled decadence and depravity during Hollywood\'s transition from silent films and to sound films in the late 1920s.'),
(164, 'Halloween', 'John Carpenter', 1978, 'Horror', 'Fifteen years after murdering his sister on Halloween Night 1963, Michael Myers escapes from a mental hospital and returns to the small town of Haddonfield, Illinois to kill again.'),
(165, 'Ponyo', 'Hayao Miyazaki', 2008, 'Family', 'The son of a sailor, 5-year old Sosuke lives a quiet life on an oceanside cliff with his mother Lisa. One fateful day, he finds a beautiful goldfish trapped in a bottle on the beach and upon rescuing her, names her Ponyo. But she is no ordinary goldfish. The daughter of a masterful wizard and a sea goddess, Ponyo uses her father\'s magic to transform herself into a young girl and quickly falls in love with Sosuke, but the use of such powerful sorcery causes a dangerous imbalance in the world. As the moon steadily draws nearer to the earth and Ponyo\'s father sends the ocean\'s mighty waves to find his daughter, the two children embark on an adventure of a lifetime to save the world and fulfill Ponyo\'s dreams of becoming human.'),
(166, 'Hot Fuzz', 'Edgar Wright', 2007, 'Action', 'As a former London constable, Nicholas Angel finds it difficult to adapt to his new assignment in the sleepy British village of Sandford. Not only does he miss the excitement of the big city, but he also has a well-meaning oaf for a partner. However, when a series of grisly accidents rocks Sandford, Angel smells something rotten in the idyllic village.'),
(167, 'My Neighbor Totoro', 'Hayao Miyazaki', 1988, 'Fantasy', 'Two sisters move to the country with their father in order to be closer to their hospitalized mother, and discover the surrounding trees are inhabited by Totoros, magical spirits of the forest. When the youngest runs away from home, the older sister seeks help from the spirits to find her.'),
(168, 'Kiki\'s Delivery Service', 'Hayao Miyazaki', 1989, 'Family', 'A young witch, on her mandatory year of independent life, finds fitting into a new community difficult while she supports herself by running an air courier service.'),
(169, 'Moonrise Kingdom', 'Wes Anderson', 2012, 'Romance', 'Set on an island off the coast of New England in the summer of 1965, Moonrise Kingdom tells the story of two twelve-year-olds who fall in love, make a secret pact, and run away together into the wilderness. As various authorities try to hunt them down, a violent storm is brewing off-shore – and the peaceful island community is turned upside down in more ways than anyone can handle.'),
(170, 'Stalker', 'Andrei Tarkovsky', 1979, 'Drama', 'Near a gray and unnamed city is the Zone, a place guarded by barbed wire and soldiers, and where the normal laws of physics are victim to frequent anomalies. A stalker guides two men into the Zone, specifically to an area in which deep-seated desires are granted.'),
(171, 'Spider-Man 2', 'Sam Raimi', 2004, 'Action', 'Peter Parker is going through a major identity crisis. Burned out from being Spider-Man, he decides to shelve his superhero alter ego, which leaves the city suffering in the wake of carnage left by the evil Doc Ock. In the meantime, Parker still can\'t act on his feelings for Mary Jane Watson, a girl he\'s loved since childhood.'),
(172, 'Dazed and Confused', 'Richard Linklater', 1993, 'Drama', 'The adventures of a group of Texas teens on their last day of school in 1976, centering on student Randall Floyd, who moves easily among stoners, jocks and geeks. Floyd is a star athlete, but he also likes smoking weed, which presents a conundrum when his football coach demands he sign a \"no drugs\" pledge.'),
(173, 'But I\'m a Cheerleader', 'Jamie Babbit', 1999, 'Romance', 'Megan is an all-American girl. A cheerleader. She has a boyfriend. But Megan doesn\'t like kissing her boyfriend very much. And she\'s pretty touchy with her cheerleader friends. Her conservative parents worry that she must be a lesbian and send her off to \"sexual redirection\" school, where she must, with other lesbians and gays learn how to be straight.'),
(174, 'The Nightmare Before Christmas', 'Henry Selick', 1993, 'Family', 'Tired of scaring humans every October 31 with the same old bag of tricks, Jack Skellington, the spindly king of Halloween Town, kidnaps Santa Claus and plans to deliver shrunken heads and other ghoulish gifts to children on Christmas morning. But as Christmas approaches, Jack\'s rag-doll girlfriend, Sally, tries to foil his misguided plans.'),
(175, 'Gladiator', 'Ridley Scott', 2000, 'Action', 'In the year 180, the death of emperor Marcus Aurelius throws the Roman Empire into chaos.  Maximus is one of the Roman army\'s most capable and trusted generals and a key advisor to the emperor.  As Marcus\' devious son Commodus ascends to the throne, Maximus is set to be executed.  He escapes, but is captured by slave traders.  Renamed Spaniard and forced to become a gladiator, Maximus must battle to the death with other men for the amusement of paying audiences.'),
(176, 'Moulin Rouge!', 'Baz Luhrmann', 2001, 'Romance', 'A celebration of love and creative inspiration takes place in the infamous, gaudy and glamorous Parisian nightclub, at the cusp of the 20th century. A young poet, who is plunged into the heady world of Moulin Rouge, begins a passionate affair with the club\'s most notorious and beautiful star.'),
(177, 'How to Lose a Guy in 10 Days', 'Donald Petrie', 2003, 'Comedy', 'An advice columnist, Andie Anderson, tries pushing the boundaries of what she can write about in her new piece about how to get a man to leave you in 10 days. Her editor, Lana, loves it, and Andie goes off to find a man she can use for the experiment. Enter executive Ben Berry, who is so confident in his romantic prowess that he thinks he can make any woman fall in love with him in 10 days. When Andie and Ben meet, their plans backfire.'),
(178, 'Avatar', 'James Cameron', 2009, 'Fantasy', 'In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission, but becomes torn between following orders and protecting an alien civilization.'),
(179, 'Schindler\'s List', 'Steven Spielberg', 1993, 'History', 'The true story of how businessman Oskar Schindler saved over a thousand Jewish lives from the Nazis while they worked as slaves in his factory during World War II.'),
(180, 'Eyes Wide Shut', 'Stanley Kubrick', 1999, 'Thriller', 'After Dr. Bill Harford\'s wife, Alice, admits to having sexual fantasies about a man she met, Bill becomes obsessed with having a sexual encounter. He discovers an underground sexual group and attends one of their meetings -- and quickly discovers that he is in over his head.'),
(181, 'Pitch Perfect', 'Jason Moore', 2012, 'Music', 'College student Beca knows she does not want to be part of a clique, but that\'s exactly where she finds herself after arriving at her new school. Thrust in among mean gals, nice gals and just plain weird gals, Beca finds that the only thing they have in common is how well they sing together. She takes the women of the group out of their comfort zone of traditional arrangements and into a world of amazing harmonic combinations in a fight to the top of college music competitions.'),
(182, 'The Lion King', 'Roger Allers, Rob Minkoff', 1994, 'Animation', 'A young lion prince is cast out of his pride by his cruel uncle, who claims he killed his father. While the uncle rules with an iron paw, the prince grows up beyond the Savannah, living by a philosophy: No worries for the rest of your days. But when his past comes to haunt him, the young prince must decide his fate: Will he remain an outcast or face his demons and become what he needs to be?'),
(183, 'Raiders of the Lost Ark', 'Steven Spielberg', 1981, 'Adventure', 'When Dr. Indiana Jones – the tweed-suited professor who just happens to be a celebrated archaeologist – is hired by the government to locate the legendary Ark of the Covenant, he finds himself up against the entire Nazi regime.'),
(184, 'Reservoir Dogs', 'Quentin Tarantino', 1992, 'Crime', 'A botched robbery indicates a police informant, and the pressure mounts in the aftermath at a warehouse. Crime begets violence as the survivors -- veteran Mr. White, newcomer Mr. Orange, psychopathic parolee Mr. Blonde, bickering weasel Mr. Pink and Nice Guy Eddie -- unravel.'),
(185, 'Persona', 'Ingmar Bergman', 1966, 'Drama', 'A young nurse, Alma, is put in charge of Elisabeth Vogler: an actress who is seemingly healthy in all respects, but will not talk. As they spend time together, Alma speaks to Elisabeth constantly, never receiving any answer. Alma eventually confesses her secrets to a seemingly sympathetic Elisabeth and finds that her own personality is being submerged into Elisabeth\'s persona.'),
(186, 'Corpse Bride', 'Tim Burton, Mike Johnson', 2005, 'Animation', 'Set in a 19th-century european village, this stop-motion animation feature follows the story of Victor, a young man whisked away to the underworld and wed to a mysterious corpse bride, while his real bride Victoria waits bereft in the land of the living.'),
(187, 'One Flew Over the Cuckoo\'s Nest', 'Miloš Forman', 1975, 'Drama', 'While serving time for insanity at a state mental hospital, implacable rabble-rouser, Randle Patrick McMurphy, inspires his fellow patients to rebel against the authoritarian rule of head nurse, Mildred Ratched.'),
(188, 'A Silent Voice', 'Naoko Yamada', 2016, 'Drama', 'Shouya Ishida starts bullying the new girl in class, Shouko Nishimiya, because she is deaf. But as the teasing continues, the rest of the class starts to turn on Shouya for his lack of compassion. When they leave elementary school, Shouko and Shouya do not speak to each other again... until an older, wiser Shouya, tormented by his past behaviour, decides he must see Shouko once more. He wants to atone for his sins, but is it already too late...?'),
(189, 'Children of Men', 'Alfonso Cuarón', 2006, 'Action', 'In 2027, in a chaotic world in which humans can no longer procreate, a former activist agrees to help transport a miraculously pregnant woman to a sanctuary at sea, where her child\'s birth may help scientists save the future of humankind.'),
(190, 'It\'s a Wonderful Life', 'Frank Capra', 1946, 'Family', 'A holiday favourite for generations...  George Bailey has spent his entire life giving to the people of Bedford Falls.  All that prevents rich skinflint Mr. Potter from taking over the entire town is George\'s modest building and loan company.  But on Christmas Eve the business\'s $8,000 is lost and George\'s troubles begin.'),
(191, 'Carol', 'Todd Haynes', 2015, 'Romance', 'In 1950s New York, a department-store clerk who dreams of a better life falls for an older, married woman.'),
(192, 'Bones and All', 'Luca Guadagnino', 2022, 'Horror', 'Abandoned by her father, a young woman embarks on a thousand-mile odyssey through the backroads of America where she meets a disenfranchised drifter. But despite their best efforts, all roads lead back to their terrifying pasts and to a final stand that will determine whether their love can survive their otherness.'),
(193, 'Casablanca', 'Michael Curtiz', 1942, 'Drama', 'In Casablanca, Morocco in December 1941, a cynical American expatriate meets a former lover, with unforeseen complications.'),
(194, 'Cars', 'John Lasseter', 2006, 'Adventure', 'Lightning McQueen, a hotshot rookie race car driven to succeed, discovers that life is about the journey, not the finish line, when he finds himself unexpectedly detoured in the sleepy Route 66 town of Radiator Springs. On route across the country to the big Piston Cup Championship in California to compete against two seasoned pros, McQueen gets to know the town\'s offbeat characters.'),
(195, 'Heathers', 'Michael Lehmann', 1989, 'Crime', 'A girl who halfheartedly tries to be part of the \"in crowd\" of her school meets a rebel who teaches her a more devious way to play social politics: by killing the popular kids.'),
(196, 'Edward Scissorhands', 'Tim Burton', 1990, 'Drama', 'A small suburban town receives a visit from a castaway unfinished science experiment named Edward.'),
(197, 'The Witch', 'Robert Eggers', 2015, 'Drama', 'In 1630s New England, William and Katherine lead a devout Christian life with five children, homesteading on the edge of an impassable wilderness, exiled from their settlement when William defies the local church. When their newborn son vanishes and crops mysteriously fail, the family turns on one another.'),
(198, 'Manchester by the Sea', 'Kenneth Lonergan', 2016, 'Drama', 'After his older brother passes away, Lee Chandler is forced to return home to care for his 16-year-old nephew. There he is compelled to deal with a tragic past that separated him from his family and the community where he was born and raised.'),
(199, 'Singin\' in the Rain', 'Stanley Donen, Gene Kelly', 1952, 'Romance', 'In 1927 Hollywood, a silent film production company and cast make a difficult transition to sound.'),
(200, 'Jennifer\'s Body', 'Karyn Kusama', 2009, 'Horror', 'A newly possessed cheerleader turns into a killer who specializes in offing her male classmates. Can her best friend put an end to the horror?'),
(201, 'Rear Window', 'Alfred Hitchcock', 1954, 'Mystery', 'Professional photographer L.B. \'Jeff\' Jeffries breaks his leg while getting an action shot at an auto race. Confined to his New York apartment, he spends his time looking out of the rear window observing the neighbors. When he begins to suspect that a man across the courtyard may have murdered his wife, Jeff enlists the help of his high society fashion-consultant girlfriend and his visiting nurse to investigate.'),
(202, 'Possession', 'Andrzej Żuławski', 1981, 'Horror', 'A young woman left her family for an unspecified reason. The husband determines to find out the truth and starts following his wife. At first, he suspects that a man is involved. But gradually, he finds out more and more strange behaviors and bizarre incidents that indicate something more than a possessed love affair.'),
(203, 'The Holdovers', 'Alexander Payne', 2023, 'Comedy', 'A curmudgeonly instructor at a New England prep school is forced to remain on campus during Christmas break to babysit the handful of students with nowhere to go. Eventually, he forms an unlikely bond with one of them — a damaged, brainy troublemaker — and with the school’s head cook, who has just lost a son in Vietnam.'),
(204, '1917', 'Sam Mendes', 2019, 'History', 'At the height of the First World War, two young British soldiers must cross enemy territory and deliver a message that will stop a deadly attack on hundreds of soldiers.'),
(205, 'mid90s', 'Jonah Hill', 2018, 'Drama', 'Stevie is a sweet 13-year-old about to explode. His mom is loving and attentive, but a little too forthcoming about her romantic life. His big brother is a taciturn and violent bully. So Stevie searches his working-class Los Angeles suburb for somewhere to belong. He finds it at the Motor Avenue skate shop.'),
(206, 'American Beauty', 'Sam Mendes', 1999, 'Drama', 'Lester Burnham, a depressed suburban father in a mid-life crisis, decides to turn his hectic life around after developing an infatuation with his daughter\'s attractive friend.'),
(207, 'Phantom Thread', 'Paul Thomas Anderson', 2017, 'Drama', 'In 1950s London, renowned British dressmaker Reynolds Woodcock comes across Alma, a young, strong-willed woman, who soon becomes ever present in his life as his muse and lover.'),
(208, 'Marie Antoinette', 'Sofia Coppola', 2006, 'History', 'The retelling of France\'s iconic but ill-fated queen, Marie Antoinette. From her betrothal and marriage to Louis XVI at 15 to her reign as queen at 19 and ultimately the fall of Versailles.'),
(209, 'Saltburn', 'Emerald Fennell', 2023, 'Comedy', 'Struggling to find his place at Oxford University, student Oliver Quick finds himself drawn into the world of the charming and aristocratic Felix Catton, who invites him to Saltburn, his eccentric family\'s sprawling estate, for a summer never to be forgotten.'),
(210, 'Labyrinth', 'Jim Henson', 1986, 'Fantasy', 'When teen Sarah is forced to babysit her half-brother Toby, she summons Jareth the Goblin King to take him away. When he is actually kidnapped, Sarah is given just thirteen hours to solve a labyrinth and rescue him.'),
(211, 'Notting Hill', 'Roger Michell', 1999, 'Comedy', 'William Thacker is a London bookstore owner whose humdrum existence is thrown into romantic turmoil when famous American actress Anna Scott appears in his shop. A chance encounter over spilled orange juice leads to a kiss that blossoms into a full-blown affair. As the average bloke and glamorous movie star draw closer and closer together, they struggle to reconcile their radically different lifestyles in the name of love.'),
(212, 'The Sound of Music', 'Robert Wise', 1965, 'Drama', 'A tomboyish postulant at an Austrian abbey becomes a governess in the home of a widowed naval captain with seven children, and brings a new love of life and music into the home.'),
(213, 'Come and See', 'Elem Klimov', 1985, 'War', 'The invasion of a village in Byelorussia by German forces sends young Florya into the forest to join the weary Resistance fighters, against his family\'s wishes. There he meets a girl, Glasha, who accompanies him back to his village. On returning home, Florya finds his family and fellow peasants massacred. His continued survival amidst the brutal debris of war becomes increasingly nightmarish, a battle between despair and hope.'),
(214, 'Vertigo', 'Alfred Hitchcock', 1958, 'Romance', 'A retired San Francisco detective suffering from acrophobia investigates the strange activities of an old friend\'s wife, all the while becoming dangerously obsessed with her.'),
(215, 'Top Gun: Maverick', 'Joseph Kosinski', 2022, 'Action', 'After more than thirty years of service as one of the Navy’s top aviators, and dodging the advancement in rank that would ground him, Pete “Maverick” Mitchell finds himself training a detachment of TOP GUN graduates for a specialized mission the likes of which no living pilot has ever seen. Facing an uncertain future and confronting the ghosts of his past, Maverick is drawn into a confrontation with his own deepest fears, culminating in a mission that demands the ultimate sacrifice from those who will be chosen to fly it.'),
(216, 'Mysterious Skin', 'Gregg Araki', 2004, 'Drama', 'A teenage hustler and a young man obsessed with alien abductions cross paths, together discovering a horrible, liberating truth.'),
(217, 'Nope', 'Jordan Peele', 2022, 'Mystery', 'Residents in a lonely gulch of inland California bear witness to an uncanny, chilling discovery.'),
(218, 'Life Is Beautiful', 'Roberto Benigni', 1997, 'Comedy', 'A touching story of an Italian book seller of Jewish ancestry who lives in his own little fairy tale. His creative and happy life would come to an abrupt halt when his entire family is deported to a concentration camp during World War II. While locked up he tries to convince his son that the whole thing is just a game.'),
(219, 'Psycho', 'Alfred Hitchcock', 1960, 'Mystery', 'When larcenous real estate clerk Marion Crane goes on the lam with a wad of cash and hopes of starting a new life, she ends up at the notorious Bates Motel, where manager Norman Bates cares for his housebound mother.'),
(220, 'The Texas Chain Saw Massacre', 'Tobe Hooper', 1974, 'Horror', 'When Sally hears that her grandfather\'s grave may have been vandalized, she and her paraplegic brother, Franklin, set out with their friends to investigate. After a detour to their family\'s old farmhouse, they discover a group of crazed, murderous outcasts living next door. As the group is attacked one by one by the chainsaw-wielding Leatherface, who wears a mask of human skin, the survivors must do everything they can to escape.'),
(221, 'Nightcrawler', 'Dan Gilroy', 2014, 'Drama', 'When Lou Bloom, desperate for work, muscles into the world of L.A. crime journalism, he blurs the line between observer and participant to become the star of his own story. Aiding him in his effort is Nina, a TV-news veteran.'),
(222, 'The Banshees of Inisherin', 'Martin McDonagh', 2022, 'Comedy', 'Two lifelong friends find themselves at an impasse when one abruptly ends their relationship, with alarming consequences for both of them.'),
(223, '13 Going on 30', 'Gary Winick', 2004, 'Comedy', 'After total humiliation at her thirteenth birthday party, Jenna Rink wants to just hide until she\'s thirty. With a little magic, her wish is granted, but it turns out that being thirty isn\'t as always as awesome as she thought it would be!'),
(224, 'Dirty Dancing', 'Emile Ardolino', 1987, 'Drama', 'Expecting the usual tedium that accompanies a summer in the Catskills with her family, 17-year-old Frances \'Baby\' Houseman is surprised to find herself stepping into the shoes of a professional hoofer—and unexpectedly falling in love.'),
(225, 'Fargo', 'Joel Coen', 1996, 'Crime', 'Jerry, a small-town Minnesota car salesman is bursting at the seams with debt... but he\'s got a plan. He\'s going to hire two thugs to kidnap his wife in a scheme to collect a hefty ransom from his wealthy father-in-law. It\'s going to be a snap and nobody\'s going to get hurt... until people start dying. Enter Police Chief Marge, a coffee-drinking, parka-wearing - and extremely pregnant - investigator who\'ll stop at nothing to get her man. And if you think her small-time investigative skills will give the crooks a run for their ransom... you betcha!'),
(226, 'Catch Me If You Can', 'Steven Spielberg', 2002, 'Drama', 'A true story about Frank Abagnale Jr. who, before his 19th birthday, successfully conned millions of dollars worth of checks as a Pan Am pilot, doctor, and legal prosecutor. An FBI agent makes it his mission to put him behind bars. But Frank not only eludes capture, he revels in the pursuit.'),
(227, 'Terminator 2: Judgment Day', 'James Cameron', 1991, 'Thriller', 'Nearly 10 years have passed since Sarah Connor was targeted for termination by a cyborg from the future. Now her son, John, the future leader of the resistance, is the target for a newer, more deadly terminator. Once again, the resistance has managed to send a protector back to attempt to save John and his mother Sarah.'),
(228, 'Synecdoche, New York', 'Charlie Kaufman', 2008, 'Drama', 'A theater director struggles with his work, and the women in his life, as he attempts to create a life-size replica of New York inside a warehouse as part of his new play.'),
(229, 'Legally Blonde', 'Robert Luketic', 2001, 'Romance', 'Elle Woods has it all. She\'s the president of her sorority, a Hawaiian Tropic girl, Miss June in her campus calendar, and, above all, a natural blonde. She dates the cutest fraternity boy on campus and wants nothing more than to be Mrs. Warner Huntington III. But, there\'s just one thing stopping Warner from popping the question: Elle is too blonde.'),
(230, 'Magnolia', 'Paul Thomas Anderson', 1999, 'Drama', 'An epic mosaic of many interrelated characters in search of happiness, forgiveness, and meaning in the San Fernando Valley.'),
(231, 'Zodiac', 'David Fincher', 2007, 'Drama', 'The true story of the investigation of the \"Zodiac Killer\", a serial killer who terrified the San Francisco Bay Area, taunting police with his ciphers and letters. The case becomes an obsession for three men as their lives and careers are built and destroyed by the endless trail of clues.'),
(232, 'Amadeus', 'Miloš Forman', 1984, 'History', 'The incredible story of genius musician Wolfgang Amadeus Mozart, told in flashback by his peer and secret rival, Antonio Salieri—now confined to an insane asylum.'),
(233, 'Whisper of the Heart', 'Yoshifumi Kondo', 1995, 'Drama', 'Shizuku lives a simple life, dominated by her love for stories and writing. One day she notices that all the library books she has have been previously checked out by the same person: \'Seiji Amasawa\'.'),
(234, 'The Pianist', 'Roman Polanski', 2002, 'Drama', 'The true story of pianist Władysław Szpilman\'s experiences in Warsaw during the Nazi occupation. When the Jews of the city find themselves forced into a ghetto, Szpilman finds work playing in a café; and when his family is deported in 1942, he stays behind, works for a while as a laborer, and eventually goes into hiding in the ruins of the war-torn city.'),
(235, 'Into the Wild', 'Sean Penn', 2007, 'Drama', 'After graduating from Emory University in 1992, top student and athlete Christopher McCandless abandons his possessions, gives his entire $24,000 savings account to charity, and hitchhikes to Alaska to live in the wilderness.'),
(236, 'The Hunger Games', 'Gary Ross', 2012, 'Fantasy', 'Every year in the ruins of what was once North America, the nation of Panem forces each of its twelve districts to send a teenage boy and girl to compete in the Hunger Games.  Part twisted entertainment, part government intimidation tactic, the Hunger Games are a nationally televised event in which “Tributes” must fight with one another until one survivor remains.  Pitted against highly-trained Tributes who have prepared for these Games their entire lives, Katniss is forced to rely upon her sharp instincts as well as the mentorship of drunken former victor Haymitch Abernathy.  If she’s ever to return home to District 12, Katniss must make impossible choices in the arena that weigh survival against humanity and life against love. The world will be watching.'),
(237, 'Coco', 'Lee Unkrich', 2017, 'Adventure', 'Despite his family’s baffling generations-old ban on music, Miguel dreams of becoming an accomplished musician like his idol, Ernesto de la Cruz. Desperate to prove his talent, Miguel finds himself in the stunning and colorful Land of the Dead following a mysterious chain of events. Along the way, he meets charming trickster Hector, and together, they set off on an extraordinary journey to unlock the real story behind Miguel\'s family history.'),
(238, 'Saw', 'James Wan', 2004, 'Crime', 'Obsessed with teaching his victims the value of life, a deranged, sadistic serial killer abducts the morally wayward. Once captured, they must face impossible choices in a horrific game of survival. The victims must fight to win their lives back, or die trying...'),
(239, 'Birdman or (The Unexpected Virtue of Ignorance)', 'Alejandro González Iñárritu', 2014, 'Drama', 'A fading actor best known for his portrayal of a popular superhero attempts to mount a comeback by appearing in a Broadway play. As opening night approaches, his attempts to become more altruistic, rebuild his career, and reconnect with friends and family prove more difficult than expected.'),
(240, 'Evil Dead II', 'Sam Raimi', 1987, 'Horror', 'Ash Williams and his girlfriend Linda find a log cabin in the woods with a voice recording from an archeologist who had recorded himself reciting ancient chants from \"The Book of the Dead.\" As they play the recording an evil power is unleashed taking over Linda\'s body.'),
(241, 'The Parent Trap', 'Nancy Meyers', 1998, 'Family', 'Hallie Parker and Annie James are identical twins separated at a young age because of their parents\' divorce. Unknowingly to their parents, the girls are sent to the same summer camp where they meet, discover the truth about themselves, and then plot with each other to switch places.'),
(242, 'Sound of Metal', 'Darius Marder', 2019, 'Music', 'A drummer begins to lose his hearing and has to come to grips with a future that will be filled with silence.'),
(244, 'Twin Peaks: Fire Walk with Me', 'David Lynch', 1992, 'Mystery', 'In the questionable town of Deer Meadow, Washington, FBI Agent Desmond inexplicably disappears while hunting for the man who murdered a teen girl. The killer is never apprehended, and, after experiencing dark visions and supernatural encounters, Agent Dale Cooper chillingly predicts that the culprit will claim another life. Meanwhile, in the more cozy town of Twin Peaks, hedonistic beauty Laura Palmer hangs with lowlifes and seems destined for a grisly fate.'),
(245, 'Suspiria', 'Dario Argento', 1977, 'Horror', 'From the moment she arrives in Freiberg, Germany, to attend the prestigious Tanz Academy, American ballet-dancer Suzy Bannion senses that something horribly evil lurks within the walls of the age-old institution.'),
(246, 'In Bruges', 'Martin McDonagh', 2008, 'Drama', 'Ray and Ken, two hit men, are in Bruges, Belgium, waiting for their next mission. While they are there they have time to think and discuss their previous assignment. When the mission is revealed to Ken, it is not what he expected.'),
(247, 'It', 'Andy Muschietti', 2017, 'Horror', 'In a small town in Maine, seven children known as The Losers Club come face to face with life problems, bullies and a monster that takes the shape of a clown called Pennywise.'),
(248, 'What We Do in the Shadows', 'Taika Waititi, Jemaine Clement', 2014, 'Horror', 'Vampire housemates try to cope with the complexities of modern life and show a newly turned hipster some of the perks of being undead.'),
(249, 'Rocky', 'John G. Avildsen', 1976, 'Drama', 'When world heavyweight boxing champion, Apollo Creed wants to give an unknown fighter a shot at the title as a publicity stunt, his handlers choose palooka Rocky Balboa, an uneducated collector for a Philadelphia loan shark. Rocky teams up with trainer  Mickey Goldmill to make the most of this once in a lifetime break.'),
(250, 'Shrek', 'Andrew Adamson, Vicky Jenson', 2001, 'Adventure', 'It ain\'t easy bein\' green -- especially if you\'re a likable (albeit smelly) ogre named Shrek. On a mission to retrieve a gorgeous princess from the clutches of a fire-breathing dragon, Shrek teams up with an unlikely compatriot -- a wisecracking donkey.');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `movie_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `comment` text COLLATE utf8mb4_general_ci NOT NULL
) ;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `movie_id`, `rating`, `comment`) VALUES
(37, 7, 4, 4, '1'),
(41, 4, 1, 5, 'bad'),
(42, 4, 1, 4, 'Apaan ini'),
(43, 4, 1, 4, 'HEHEHE');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(4, 'Diatama', 'diatama@mail.co.id', '91a73fd806ab2c005c13b4dc19130a884e909dea3f72d46e30266fe1a1f588d8'),
(5, 'Athar', 'athar@gmail.com', 'eaf89db7108470dc3f6b23ea90618264b3e8f8b6145371667c4055e9c5ce9f52'),
(6, 'test', 'testing@gmail.com', '65070cf84cc41c908610c5659de299328887784b39a3b14c347993123d4bb7bc'),
(7, '1', '1', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b');

-- --------------------------------------------------------

--
-- Table structure for table `watchlists`
--

CREATE TABLE `watchlists` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `watchlists`
--

INSERT INTO `watchlists` (`id`, `user_id`, `name`) VALUES
(16, 6, 'test'),
(17, 6, 'test2'),
(20, 7, 'Test'),
(21, 4, 'Test 2'),
(22, 4, 'Testt');

-- --------------------------------------------------------

--
-- Table structure for table `watchlist_movies`
--

CREATE TABLE `watchlist_movies` (
  `id` int NOT NULL,
  `watchlist_id` int DEFAULT NULL,
  `movie_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `watchlist_movies`
--

INSERT INTO `watchlist_movies` (`id`, `watchlist_id`, `movie_id`) VALUES
(29, 16, 100),
(30, 17, 49),
(31, 17, 49),
(39, 20, 1),
(40, 20, 5),
(41, 20, 160),
(42, 20, 98),
(43, 21, 10),
(44, 21, 20),
(45, 21, 50);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `watchlists`
--
ALTER TABLE `watchlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `watchlist_movies`
--
ALTER TABLE `watchlist_movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `watchlist_id` (`watchlist_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=262;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `watchlists`
--
ALTER TABLE `watchlists`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `watchlist_movies`
--
ALTER TABLE `watchlist_movies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `watchlists`
--
ALTER TABLE `watchlists`
  ADD CONSTRAINT `watchlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `watchlist_movies`
--
ALTER TABLE `watchlist_movies`
  ADD CONSTRAINT `watchlist_movies_ibfk_1` FOREIGN KEY (`watchlist_id`) REFERENCES `watchlists` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `watchlist_movies_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
