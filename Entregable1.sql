CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int NOT NULL,
  "role_id" int NOT NULL
);

CREATE TABLE "courses" (
  "id" serial PRIMARY KEY,
  "title" varchar UNIQUE NOT NULL,
  "description" text NOT NULL,
  "level" varchar NOT NULL,
  "teacher_id" int UNIQUE NOT NULL,
  "categorie_id" int UNIQUE NOT NULL,
  "video_id" int UNIQUE NOT NULL
);

CREATE TABLE "course_video" (
  "id" serial PRIMARY KEY,
  "title" varchar UNIQUE NOT NULL,
  "url" varchar UNIQUE NOT NULL,
  "course_id" int NOT NULL
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL
);

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "courses" ("teacher_id");

ALTER TABLE "courses" ADD FOREIGN KEY ("categorie_id") REFERENCES "categories" ("id");

ALTER TABLE "course_video" ADD FOREIGN KEY ("id") REFERENCES "courses" ("video_id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");


--ROLES--
INSERT INTO roles (id, name) VALUES  ('1','student');

INSERT INTO roles (id,name) VALUES  (2,'teacher'), (3,'admin');

SELECT * from roles;

--CATEGORIA--
INSERT INTO categories (id,name) VALUES  (1,'frontend'), (2,'backend'),  (3,'cybersecurity'), (4,'data bases');
SELECT * from categories;

--USUARIOS--
INSERT INTO users (id, name, email, password, age, role_id )
VALUES  (1,'David','david@gmail.com', '12345', 29, '1'), 
		(2,'Ramon','ramon@outlook.com', 'root', 19, 2);  
SELECT * from users;

--COURSES--
INSERT INTO courses  (id, title, description, level, teacher_id, categorie_id, video_id )
VALUES   (1,'Curso de CSS','Introduccion a maquetado', 'principiante', 1, 2, 1),
		(2,'Computo forense','Introduccion al sistema Kali linux', 'principiante', 2, 3, 2);
SELECT * from courses;



