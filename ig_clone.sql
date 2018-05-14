drop database ig_clone;

create database ig_clone;

use ig_clone;

create table users (
    id integer auto_increment primary key,
    username varchar(255) unique not null,
    created_at timestamp default now()
);

create table photos (
    id integer auto_increment primary key,
    image_url varchar(255) not null,
    user_id integer not null,
    created_at timestamp default now(),
    foreign key(user_id) references users(id)
);

insert into users (username) values
('BlueTheCat'),
('CharlieBrown'),
('ColtSteele');

insert into photos(image_url, user_id) values
('/alskjd76', 1),
('/lkajsd98', 2),
('/fwkjfee3', 2);