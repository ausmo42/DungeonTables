--CREATE USER dungeonmaster IDENTIFIED BY "admin";
--GRANT DBA TO dungeonmaster;

DROP TABLE dt_user CASCADE CONSTRAINTS;
DROP TABLE dt_character CASCADE CONSTRAINTS;
DROP TABLE dt_job CASCADE CONSTRAINTS;
DROP TABLE dt_specialty CASCADE CONSTRAINTS;
DROP TABLE dt_job_specialty_join CASCADE CONSTRAINTS;
DROP TABLE dt_item CASCADE CONSTRAINTS;
DROP TABLE dt_item_type CASCADE CONSTRAINTS;
DROP TABLE dt_user_item_join CASCADE CONSTRAINTS;

CREATE TABLE dt_user(
    user_id NUMBER(10) PRIMARY KEY,
    user_name VARCHAR(20) UNIQUE,
    user_password VARCHAR(100)
);

CREATE TABLE dt_character(
    c_id NUMBER(10) PRIMARY KEY,
    c_name VARCHAR(20),
    c_type NUMBER(10),
    c_level NUMBER(4),
    c_exp NUMBER(8),
    c_strength NUMBER(5),
    c_intelligence NUMBER(5),
    c_luck NUMBER(5),
    c_tool NUMBER(10),
    c_accessory NUMBER(10)    
);

CREATE TABLE dt_char_type(
    ctype_id NUMBER(10) PRIMARY KEY,
    ctype_name VARCHAR(20),
    ctype_str_base NUMBER(5),
    ctype_int_base NUMBER(5),
    ctype_lck_base NUMBER(5),
    ctype_str_grow NUMBER(5),
    ctype_int_grow NUMBER(5),
    ctype_lck_grow NUMBER(5),
    ctype_exp_scale NUMBER(10)
);

CREATE TABLE dt_job(
    j_id NUMBER(10) PRIMARY KEY,
    j_name VARCHAR(20) UNIQUE,
    j_str_mult NUMBER(3,2),
    j_int_mult NUMBER(3,2),
    j_lck_mult NUMBER(3,2)
);

CREATE TABLE dt_specialty(
    sp_id NUMBER(10) PRIMARY KEY,
    sp_name VARCHAR(30) UNIQUE
);

CREATE TABLE dt_job_specialty_join(
    jsj_job NUMBER(10),
    jsj_specialty NUMBER(10)
);

CREATE TABLE dt_item(
    it_id NUMBER(10) PRIMARY KEY,
    it_type NUMBER(10),
    it_name VARCHAR(30) UNIQUE,
    it_value NUMBER(10)
);

CREATE TABLE dt_item_type(
    itype_id NUMBER(10) PRIMARY KEY,
    itype_name VARCHAR(10)
);

CREATE TABLE dt_user_item_join(
    uij_user NUMBER(10),
    uij_item NUMBER(10),
    uij_quantity NUMBER(5)
);