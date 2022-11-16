-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2022 a las 02:24:50
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_mouses`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` int(11) NOT NULL,
  `marca_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marca`, `marca_name`) VALUES
(1, 'Asus'),
(2, 'Trust'),
(3, 'Vguard'),
(4, 'VersionTech'),
(5, 'Stoga'),
(6, 'Mars'),
(7, 'Genius'),
(8, 'Samsung'),
(9, 'Logitech'),
(10, 'Genius'),
(11, 'Glorius'),
(12, 'Tech'),
(13, 'Corsair'),
(18, 'Hyperex');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mouses`
--

CREATE TABLE `mouses` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `stock` tinyint(1) NOT NULL,
  `precio` int(100) NOT NULL,
  `id_marca` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mouses`
--

INSERT INTO `mouses` (`id_producto`, `nombre`, `stock`, `precio`, `id_marca`) VALUES
(18, 'Mouse Logitech', 0, 4100, 9),
(19, 'Mouse Genius', 1, 2000, 10),
(20, 'Mouse Glorius God', 0, 6500, 11),
(24, 'Mouse Hyperex', 1, 4100, 18),
(26, 'Mouse Hyx', 1, 20, 9),
(40, 'Mouselol', 1, 1111, 10),
(41, 'Mouse s', 0, 8000, 10),
(42, 'Mouse asass', 0, 8000, 10),
(43, 'Mouse Light', 0, 8000, 9),
(47, 'Mouse Light', 5, 8000, 10),
(48, 'Mouse Light', 5, 8000, 10),
(49, 'Mouse Viper', 5, 5000, 1),
(50, 'Mouse String', 5, 6000, 1),
(51, 'Mouse Stg', 1, 8000, 2),
(52, 'Mouse Rgb', 1, 8000, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `username`, `password`) VALUES
(1, 'Administrador', '$2a$12$OCWg56YnDlPDq1aRTfTNS.Bd4wDX9YBqVHH36hbXoIq41QzHCNYXe');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `mouses`
--
ALTER TABLE `mouses`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_marca` (`id_marca`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `mouses`
--
ALTER TABLE `mouses`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mouses`
--
ALTER TABLE `mouses`
  ADD CONSTRAINT `mouses_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
