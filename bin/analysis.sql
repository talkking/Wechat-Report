-- 删除统计外日期
-- delete from log where datetime < '2024-01-01' and datetime > '2023-06-30';

-- 验证日期是否删除正确
select min(datetime) from log;

select count(1) from log
where content='[图片]';

select count(1) from log
where content='[视频]';

-- 获取最晚说的话
select id,user,content, datetime, DATE_FORMAT(datetime,'%H') as h from log
where DATE_FORMAT(datetime,'%H') <= 4.5
order by h desc, datetime;


-- 关键字
-- select id,user,content, datetime from log
-- where content like '%爱你%';
-- 
-- select id,content, datetime from log
-- where content like '%想你%';
-- 
-- select id,content, datetime from log
-- where content like '%喜欢你%';
-- 
-- select id,content, datetime from log
-- where content like '%吃什么%';
-- 
-- select id,content, datetime from log
-- where content like '%晚安%';
-- 
-- select id,content, datetime from log
-- where content like '%哈%';

select count(1) from log
where content like '%想你%';

select count(1) from log
where content like '%爱你%';

select count(1) from log
where content like '%哭%';

select count(1) from log
where content like '%喜欢你%';

select count(1) from log
where content like '%老公%';

select count(1) from log
where content like '%老婆%';

select count(1) from log
where content like '%航子%';

select count(1) from log
where content like '%圆仔%';

select count(1) from log
where content like '%哥哥%';

select count(1) from log
where content like '%妹妹%';

select count(1) from log
where content like '%爸爸%';

select count(1) from log
where content like '%吃%';

select count(1) from log
where content like '%炫%';

select count(1) from log
where content like '%最爱你%';

select count(1) from log
where content like '%生气%';

select count(1) from log
where content like '%开心%';

select count(1) from log
where content like '%敲%';

select count(1) from log
where content like '%doi%';

select count(1) from log
where content like '%想敲%';

select count(1) from log
where content like '%怎么个事%';

select count(1) from log
where content like '%嘤嘤嘤%';

select count(1) from log
where content like '%爸爸敲我%';

select count(1) from log
where content like '%你小子%';

select count(1) from log
where content like '%嘎嘎%';

select count(1) from log
where content like '%爱%';

select count(1) from log
where content like '%最爱%';

select count(1) from log
where content like '%宝宝%';

select count(1) from log
where content like '%婆%';

select count(1) from log
where content like '%公%';

select count(1) from log
where content like '%晚安%';

select count(1) from log
where content like '%早安%';

select count(1) from log
where content like '%午安%';

-- 按月分组
select count(id), date_format(datetime,"%m") as m from log
group by m;

-- 按小时分组
select count(id), date_format(datetime,"%H") as m from log
group by m;