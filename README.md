## 🔴 Live
https://track-faster.onrender.com/

## How to run?
First, this is a Dockerized project. Once the project is cloned. The next step is to build 
the image by running:
```bash
sudo docker compose build
```
then, run the following to run the project on development.
```
sudo docker compose up -d
```

## 🚀 Features
1. Add project step.
2. Mark project step as done.
3. Customize title and text.
4. Delete task as you wish
5. 

## 🧱 Tech Stack
1. Ruby
2. JavaScript
3. Shell Scripting
4. Docker
5. Rack
6. Rackup
7. Puma
8. Pg
9. render.com for deployment

## Example of dive in the database
```bash
 ··> sudo docker compose run --rm web sh -c 'psql $DATABASE_URL'
[+]  1/1t 1/1
 ✔ Container track_faster-db-1 Running                                                                                                                                           0.0s
Container track_faster-web-run-2cca51dc8c2a Creating
Container track_faster-web-run-2cca51dc8c2a Created
psql (17.6 (Debian 17.6-0+deb13u1), server 18.0 (Debian 18.0-1.pgdg13+3))
WARNING: psql major version 17, server major version 18.
         Some psql features might not work.
Type "help" for help.

track_faster_development=# \d
              List of relations
 Schema |     Name     |   Type   |  Owner
--------+--------------+----------+----------
 public | tasks        | table    | postgres
 public | tasks_id_seq | sequence | postgres
(2 rows)

track_faster_development=# select * from tasks;
 id |          title
----+-------------------------
  1 | idea
  2 | build
  3 | deploy
  4 | grow
  5 | monetize
  6 | automate
  7 | exit
  8 | This another step!
  9 | Extra step!
 10 | Another extra step!
 11 | Other step!
 12 | Another step that helps
(12 rows)

track_faster_development=#
```
