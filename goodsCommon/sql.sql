create database if not exists goods_common;

use goods_common;

CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT primary key,
  `role_name` varchar(45) DEFAULT NULL
);

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `full_name` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
);

CREATE TABLE `user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
);

create table `goods` (
`id` int NOT NULL AUTO_INCREMENT primary key,
`good_name` varchar(30) DEFAULT NULL,
`price` double,
`quantity` int,
`trademark` varchar(30) DEFAULT NULL,
`category` varchar(30) DEFAULT NULL,
`sale_off` double,
`price_for_sale_off` double
);

create table customer (
`id` int NOT NULL AUTO_INCREMENT primary key,
`customer_name` varchar(30) DEFAULT NULL,
date_of_birth date,
id_card varchar(30) DEFAULT NULL,
gender varchar(30) DEFAULT NULL,
is_delete bit(1) default 0,
user_id int,
foreign key (user_id) references `user` (id)
);

CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_deleted` bit(1) DEFAULT 0,
  purchase_date date,
  total double,
  amount int,
  customer_id int,
  good_id int,
  PRIMARY KEY (`id`),
  foreign key (customer_id) references customer (id),
  foreign key (good_id) references goods (id)
);

create table promotion (
`id` int NOT NULL AUTO_INCREMENT primary key,
promotion_name varchar(30) DEFAULT NULL,
is_delete bit(1) default 0
);






