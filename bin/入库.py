#encoding=utf-8
import pymysql
import re
from pymysql.converters import escape_string
conn = pymysql.connect(
    host='localhost',
    user='root',
    password='19990308aaBB@',
    db='wechat',
    charset='utf8mb4',
    port=3306)

cur = conn.cursor()

# id = 362318
# #select_sql = f"select * from log where id={id}"
# select_sql = "select id,user,content, datetime, DATE_FORMAT(datetime,'%H') as h from log \
# where DATE_FORMAT(datetime,'%H') <= 5 \
# order by h desc, datetime"
# cur.execute(select_sql)
# results = cur.fetchall()
# print(results)
# exit()


with open(r"D:\Master\Wechat Report\Report Files\sunshine\老婆.txt", encoding='utf-8') as f:
    lines = f.readlines()
    filter_lines = []
    reg = "^.*\s\(.+\):"

    for line in lines:
        # 去除转发的聊天记录 简单过滤
        if (line.startswith('sunshine') or line.startswith('老婆')) and re.match(reg, line):
            filter_lines.append(line.strip())

for line in filter_lines:
    s1 = line.find(" ")
    s2 = line.find("):")
    name = line[:s1]
    time = line[s1 + 2:s2]
    content = line[s2 + 2:]
    #data = (name.encode('utf8mb4'), time, escape_string(content.encode('utf8mb4')))
    insert_sql = "insert into log(user,datetime,content) values (%s,%s,%s)"
    cur.execute(insert_sql, (name, time, escape_string(content)))
conn.commit()
