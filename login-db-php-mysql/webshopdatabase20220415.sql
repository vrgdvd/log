-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Ápr 15. 01:32
-- Kiszolgáló verziója: 10.4.22-MariaDB
-- PHP verzió: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `webshopdatabase`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hdd`
--

CREATE TABLE `hdd` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `capacitygb` int(4) NOT NULL,
  `rpm` int(4) NOT NULL,
  `type` int(1) NOT NULL,
  `descrip` varchar(500) NOT NULL,
  `piece` int(4) NOT NULL,
  `pricehuf` int(7) NOT NULL,
  `barcode` varchar(150) NOT NULL,
  `picture` varchar(150) NOT NULL,
  `added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `hdd`
--

INSERT INTO `hdd` (`ID`, `name`, `capacitygb`, `rpm`, `type`, `descrip`, `piece`, `pricehuf`, `barcode`, `picture`, `added`) VALUES
(1, 'Western Digital', 1000, 7200, 3, 'Western Digital 1TB 64MB WD10EZEX, 64 MB cache, SATAIII, 3,5col, WD BLUE', 12, 12590, 'ssd01', '', '2022-04-14 22:52:48'),
(2, 'Western Digital 4TB 256MB RED Pro', 4000, 7200, 3, 'Belső cache (MB): 256, Csatolófelület: SATA III, Fordulatszám (rpm): 7200, Kapacitás (GB): 4000, Méret (col): 3,5 , Termék osztály: NAS HDD, WD Red Pro', 11, 48000, 'ssd02', '', '2022-04-14 22:53:00'),
(4, 'Western Digital Blue 2.5', 2000, 5400, 2, 'A WD legmagasabb minőségi és megbízhatósági standardjai alapján készült WD Blue mobil merevlemezek olyan szolgáltatásokat nyújtanak, amelyek ideálisak a mindennapi számítógép-használat során. A legmagasabb kapacitás a lehető legnagyobb légsűrűséggel a legvékonyabb házban\r\nMerevebb struktúra a teljesítmény csökkenése, vagy fokozott áramfogyasztás nélkül.', 13, 23500, 'ssd03', '', '2022-04-14 22:53:08'),
(5, 'Seagate BarraCuda Pro 2.5', 500, 7200, 2, 'Szélesség formátuma: 2.5\"; Merevlemez kapacitás: 500 GB; Interfész: SATA3; Merevlemez interfész sebessége: 6 Gb/s; Motor fordulatszáma: 7200 ford. /p; Cache memória kapacitása: 128 MB; Átlagos forgási késleltetés (latency): 11.5 ms; Maximális belső adatátviteli sebesség: 160 MB/s; Rázkódásálló munka: 400G / 1000G üresjáraton; Olvasási hiba: % 1:10E14; Tápellátás: 5V DC (±5%); Szélesség: 69.85 mm; Magasság: 7 mm; Hossz: 100.35 mm\r\n', 14, 22000, 'ssd04', '', '2022-04-14 22:53:16'),
(6, 'Western Digital WD Black 2.5', 1000, 7200, 2, 'High performance 7200 RPM Class spin speed, up to 64MB cache and SATA 6Gb/s interface for the ultimate in power computing for notebooks.', 23, 23350, 'ssd05', '', '2022-04-14 22:53:24');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `laptop`
--

