-- 1. Finding 5 olderst users

select * from users order by created_at asc limit 5;

-- 2. Most Popular Registration Date

select dayname(created_at) as day, count(*) as total from users group by day order by total desc limit 1;

-- 3. Identify Inactive Users (users with no photos)

select username, image_url 
from users left join photos
    on users.id = photos.user_id
where photos.id IS NULL;

-- 4. Identity most popular photo (and user who created it)

select 
    username,
    photos.id,
    photos.image_url,
    count(*) as total
from photos
inner join likes
    on likes.photo_id = photos.id
inner join users
    on photos.user_id = users.id
group by photos.id
order by total desc
limit 1;

-- 5. Calculate avg number of photos per user

select (select count(*) from photos) / (select count(*) from users) as avg;

-- 6. Most popular hashtags

select 
    tags.tag_name,
    count(*) as total
from photo_tags
join tags
    on photo_tags.tag_id = tags.id
group by tags.id;
order by total;

-- 7. Finding Bots - users who have liked every single photo

select 
    username,
    count(*) as num_likes
from users
inner join likes
    on users.id = likes.user_id
group by likes.user_id
having num_likes = (select count(*) from photos);

