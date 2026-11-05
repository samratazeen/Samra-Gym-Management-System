CREATE DATABASE IF NOT EXISTS gym_management;
USE gym_management;
CREATE TABLE IF NOT EXISTS members(member_id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100) NOT NULL,email VARCHAR(100) UNIQUE NOT NULL,phone VARCHAR(15),join_date DATE,status VARCHAR(20) DEFAULT 'Active');
CREATE TABLE IF NOT EXISTS membership_plans(plan_id INT AUTO_INCREMENT PRIMARY KEY,plan_name VARCHAR(100) NOT NULL,duration_months INT NOT NULL,fee DECIMAL(10,2) NOT NULL,description TEXT);
CREATE TABLE IF NOT EXISTS trainers(trainer_id INT AUTO_INCREMENT PRIMARY KEY,trainer_name VARCHAR(100) NOT NULL,specialization VARCHAR(100),phone VARCHAR(15),email VARCHAR(100));
CREATE TABLE IF NOT EXISTS subscriptions(subscription_id INT AUTO_INCREMENT PRIMARY KEY,member_id INT NOT NULL,plan_id INT NOT NULL,start_date DATE NOT NULL,end_date DATE NOT NULL,payment_status VARCHAR(20) DEFAULT 'Pending',FOREIGN KEY(member_id) REFERENCES members(member_id),FOREIGN KEY(plan_id) REFERENCES membership_plans(plan_id));
CREATE TABLE IF NOT EXISTS trainer_assignments(assignment_id INT AUTO_INCREMENT PRIMARY KEY,member_id INT NOT NULL,trainer_id INT NOT NULL,FOREIGN KEY(member_id) REFERENCES members(member_id),FOREIGN KEY(trainer_id) REFERENCES trainers(trainer_id),UNIQUE(member_id));
