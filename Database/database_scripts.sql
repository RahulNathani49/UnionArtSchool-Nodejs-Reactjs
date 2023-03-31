CREATE DATABASE UnionArtSchool;
USE UnionArtSchool;
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE topics (
    topic_id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT NOT NULL,
    topic_name VARCHAR(255) NOT NULL,
    description TEXT,
    PRIMARY KEY (category_id, name),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    customer_email VARCHAR(255) NOT NULL,
    customer_password VARCHAR(255) NOT NULL
);

CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_name VARCHAR(255) NOT NULL,
    hourly_rate DECIMAL(10, 2) NOT NULL,
    teacher_password VARCHAR(255) NOT NULL
);


CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    topic_id INT NOT NULL,
    studio_rent DECIMAL(10, 2) NOT NULL,
    minimum_participants INT NOT NULL,
    duration INT NOT NULL,
    sales_tax DECIMAL(4, 2) NOT NULL,
    administrative_fee DECIMAL(4, 2) NOT NULL,
    PRIMARY KEY (topic_id),
    FOREIGN KEY (topic_id) REFERENCES topics(topic_id)
);

CREATE TABLE course_teachers (
    course_id INT NOT NULL,
    teacher_id INT NOT NULL,
    PRIMARY KEY (course_id, teacher_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

CREATE TABLE pricing_configs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT NOT NULL,
    num_students_from INT NOT NULL,
    num_students_to INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (course_id, num_students_from, num_students_to),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    topic_id INT NOT NULL,
    course_id INT NOT NULL,
    teacher_id INT NOT NULL,
    num_students INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    PRIMARY KEY (course_id, start_time),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);