CREATE TABLE `laptop` (
  `ID` int(11) NOT NULL,
  `name` varchar(120) CHARACTER SET utf8 NOT NULL,
  `processor` int(4) NOT NULL,
  `ramtype` int(2) NOT NULL,
  `nvme` tinyint(1) NOT NULL,
  `ssdhdd` tinyint(1) NOT NULL,
  `descrip` varchar(1500) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `piece` int(4) NOT NULL,
  `pricehuf` int(7) NOT NULL,
  `barcode` varchar(150) NOT NULL,
  `picture` varchar(150) NOT NULL,
  `added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `laptop`
--

INSERT INTO `laptop` (`ID`, `name`, `processor`, `ramtype`, `nvme`, `ssdhdd`, `descrip`, `piece`, `pricehuf`, `barcode`, `picture`, `added`) VALUES
(2, 'LENOVO IDEAPAD 3 15IIL05 (81WE008KHV) SZÜRKE', 1005, 44, 1, 1, 'Intel® Core™ i3-1005G1 Processor (4M Cache, Up to 3.40) , FreeDos , 8GB (4+4) DDR4 2666MHz RAM , 256 GB M.2 2242 PCIe NVMe 3.0x2 SSD , 15.6\" FullHD (1920 x 1080) matt LCD kijelző , Intel® UHD Graphics integrált grafikus vezérlő , Wi-Fi 802.11 ac , Bluetooth 5.0 , HDMI (1db) , USB 2.0 (1db) , USB 3.0 (2db) , MMC/SD/SDHX/SDXC-kártyaolvasó , Beépített 0.3 M Webkamera adatvédelmi kamerafedéllel , Garancia: 36 hónap', 18, 180000, 'lp01', '', '2022-04-14 22:53:39');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `motherboard`
--

CREATE TABLE `motherboard` (
  `ID` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `processor` int(4) NOT NULL,
  `ramtype` int(1) NOT NULL,
  `rammaxmhz` int(4) NOT NULL,
  `rammaxgb` int(3) NOT NULL,
  `ramslots` int(1) NOT NULL,
  `nvme` tinyint(1) NOT NULL,
  `powersupplypin` varchar(8) NOT NULL,
  `descrip` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `piece` int(4) NOT NULL,
  `pricehuf` int(7) NOT NULL,
  `barcode` varchar(150) NOT NULL,
  `picture` varchar(150) NOT NULL,
  `added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `motherboard`
--

INSERT INTO `motherboard` (`ID`, `name`, `processor`, `ramtype`, `rammaxmhz`, `rammaxgb`, `ramslots`, `nvme`, `powersupplypin`, `descrip`, `piece`, `pricehuf`, `barcode`, `picture`, `added`) VALUES
(1, 'GIGABYTE B560M DS3H', 1200, 4, 3200, 128, 4, 1, '24+8', 'Chipset típus:intel B560, Crossfire támogatás:Nem, D-Sub kimenet:1, DisplayPort kimenet:1, DVI-D kimenet:1, Formátum:mATX, Hálózati csatlakozás:1 x 10/100/1000 Mb/s, HDMI kimenet:1, m.2 csatlakozó:2, Maximum memória (GB):128, Memória foglalat:DDR4, Memória foglalatok száma:24, mSATA csatlakozó:Nem, PCI-e verzió:3.0,4.0, PCI-E x1 csatlakozó:1, PCI-e x16 csatlakozó:2, PCI-e x4 csatlakozó:1, Processzor foglalat:Intel 1200, PS/2 csatlakozó:1, Raid:Nem, S/PDIF optikai kimenet:Nem, SATA 3 csatlakozó:6', 4, 37900, 'mb01', '', '2022-04-14 22:53:50'),
(2, 'Asus PRIME B550M-A (WI-FI)', 4, 4, 4600, 128, 4, 1, '24+8', 'Chipset típus:B550, Crossfire támogatás:Nem, D-Sub kimenet:Igen, DisplayPort kimenet:Nem, DVI-D kimenet:Igen, DVI-I kimenet:Nem, eSATA kimenet:0, Formátum:Micro-ATX, Hálózati csatlakozás:1 x 10/100/1000 Mb/s, HDMI kimenet:1, M.2 csatlakozó:2, Maximum memória (GB):128, Memória foglalat:DDR4, Memória foglalatok száma:4, Memória sebesség (Mhz):2133,2400,2666,2800,3000,3200,3333,3466,3600,3733,3866,4000,4133,4266,4400,4600, Mini PCI-E:Nem, mSATA csatlakozó:Nem,, PCI csatlakozó:0, Processzor foglalat:', 18, 45000, 'mb02', '', '2022-04-14 22:53:56'),
(3, 'GIGABYTE B365M H', 1151, 4, 2666, 32, 2, 1, '24+8', 'Termék rövid leírása xyz....', 8, 24000, 'mb03', '', '2022-04-14 22:54:30'),
(5, 'ASRock H81M-VG4 R3.0', 1150, 3, 0, 16, 2, 0, '24+4', 'CPU Foglalat 	Socket 1150\r\nChipset 	Intel H81\r\nProcesszor gyártó  Intel\r\nMemória típusa	DDR3\r\nSzerver alaplap	Nem\r\nVideókártya\r\nVideokártya típusa	PCI-Express\r\nIntegrált videókártya	Processzor függő\r\nDVI	Nincs\r\nHDMI	Nincs\r\nDisplayPort	Nincs\r\nCsatlakozók\r\nMemória foglalatok száma	2\r\nSATA csatlakozók száma 	4\r\nÖsszes PCI-Express 16x csatlakozó száma 	1\r\nPCI-Express 16x 2.0 csatlakozók száma	1\r\nPCI-Express 1x csatlakozók száma	1\r\nPCI csatlakozók száma	Nincs\r\nPortok\r\nSATA 3 csatlakozók száma	2\r\nSATA 2 csatlakozók száma	2\r\nmSATA csatlakozók száma	Nincs\r\nm.2 csatlakozók száma	Nincs\r\nSATA Express csatlakozók száma	Nincs\r\nHátlapi USB 2.0 portok száma	2\r\nHátlapi USB 3.2 Gen 1 portok száma	2\r\nKülső PS/2 portok száma 	2\r\nKülső COM portok száma 	Nincs\r\nKülső LPT portok száma 	Nincs\r\nTovábbi tulajdonságok\r\nMax. memória mérete	16 GB\r\nIntegrált hangkártya	Van\r\nHangkártya csatorna	7.1\r\nDigitális hangkimenet	Nincs\r\nIntegrált LAN sebessége	10/100/1000 Mbit/s\r\nVezeték nélküli hálózat	Nincs\r\nBluetooth	Nincs\r\nRAID vezérlő 	Nincs\r\nMéret szabvány	microATX', 12, 31200, 'mb04', '', '2022-04-14 22:54:38'),
(6, 'GIGABYTE B450M DS3H', 4, 4, 3100, 64, 4, 1, '24+8', 'CPU foglalat: Socket AM4; Chipset: AMD B450; Memóriatípus: DDR4; Használható modulok: DIMM; Memóriahely DDR4: 4 db; PCI Express 16x bővítőhely: 2 db; PCI Express 1x/4x bővítőhely: 1 db; SATA-III csatlakozók száma: 4 db; M. 2 csatlakozók száma: 1 db; Hangkártya : Realtek® ALC887 kodek; Hátsó csatlakozók: 3,5 mm Jack, DVI, HDMI, PS/2, RJ-45; LAN, USB 2.0, USB 3.1 Gen1 (3.0); LAN : Gigabit Ethernet 10/100/1000 Mb/s; USB 2.0: 4 db; USB 3.0: 4 db; Méret: Micro-ATX', 12, 24150, 'mb05', '', '2022-04-14 22:54:48'),
(8, 'Asus Z170-P D3', 1151, 3, 2600, 64, 4, 1, '24+8', 'A nagyszerű ATX Z170 alaplap 5X Protection II-vel megbízható stabilitást, rugalmas DDR3/DDR3L kompatibilitástl és LED-világítású hangeszköz-borítást nyújt Önnek.\r\n5X Protection II - Továbbfejlesztett hardvervédelem a teljes körű biztonsághoz\r\nDDR3/DDR3L memória kompatibilitás\r\nVillámgyors M.2 a PCIe(R) 3.0 x4 interfésznek köszönhetően\r\nIsteni játékhangok LED-világítású borítással\r\nVilághírű UEFI BIOS EZ Flash 3-mal\r\nFan Xpert 2+ ventilátorvezérlő a tökéletes hűtés és csendes működés érdekében', 9, 34000, 'mb06', '', '2022-04-14 22:54:54'),
(9, 'MSI Z390-A PRO', 1151, 4, 3100, 64, 4, 1, '24+8', 'Chipset típus: Z390\r\nCrossfire támogatás: Igen\r\nD-Sub kimenet: Igen\r\nDisplayPort kimenet: Igen\r\nDVI-D kimenet: Igen\r\nDVI-I kimenet: Nem\r\neSATA kimenet: 0\r\nFormátum: ATX\r\nHálózati csatlakozás: 1 x 10/100/1000 Mb/s\r\nHDMI kimenet: 0\r\nm.2 csatlakozó: 1\r\nMaximum memória (GB): 64\r\nMemória foglalat: DDR4\r\nMemória foglalatok száma: 4\r\nMemória sebesség (Mhz): 2133, 2400, 2666, 2800, 3000, 3200, 3300, 3333, 3400, 3466, 3600, 3733, 3866, 4000, 4133, 4200, 4266, 4300, 4400\r\nMini PCI-E: Nem\r\nmSATA csatlakozó: Nem\r\nPCI csatlakozó: 1\r\nPCI-e verzió: 3.0\r\nPCI-E x1 csatlakozó: 4\r\nPCI-e x16 csatlakozó: 2\r\nPCI-e x4 csatlakozó: 0\r\nProcesszor foglalat: Intel 1151 v2\r\nPS/2 csatlakozó: 1\r\nRaid: 0, 1, 10, 5\r\nS/PDIF optikai kimenet: Nem\r\nSATA 2 csatlakozó: 0\r\nSATA 3 csatlakozó: 6\r\nSLI támogatás: Nem\r\nTáp csatlakozó (pin): 24+8\r\nUSB 2.0 kimenet: 6\r\nUSB 3.0 kimenet: 0\r\nUSB 3.1 kimenet: 8', 6, 43428, 'mb07', '', '2022-04-14 22:55:02'),
(10, 'MSI Z490-A PRO', 1200, 4, 4800, 128, 4, 1, '24+8', 'Chipset típus:Z490,\r\nCrossfire támogatás:Igen,\r\nD-Sub kimenet:Nem,\r\nDisplayPort kimenet:1,\r\nDVI-D kimenet:Nem,\r\nDVI-I kimenet:Nem,\r\neSATA kimenet:0,\r\nFormátum:ATX,\r\nHálózati csatlakozás:1 X 10/100/1000/2500 Mb/s,\r\nHDMI kimenet:1,\r\nM. 2 csatlakozó:2,\r\nMaximum memória (GB):128,\r\nMemória foglalat:DDR4,\r\nMemória foglalatok száma:4,\r\nMemória sebesség (Mhz):2133,2400, 2666,2933, 3000,3200, 3300,3333, 3400,3466, 3600,3733, 3866,4000, 4133,4200, 4266,4300, 4400,4533, 4600,4800,\r\nMini PCI-E:Nem,\r\nmSATA csatlakozó:Nem,\r\nPCI csatlakozó:0,\r\nProcesszor foglalat:Intel 1200,\r\nPS/2 csatlakozó:1,\r\nRaid:0,1, 10,5,\r\nS/PDIF optikai kimenet:Nem,\r\nSATA 2 csatlakozó:0,\r\nSATA 3 csatlakozó:6,\r\nSLI támogatás:Nem,\r\nTáp csatlakozó (pin):24+8+4,\r\nUSB 2.0 kimenet:2,\r\nUSB 3.0 kimenet:0,\r\nUSB 3.1 kimenet:4,\r\nVezeték nélküli hálózat:Nem,\r\nPCI-e verzió:3.0,\r\nPCI-e x1 csatlakozó:3,\r\nPCI-e x4 csatlakozó:0,\r\nPCI-e x16 csatlakozó:2,', 18, 57000, 'mb08', '', '2022-04-14 22:55:08');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `nvme`
--

CREATE TABLE `nvme` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `rmbsec` int(4) NOT NULL,
  `wmbsec` int(4) NOT NULL,
  `capacitygb` int(4) NOT NULL,
  `descrip` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `piece` int(4) NOT NULL,
  `pricehuf` int(7) NOT NULL,
  `barcode` varchar(150) NOT NULL,
  `picture` varchar(150) NOT NULL,
  `added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `nvme`
--

INSERT INTO `nvme` (`ID`, `name`, `rmbsec`, `wmbsec`, `capacitygb`, `descrip`, `piece`, `pricehuf`, `barcode`, `picture`, `added`) VALUES
(1, 'Western Digital 240GB WDS240G2G0B M.2', 540, 465, 240, 'Megnövelt tárhely a mindennapi számítástechnikai igényekhez\r\n\r\nA gyors teljesítmény és megbízhatóság érdekében a WD Green SSD-k növelik az asztali vagy hordozható számítógép mindennapi számítástechnikai tapasztalatait.\r\nJobb teljesítmény a mindennapi számítástechnikához\r\nA WD Green SATA SSD teljesítménybővítésével böngészhet az interneten, játékot játszhat le, vagy egyszerűen elindíthatja a rendszert vakuval.\r\n\r\nÁllandó megbízhatóság\r\nA könnyű és ütésálló WD Green SSD-k nem használnak mozgó alkatrészeket és segítenek az esetleges véletlen ütközések és cseppek esetén biztonságban tartja adatait.\r\nWD A zöld SSD-k az iparág legalacsonyabb energiaigényű meghajtói közé tartoznak. És kevesebb energiával, a laptop hosszabb ideig fut.\r\n\r\nEgyszerű frissítés a számítógéphez\r\n\r\nA legtöbb asztali és hordozható számítógéphez kompatibilis, a WD Green SSD-k 2,5 \"7 mm-es és M.2 2280-as modellekben kaphatók az egyszerű, gond nélküli frissítéshez.\r\n\r\nLetölthető WD SSD Dashboard és Acronis szoftver\r\nA meghajtó egészségét figyelemmel kísérheti az ingyenes, letölthető WD SSD műszerfal és a klón meghajtókkal az Acronis® True Image ™ WD Edition szoftverrel.', 7, 12300, 'nvme01', '', '2022-04-14 22:55:19'),
(2, 'Samsung 980 PRO NVMe 2TB M. 2 PCIe', 5100, 7000, 2000, 'Adatírási sebesség (MB/s): 5100; Adatolvasási sebesség (MB/s): 7000; Család: 980 Pro; Formátum: M.2 PCIe; Kapacitás (GB): 2048; Memória típus: V-NAND\r\n', 6, 121000, 'nvme02', '', '2022-04-14 22:55:38'),
(3, 'Kingston A2000 250GB M. 2 PCIe', 1000, 2200, 250, 'A Kingston A2000 NVMe PCIe SSD egy megfizethető tárolási megoldás, lenyűgöző teljesítménnyel. A 2200/2000 MB/s olvasási/írási sebességgel bíró A2000 háromszoros SATA SSD teljesítményt nyújt gyorsabb betöltési idővel, kevesebb energiafogyasztással és alacsonyabb hővel. Az A2000 SSD-t a belépő szintű felhasználó, a célra épített rendszergyártó, a barkács-készítő rendszerépítő és a PC-t frissíteni próbáló felhasználók számára tervezték. Az egyoldalas, vékony M. 2 kialakításnak köszönhetően az A2000 teljes mértékben kihasználja az Ultrabookba vagy egy kis méretű PC-be (SFF PC) való beépítését.', 19, 12800, 'nvme03', '', '2022-04-14 22:55:30'),
(4, 'Kingston A2000 500GB M. 2 PCIe', 2200, 2000, 500, 'A Kingston A2000 NVMe PCIe SSD egy megfizethető tárolási megoldás, lenyűgöző teljesítménnyel. A 2200/2000 MB/s olvasási/írási sebességgel bíró A2000 háromszoros SATA SSD teljesítményt nyújt gyorsabb betöltési idővel, kevesebb energiafogyasztással és alacsonyabb hővel. Az A2000 SSD-t a belépő szintű felhasználó, a célra épített rendszergyártó, a barkács-készítő rendszerépítő és a PC-t frissíteni próbáló felhasználók számára tervezték. Az egyoldalas, vékony M. 2 kialakításnak köszönhetően az A2000 teljes mértékben kihasználja az Ultrabookba vagy egy kis méretű PC-be (SFF PC) való beépítését', 16, 23800, 'nvme04', '', '2022-04-14 22:55:44');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `processor`
--

CREATE TABLE `processor` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` int(4) NOT NULL,
  `cores` int(1) NOT NULL,
  `ghz` float NOT NULL,
  `turboghz` float NOT NULL,
  `ramtype` int(1) NOT NULL,
  `threads` int(1) NOT NULL,
  `descrip` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `piece` int(4) NOT NULL,
  `pricehuf` int(7) NOT NULL,
  `barcode` varchar(150) NOT NULL,
  `picture` varchar(150) NOT NULL,
  `added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `processor`
--

INSERT INTO `processor` (`ID`, `name`, `type`, `cores`, `ghz`, `turboghz`, `ramtype`, `threads`, `descrip`, `piece`, `pricehuf`, `barcode`, `picture`, `added`) VALUES
(1, 'Intel Core i5-10400 ', 1200, 6, 2.9, 4.3, 4, 12, 'Architektúra (bit): 64, CPU Generáció: Intel 10000, Család: Comet Lake-S, Fogyasztás (W): 65, Gyártási technológia (nm): 14, Hűtőborda: Igen, Hűtőventilátor: Igen, L2 Cache (MB): 1,5, L3 Cache (MB): 12, Magok száma: 6, Órajel (Mhz): 2900, Processzor foglalat: Intel 1200, Processzor típus: Intel Core i5-10400, Szálak száma: 12, VGA típus: Intel UHD Graphics 630', 11, 72000, 'pro01', '', '2022-04-14 22:55:54'),
(2, 'AMD Ryzen 5 1600', 4, 6, 3.2, 3.6, 4, 12, 'Architektúra (bit): 64, CPU Generáció: Ryzen 1000, Család: AMD Ryzen 5, Fogyasztás (W): 65, Gyártási technológia (nm): 12, Hűtőborda: Igen, Hűtőventilátor: Igen, L2 Cache (MB): 3,L3 Cache (MB): 16, Magok száma: 6, Órajel (Mhz): 3200, 3600, Processzor foglalat: AMD AM4, Szálak száma: 12', 3, 51300, 'pro02', '', '2022-04-14 22:56:00'),
(3, 'Intel Core i7-9700KF BX80684I79700KF', 1151, 8, 3.6, 4.9, 4, 8, 'Architektúra (bit): 64, CPU Generáció: Core 9000, Család: Intel Core i7, Fogyasztás (W): 95, Gyártási technológia (nm): 14, Hűtőborda: Nem, Hűtőventilátor: Nem, L2 Cache (MB): 2, L3 Cache (MB): 12, Magok száma: 8, Órajel (Mhz): 3600, Processzor foglalat: Intel 1151 v2, Processzor típus: Intel Core i7-9700KF, Szálak száma: 8', 3, 104500, 'pro03', '', '2022-04-14 22:56:05'),
(4, 'Intel Core i5-4570', 1150, 4, 3.2, 3600, 3, 4, 'Típus Intel Core i5, Magok száma 4 magos, Szálak száma 4, Processzor foglalat Intel Socket 1150, Processzor órajel 3200 MHz, Processzor Turbo órajel	3600 MHz, Gyártási technológia 22nm, Integrált grafikai processzor Intel HD Graphics 4600, DMI sebesség 5 GT/s, Cache, L2 cache 6 MB, További tulajdonságok, TDP 84W', 9, 19900, 'pro04', '', '2022-04-14 22:56:12'),
(5, 'AMD Ryzen 5 2600X', 4, 6, 3.6, 4.2, 4, 12, 'Foglalat: Socket AM4, Processzormagok száma: 6, CPU órajele: 3.6 GHz, CPU turbó órajele: 4.2 GHz, L3 cache: 16 MB, L2 cache: 3 MB, L1 cache: 576 kB, Hűtőventilátor: Gyári, Gyártási technológia: 12 nm, Fogyasztás (TDP): 95 Watt', 13, 88200, 'pro05', '', '2022-04-14 22:56:20'),
(7, 'Intel Core i5-8400', 1151, 6, 2.8, 4, 3, 6, 'Intel® Core™ i5-8400 Coffee Lake proecesszor, 2.80GHz, 9MB, Socket 1151 - Chipset széria 300, BOX', 21, 144300, 'pro06', '', '2022-04-14 22:56:27'),
(9, 'Intel Core i7-9700K', 1151, 8, 3.6, 4.9, 4, 8, '9. generációs Coffee Lake Intel processzor, 95 wattos fogyasztás, Intel® SSE4.1, Intel® SSE4.2, Intel® AVX2, Maximum 64 GB DDR4 2666 memória kezelése, Intel® UHD Graphics 630 integrált VGA, HDMI 1.4 max. felbontás: 4096 x 2304 @ 24Hz, DisplayPort max. felbontás: 4096 x 2304 @ 60Hz, DirectX 12 támogatás, Maximum 3 kijelző támogatás', 34, 111000, 'pro07', '', '2022-04-14 22:56:44'),
(10, 'Intel Core i5-11400', 1200, 6, 2.6, 4.4, 4, 12, 'n1', 14, 69200, 'pro08', '', '2022-04-14 22:56:58');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pwrsupply`
--

CREATE TABLE `pwrsupply` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `watt` int(4) NOT NULL,
  `pins` varchar(8) NOT NULL,
  `descrip` varchar(1500) NOT NULL,
  `piece` int(4) NOT NULL,
  `pricehuf` int(7) NOT NULL,
  `barcode` varchar(150) NOT NULL,
  `picture` varchar(150) NOT NULL,
  `added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `pwrsupply`
--

INSERT INTO `pwrsupply` (`ID`, `name`, `watt`, `pins`, `descrip`, `piece`, `pricehuf`, `barcode`, `picture`, `added`) VALUES
(1, 'GigaByte 450W', 450, '24+4+4', '20/24 pin ATX csatlakozó:1, 4 pin Molex csatlakozó:3, 6 pin VGA csatlakozó:0, 6+2 pin VGA csatlakozó:2, CPU csatlakozó:4+4 pin, Floppy csatlakozó:1, Formátum:ATX,PS II, Hatásfok (%):85, Hatékonyság:80+ Bronz, Kiszerelés:Dobozos, Magasság (mm):86, Mélység (mm):140, Moduláris kábelezés:Nem, PFC:Aktív, SATA csatlakozó:6, Szélesség (mm):150, Teljesítmény (W):450, Ventilátor méret (cm):12.', 3, 12900, 'pwr01', '', '2022-04-14 22:59:14'),
(2, 'Seasonic FOCUS GX-650W Gold', 650, '24+4+4', 'Tápegység típusa	Moduláris tápegység\r\nTápegység teljesítménye	650 W\r\nHatásfok	80+ Gold\r\nPFC	Aktív\r\nVentilátor mérete	120 mm\r\nMax. áramfelvétel +3,3V	20 A\r\nMax. áramfelvétel +5V	20 A\r\nMax. áramfelvétel +12V1	54 A\r\nMax. áramfelvétel -12V	0.3 A\r\nTápkapcsoló 	Van\r\n110V kapcsoló 	Nincs\r\nCsatlakozók\r\nFDD csatlakozó 	1\r\nHDD csatlakozó 	3\r\nSATA csatlakozó 	8\r\nPCI-Express csatlakozó 	4', 15, 35070, 'pwr02', '', '2022-04-14 22:59:20'),
(3, 'Cooler Master Elite V3 600W', 600, '', 'Leadott teljesítmény: 600 W\r\nTípus: ATX Form Factor 12V V2.31\r\nMéretek (W / H / D): 150 x 140 x 86 mm\r\nBemeneti feszültség: 200 ~ 240V\r\nBemeneti frekvencia: 47 ~ 63 Hz\r\nAktív PFC\r\nPower Good Signal 100 ~ 500 ms\r\nHatásfok: 82% (tipikus)\r\nMTBF: legalább 100,000 óra\r\nVédelmek: OVP / OPP / OTP / SCP\r\nÜzemi hőmérséklet: 10 ~ 40 C\r\nBiztonsági megfelelőségek: TUV, cTUVus, CE, FCC, BSMI\r\nHűtés: 120 mm ventilátor', 12, 18600, 'pwr03', '', '2022-04-14 22:59:26'),
(4, 'Cooler Master i500 RS500-ACAAB1', 500, '24+4', 'lntel ATX 12V V2.3 táp80 Plus bronz minõsítésAuto venti szabályozásAktív PFC, 12mm venti1db MB 20+4 Pin1db CPU12V 4+4 Pin2db PCI-e 6+2 Pin6db SATA, 1db FDD3db Molex 4Pin\r\n', 14, 16500, 'pwr04', '', '2022-04-14 22:59:33'),
(5, 'be quiet! Pure Power 11 CM 600W Gold', 600, '24+4+4', '', 18, 31900, 'pwr05', '', '2022-04-14 22:59:40'),
(6, 'be quiet! System Power 9 600W CM', 600, '24+4+4', '\r\nTápegység típusa	Fél moduláris tápegység\r\nTápegység teljesítménye	600 W\r\nHatásfok	80+ Bronze\r\nPFC	Aktív\r\nVentilátor mérete	120 mm\r\nMax. áramfelvétel +3,3V	24 A\r\nMax. áramfelvétel +5V	15 A\r\nMax. áramfelvétel +12V1	28 A\r\nMax. áramfelvétel +12V2	22 A\r\nMax. áramfelvétel -12V	0.3 A\r\nTápkapcsoló 	Van\r\n110V kapcsoló 	Nincs\r\nCsatlakozók\r\nFDD csatlakozó 	1\r\nHDD csatlakozó 	2\r\nSATA csatlakozó 	10\r\nPCI-Express csatlakozó 	4', 15, 26770, 'pwr06', '', '2022-04-14 22:59:46'),
(7, 'Cooler Master Thunder 700W', 700, '24+4+4', '\r\nTápegység teljesítménye	700 W\r\nPFC	Aktív\r\nVentilátor mérete	120 mm\r\nMax. áramfelvétel +3,3V	20 A\r\nMax. áramfelvétel +5V	20 A\r\nMax. áramfelvétel +12V1	55 A\r\nMax. áramfelvétel -12V	0.3 A\r\nTápkapcsoló 	Van\r\n110V kapcsoló 	Nincs\r\nCsatlakozók\r\nFDD csatlakozó 	1\r\nHDD csatlakozó 	3\r\nSATA csatlakozó 	6\r\nPCI-Express csatlakozó 	4', 11, 26900, 'pwr07', '', '2022-04-14 22:59:52'),
(8, 'Cooler Master V700', 700, '24+4+4', 'Tápegység teljesítménye	700 W\r\nPFC	Aktív\r\nVentilátor mérete	135 mm\r\nMax. áramfelvétel +3,3V	25 A\r\nMax. áramfelvétel +5V	25 A\r\nMax. áramfelvétel +12V1	58 A\r\nMax. áramfelvétel -12V	0.5 A\r\nCsatlakozók\r\nFDD csatlakozó 	1\r\nHDD csatlakozó 	4\r\nSATA csatlakozó 	9', 19, 42000, 'pwr08', '', '2022-04-14 23:00:01');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ram`
--

CREATE TABLE `ram` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` int(1) NOT NULL,
  `gb` int(3) NOT NULL,
  `mhz` int(4) NOT NULL,
  `piece` int(4) NOT NULL,
  `descrip` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `pricehuf` int(7) NOT NULL,
  `barcode` varchar(150) NOT NULL,
  `picture` varchar(150) NOT NULL,
  `added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `ram`
--

INSERT INTO `ram` (`ID`, `name`, `type`, `gb`, `mhz`, `piece`, `descrip`, `pricehuf`, `barcode`, `picture`, `added`) VALUES
(1, 'Kingston 8GB 2666MHz DDR4 HyperX FURY', 4, 8, 2666, 14, 'Csomagolás: Bliszter, Feszültség (V): 1,2, Hűtőborda: HyperX Fury, Időzítés (CL): 16, Kapacitás (GB): 8, Kiszerelés (modul): 1, Memória típus: DDR4, Órajel (Mhz): 2666', 15800, 'ram01', '', '2022-04-14 23:00:25'),
(2, 'Kingmax 2GB DDR3 1333MHz', 3, 2, 1333, 5, 'Csomagolás: Doboz, Feszültség (V): 1,5, Hűtőborda: Nem, Időzítés (CL): 9, Kapacitás (GB): 2, Kiszerelés (modul): 1, Memória típus: DDR3, Órajel (Mhz): 1333', 3600, 'ram02', '', '2022-04-14 23:00:31'),
(4, 'G. Skill', 4, 8, 3000, 12, 'Rendelheted KIT-ben is', 15000, 'ram03', '', '2022-04-14 23:00:36');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ssd`
--

CREATE TABLE `ssd` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `capacitygb` int(4) NOT NULL,
  `rmbsec` int(4) NOT NULL,
  `wmbsec` int(4) NOT NULL,
  `descrip` varchar(1500) NOT NULL,
  `piece` int(4) NOT NULL,
  `pricehuf` int(7) NOT NULL,
  `barcode` varchar(150) NOT NULL,
  `picture` varchar(150) NOT NULL,
  `added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `ssd`
--

INSERT INTO `ssd` (`ID`, `name`, `capacitygb`, `rmbsec`, `wmbsec`, `descrip`, `piece`, `pricehuf`, `barcode`, `picture`, `added`) VALUES
(1, 'Samsung 1TB 870 QVO SSD (MZ-77Q1T0BW)', 1000, 560, 530, '2,5\" < 3,5\" átalakító: Nem, Adatírási sebesség (MB/s): 530, Adatolvasási sebesség (MB/s): 560, Család: 870 QVO, Csatolófelület: SATA III, Kapacitás (GB): 1000, Méret (col): 2,5', 7, 30600, 'ssd01', '', '2022-04-14 23:01:49'),
(2, 'Kingston A400 2.5', 240, 500, 350, 'A merevlemeznél strapabíróbb és megbízhatóbb A400 Flash memória használatával készült, így ütés- és rázkódásálló, és kevésbé hajlamos hibázni, mint egy mechanikus merevlemez. Tűrőképessége ideálissá teszi notebookokhoz és más mobil számítástechnikai eszközhöz.', 9, 9900, 'ssd02', '', '2022-04-14 23:01:55'),
(3, 'Samsung 870 QVO 2.5', 1000, 550, 520, 'A 870 QVO a Samsung legújabb 2. generációs QLC SSD-je és a kategóriájában elérhető legnagyobb, akár 8 TB tárhelyet is biztosít. Hihetetlen előrelépést kínál azoknak a mindennapi PC-felhasználóknak, akik az asztali PC-jüket vagy laptopjukat a piacon elérhető legnagyobb tárhellyel szeretnék ellátni anélkül, hogy ez a teljesítmény csökkenését jelentené.', 13, 38200, 'ssd03', '', '2022-04-14 23:02:00'),
(4, 'Crucial BX500 2.5', 480, 540, 500, 'Típus: Belső; Csatlakozás: SATA 3; Tároló kapacitás: 480 GB; Méret: 2.5\"; Technológia: TLC; SSD max írás: 500 MB/s; SSD max olvasás: 540 MB/s; Magasság: 7 mm', 15, 16400, 'ssd04', '', '2022-04-14 23:02:11'),
(5, 'Western Digital Blue 3D NAND 2.5', 500, 560, 530, 'A nagy teljesítményű számítástechnikai igények kielégítésére a WD Blue ™ 3D NAND SATA SSD nagy kapacitást, nagyobb megbízhatóságot és gyorsaságot kínál.', 16, 22000, 'ssd05', '', '2022-04-14 23:02:17');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `name` varchar(35) NOT NULL,
  `mail` varchar(35) NOT NULL,
  `jelszo` varchar(20) NOT NULL,
  `mikor` timestamp NOT NULL DEFAULT current_timestamp(),
  `usad` int(1) DEFAULT 0,
  `game_points` int(5) DEFAULT 0,
  `last_game` date NOT NULL DEFAULT '2020-01-05'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `user`
--

INSERT INTO `user` (`ID`, `name`, `mail`, `jelszo`, `mikor`, `usad`, `game_points`, `last_game`) VALUES
(7, 'David', 'david@gmail.com', '123', '2022-03-04 22:15:43', 1, 0, '2022-03-04'),
(8, 'Próba', 'p@gmail.com', '012', '2022-03-04 22:32:14', 0, 0, '2022-04-29'),
(15, 'Akemi', 'ake@gmail.com', '0123', '2022-04-12 17:44:22', 1, 0, '2020-01-05'),
(16, 'Bertold', 'bertold@gmail.com', '123', '2022-04-14 22:31:14', 1, 0, '2020-01-05'),
(17, 'Rékási József', 'rj@kulker.com', 'restapi', '2022-04-14 22:33:04', 1, 0, '2020-01-05'),
(18, 'Jáger Attila', 'ja@gmail.com', 'almafa12', '2022-04-14 22:33:29', 1, 0, '2020-01-05'),
(19, 'Bálint Dezső', 'bd@kulker.com', 'jdksdk', '2022-04-14 22:36:08', 1, 0, '2020-01-05');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `userdata`
--

CREATE TABLE `userdata` (
  `ID` int(150) NOT NULL,
  `irszam` varchar(150) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `varos` varchar(150) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `uhea` varchar(150) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `szulnev` varchar(150) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `mail` varchar(150) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `tel` varchar(150) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `megjegyzes` varchar(150) COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `userdata`
--

INSERT INTO `userdata` (`ID`, `irszam`, `varos`, `uhea`, `szulnev`, `mail`, `tel`, `megjegyzes`) VALUES
(6, '1027', 'Budapest', 'Szász Károly utca 133/2/2', 'Varga Dávid', 'david@gmail.com', '06701112222', '37-es kapucsengő'),
(7, '1111', 'Budapest', 'Péterfy Sándor utca 24', 'Ladányi Bertold', 'bertold@gmail.com', '06301112222', '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vga`
--

CREATE TABLE `vga` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `memsizegb` int(2) NOT NULL,
  `minpwr` int(4) NOT NULL,
  `memtypegddr` int(1) NOT NULL,
  `memmhz` int(6) NOT NULL,
  `descrip` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `piece` int(3) NOT NULL,
  `pricehuf` int(8) NOT NULL,
  `barcode` varchar(150) NOT NULL,
  `picture` varchar(150) NOT NULL,
  `added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `vga`
--

INSERT INTO `vga` (`ID`, `name`, `memsizegb`, `minpwr`, `memtypegddr`, `memmhz`, `descrip`, `piece`, `pricehuf`, `barcode`, `picture`, `added`) VALUES
(1, 'Gigabyte RTX 3060 Ti OC 8GB DDR6 LHR', 8, 600, 6, 14000, 'Ajánlott tápegység: 600W, Beépített memória (MB): 8192, Chipset típus: NVIDIA RTX3060 Ti, D-Sub kimenet: 0, DirectX kompatibilitás: DirectX 12.2, DisplayPort kimenet: 2, DVI-D kimenet: 0, DVI-I kimenet: 0, Foglalat: PCI-E 16x 4.0, Fogyasztás max. (W): 200, GPU órajel (MHz): 1410, 1695, HDMI kimenet: 2, Hűtés típus: Aktív (Ventillátor), Low Profile: Nem,Mélység (mm): 242, Memória órajel (MHz): 14000, Memória sávszélesség (bit): 256, Memória típus: GDDR6, Mini DisplayPort kimenet: 0, Mini HDMI kimenet: 0, Open GL támogatás: 4.6, Táp csatlakozó (pin): 8, USB Type-C kimenet: 0', 6, 367000, 'vga01', '', '2022-04-14 23:02:35'),
(5, 'BIOSTAR GeForce 210', 1, 400, 3, 1000, 'Csatolófelület 	PCI-Express\r\nVideo chipset	Nvidia GeForce\r\nVideo chipset termékcsalád	210\r\nHűtés típusa 	Passzív hűtés\r\nGrafikus chip sebessége	589 MHz\r\nGrafikus memória sebessége	1000 MHz\r\nMemória\r\nMemória mérete 	1 GB\r\nMemória típusa	GDDR3\r\nMemória sávszélesség 	64 bit\r\nTovábbi tulajdonságok\r\nMaximális felbontás	2560 x 1600 pixel\r\nDirectX	10.1\r\nOpenGL	2.1\r\nLite Hash Rate 	Nem\r\nAlkalmazott technológiák	\r\nnVidia CUDA \r\nCsatlakozók	\r\nVGA (D-sub)\r\nDVI\r\nHDMI ', 7, 22310, 'vga02', '', '2022-04-14 23:02:42'),
(6, 'MSI Radeon RX 580', 8, 600, 5, 8000, 'Csatolófelület 	PCI-Express\r\nVideo chipset	AMD Radeon\r\nVideo chipset termékcsalád	RX 580\r\nHűtés típusa 	Aktív hűtés\r\nVentilátorok száma	2 darab\r\nGrafikus chip sebessége	1366 MHz\r\nGrafikus memória sebessége	8000 MHz\r\nMemória\r\nMemória mérete 	8 GB\r\nMemória típusa	GDDR5\r\nMemória sávszélesség 	256 bit\r\nTovábbi tulajdonságok\r\nMaximális felbontás	7680 x 4320 pixel\r\nDirectX	12\r\nOpenGL	4.5\r\nTápcsatlakozó	1 x 8-pin\r\nFogyasztás	185 W\r\nAjánlott tápegység	500 W\r\nLite Hash Rate 	Nem\r\nAlkalmazott technológiák	\r\nAMD Eyefinity \r\nAMD CrossFire \r\nRadeon VR Ready\r\nCsatlakozók	\r\nDVI\r\nHDMI \r\nDisplayPort \r\nMéretek\r\nSzélesség	125 mm\r\nHosszúság	269 mm\r\nVastagság	38 mm', 5, 1, 'vga03', '', '2022-04-14 23:02:48'),
(7, 'MSI Radeon RX 590 ARMOR OC', 8, 750, 5, 8000, 'Csatolófelület 	PCI-Express\r\nVideo chipset	AMD Radeon\r\nHűtés típusa 	Aktív hűtés\r\nVentilátorok száma	2 darab\r\nGrafikus chip sebessége	1565 MHz\r\nGrafikus memória sebessége	8000 MHz\r\nMemória\r\nMemória mérete 	8 GB\r\nMemória típusa	GDDR5\r\nMemória sávszélesség 	256 bit\r\nTovábbi tulajdonságok\r\nMaximális felbontás	5120 x 2880 pixel\r\nDirectX	12\r\nOpenGL	4.5\r\nAlkalmazott technológiák	\r\nAMD Eyefinity \r\nAMD HD3D \r\nAMD CrossFire \r\nAMD PowerPlay \r\nRadeon VR Ready\r\nCsatlakozók	\r\nDVI\r\nHDMI \r\nDisplayPort \r\nMéretek\r\nSzélesség	143 mm\r\nHosszúság	278 mm\r\nVastagság	40 mm', 12, 72900, 'vga04', '', '2022-04-14 23:02:54'),
(8, 'MSI Radeon RX 6800', 16, 650, 6, 16000, 'Csatolófelület 	PCI-Express\r\nVideo chipset	AMD Radeon\r\nVideo chipset termékcsalád	RX 6800\r\nHűtés típusa 	Aktív hűtés\r\nVentilátorok száma	3 darab\r\nGrafikus chip sebessége	2285 MHz\r\nGrafikus memória sebessége	16000 MHz\r\nMemória\r\nMemória mérete 	16 GB\r\nMemória típusa	GDDR6\r\nMemória sávszélesség 	256 bit\r\nTovábbi tulajdonságok\r\nMaximális felbontás	7680 x 4320 pixel\r\nDirectX	12\r\nOpenGL	4.6\r\nTápcsatlakozó	2 x 8-pin\r\nFogyasztás	300 W\r\nAjánlott tápegység	750 W\r\nLite Hash Rate 	Nem\r\nAlkalmazott technológiák	\r\nAMD Eyefinity \r\nAMD HD3D \r\nAMD CrossFire \r\nAMD PowerPlay \r\nRadeon VR Ready\r\nCsatlakozók	\r\nHDMI \r\nDisplayPort \r\nMéretek\r\nSzélesség	141 mm\r\nHosszúság	324 mm\r\nVastagság	55 mm', 23, 540000, 'vga05', '', '2022-04-14 23:03:00'),
(9, 'PowerColor Radeon RX 6900 XT', 16, 900, 6, 160000, 'Csatolófelület 	PCI-Express\r\nVideo chipset	AMD Radeon\r\nVideo chipset termékcsalád	RX 6900 XT\r\nHűtés típusa 	Aktív hűtés\r\nVentilátorok száma	3 darab\r\nGrafikus chip sebessége	2340 MHz\r\nGrafikus memória sebessége	16000 MHz\r\nMemória\r\nMemória mérete 	16 GB\r\nMemória típusa	GDDR6\r\nMemória sávszélesség 	256 bit\r\nTovábbi tulajdonságok\r\nMaximális felbontás	7680 x 4320 pixel\r\nDirectX	12\r\nOpenGL	4.6\r\nTápcsatlakozó	3 x 8-pin\r\nAjánlott tápegység	900 W\r\nLite Hash Rate 	Nem\r\nAlkalmazott technológiák	\r\nAMD Eyefinity \r\nAMD HD3D \r\nAMD CrossFire \r\nAMD PowerPlay \r\nRadeon VR Ready\r\nCsatlakozók	\r\nHDMI \r\nDisplayPort \r\nMéretek\r\nSzélesség	135 mm\r\nHosszúság	320 mm\r\nVastagság	62 mm', 9, 635000, 'vga06', '', '2022-04-14 23:03:07'),
(10, 'GIGABYTE GeForce GTX 750 Ti OC', 2, 500, 5, 5400, 'Csatolófelület 	PCI-Express\r\nVideo chipset	Nvidia GeForce\r\nHűtés típusa 	Aktív hűtés\r\nVentilátorok száma	2 darab\r\nGrafikus chip sebessége	1020 MHz\r\nGrafikus memória sebessége	5400 MHz\r\nMemória\r\nMemória mérete 	2 GB\r\nMemória típusa	GDDR5\r\nMemória sávszélesség 	128 bit\r\nTovábbi tulajdonságok\r\nMaximális felbontás	4096 x 2160 pixel\r\nDirectX	11.2\r\nOpenGL	4.4\r\nAlkalmazott technológiák	\r\nnVidia CUDA \r\nnVidia PhysX \r\nnVidia Pure Video HD \r\nnVidia 3D Vision \r\nCsatlakozók	\r\nDVI\r\nHDMI \r\nMéretek\r\nSzélesség	144 mm\r\nHosszúság	204 mm\r\nVastagság	42 mm', 11, 43900, 'vga07', '', '2022-04-14 23:03:13'),
(11, 'GIGABYTE GeForce GTX 1660 OC', 6, 450, 5, 8002, 'Csatolófelület 	PCI-Express\r\nVideo chipset	Nvidia GeForce\r\nVideo chipset termékcsalád	GTX 1660\r\nHűtés típusa 	Aktív hűtés\r\nVentilátorok száma	2 darab\r\nGrafikus chip sebessége	1830 MHz\r\nGrafikus memória sebessége	8002 MHz\r\nMemória\r\nMemória mérete 	6 GB\r\nMemória típusa	GDDR5\r\nMemória sávszélesség 	192 bit\r\nTovábbi tulajdonságok\r\nMaximális felbontás	7680 x 4320 pixel\r\nDirectX	12\r\nOpenGL	4.5\r\nTápcsatlakozó	1 x 8-pin\r\nAjánlott tápegység	450 W\r\nLite Hash Rate 	Nem\r\nAlkalmazott technológiák	\r\nnVidia CUDA \r\nnVidia PhysX \r\nnVidia Pure Video HD \r\nnVidia 3D Vision \r\nGeForce GTX VR Ready \r\nCsatlakozók	\r\nHDMI \r\nDisplayPort \r\nMéretek\r\nSzélesség	121 mm\r\nHosszúság	224 mm\r\nVastagság	40 mm', 26, 251500, 'vga08', '', '2022-04-14 23:03:19'),
(12, 'ASUS GeForce RTX 2080 Ti OC', 11, 650, 6, 14000, '', 0, 621290, 'vga09', '', '2022-04-14 23:03:26');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `hdd`
--
ALTER TABLE `hdd`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `laptop`
--
ALTER TABLE `laptop`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `motherboard`
--
ALTER TABLE `motherboard`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `nvme`
--
ALTER TABLE `nvme`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `processor`
--
ALTER TABLE `processor`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `pwrsupply`
--
ALTER TABLE `pwrsupply`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `ssd`
--
ALTER TABLE `ssd`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `vga`
--
ALTER TABLE `vga`
  ADD PRIMARY KEY (`ID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `hdd`
--
ALTER TABLE `hdd`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT a táblához `laptop`
--
ALTER TABLE `laptop`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `motherboard`
--
ALTER TABLE `motherboard`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `nvme`
--
ALTER TABLE `nvme`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `processor`
--
ALTER TABLE `processor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `pwrsupply`
--
ALTER TABLE `pwrsupply`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `ram`
--
ALTER TABLE `ram`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `ssd`
--
ALTER TABLE `ssd`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT a táblához `userdata`
--
ALTER TABLE `userdata`
  MODIFY `ID` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `vga`
--
ALTER TABLE `vga`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
