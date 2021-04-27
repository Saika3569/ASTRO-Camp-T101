# 任務管理系統

部署網址: <https://astrocamptask.herokuapp.com>

## 開發環境

* Ruby:2.7.1
* Rails:6.0.3.5
* 資料庫:PostgreSQL
* 部署:Heroku

## Table schema
User                 
|users|資料型態|
|:-:|:-:|
|name|string|
|email | string  |
|password_digest|string|
|admin|boolean   |
|created_at|datetime|
|updated_at|datetime|

Task                 
|tasks|資料型態|
|:-:|:-:|
| title|string|
|  content | string  |
|state|string|
|   start_at|datetime   |
|   end_at|datetime   |
|priority|integer|
|user_id|bigint|
|state,title,user_id|index|
|created_at|datetime|
|updated_at|datetime|

Tag
|tags|資料型態|
|:-:|:-:|
| name|string|
|created_at|datetime|
|updated_at|datetime|

Tagging
|taggings|資料型態|
|:-:|:-:|
|tag_id,task_id|bigint|
|tag_id,task_id|index|
|created_at|datetime|
|updated_at|datetime|
## ER圖
待捕
## 部署方法
待捕

