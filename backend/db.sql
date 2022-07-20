drop database `checkpoint`;
create database `checkpoint`;
use `checkpoint`;

CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(80) NOT NULL,
    `email` VARCHAR(80) UNIQUE NOT NULL,
    `birthday` DATE,
    `newsletter` tinyint(1) NOT NULL,
    `pref_percentage` INT DEFAULT 7,
    `pref_max_amount` INT DEFAULT 10,
    `role` VARCHAR(40) DEFAULT 'user',
    `hashedPassword` varchar(300) NOT NULL,
    PRIMARY KEY (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
INSERT INTO
  `users`
VALUES
  (
    1,
    'Alexandre',
    'alexcosta1889@gmail.com',
    '1994-02-19',
    0,
    DEFAULT,
    DEFAULT,
    'admin',
    '$2a$12$LZXzvHE.Itl98Ef/503EUeaxpm1BCUdghtOXPminkusDXnk/.uqNa'
  );

CREATE TABLE `portfolio` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL,
    `performance` DECIMAL(4,2) UNIQUE NOT NULL,
    `type` VARCHAR(40) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
INSERT INTO
  `portfolio`
VALUES
  ( 
    1,
    "trust",
    3.21,
    "100% Anleihen",
    "Deine Investments gehen zu 100% in nachhaltige Anleihen. Was das genau bedeutet erfährst du hier."
  ),
  (
    2,
    "grow",
    5.26,
    "50% Anleihen 50% Aktien",
    "Deine Investments gehen zu 50% in nachhaltige Anleihen und 50% in nachhaltige Aktien. Was das genau bedeutet erfährst du hier."
  ),
  (
    3,
    'push',
    7.31,
    '100% Aktien',
    'Deine Investments gehen zu 100% in nachhaltige Aktien. Was das genau bedeutet erfährst du hier.'
  );
  
  
  
CREATE TABLE `growth` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `month` VARCHAR(40) NOT NULL,
    `deposit` INT NOT NULL,
    `user_id`  INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES users(`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
INSERT INTO
  `growth`
VALUES
  (
    1,
    'july',
    400,
    1
  );

CREATE TABLE `expenses` (
    `id` int NOT NULL AUTO_INCREMENT,
    `expense_value` DECIMAL(6,2) NOT NULL,
    `expense_date` DATE NOT NULL,
    `user_id`  INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES users(`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
INSERT INTO
  `expenses`
VALUES
  (
    1,
    400,
    '2022-05-07',
    1   
  ),
  (
    2,
    200,
    '2022-05-07',
    1   
  ),
  (
    3,
    250,
    '2022-06-07',
    1   
  ),
  (
    4,
    300,
    '2022-06-07',
    1   
  ),
   (
    5,
    400,
    '2022-07-07',
    1   
  ),
  (
    6,
    300,
    '2022-07-07',
    1   
  ),
  (
    7,
    50,
    '2022-07-07',
    1   
  );

CREATE TABLE `investments` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `investment_value` DECIMAL(6,2) NOT NULL,
    `investment_date` DATE NOT NULL,
    `user_id`  INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES users(`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
INSERT INTO
  `investments`
VALUES
  (
    1,
    40,
    '2022-05-07',
    1   
  ),
  (
    2,
    7,
    '2022-05-07',
    1   
  ),
  (
    3,
    40,
    '2022-06-07',
    1   
  ),
  (
    4,
    10,
    '2022-06-07',
    1   
  ),
   (
    5,
    50,
    '2022-07-07',
    1   
  ),
  (
    6,
    10,
    '2022-07-07',
    1   
  ),
  (
    7,
    4,
    '2022-07-07',
    1   
  );

CREATE TRIGGER MyTriggerUser_portfolio AFTER INSERT ON users
  FOR EACH ROW
  INSERT INTO user_portfolio (user_id) VALUES (NEW.id);

CREATE TABLE `user_portfolio` (
    `user_id`  INT NOT NULL,
    `portfolio_id`  INT NOT NULL DEFAULT 2,
    PRIMARY KEY (`user_id`),
    FOREIGN KEY (`user_id`) REFERENCES users(`id`),
    FOREIGN KEY (`portfolio_id`) REFERENCES portfolio(`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
INSERT INTO
  `user_portfolio`
VALUES
  (
    1,
    DEFAULT
  );

CREATE TABLE `tester_checklist` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `payment_status`tinyint(1) NOT NULL DEFAULT 0,
    `user_id`  INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES users(`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
INSERT INTO
  `tester_checklist`
VALUES
  (
    1,
    DEFAULT,
    1
  );

CREATE TRIGGER MyTriggerChecklist AFTER INSERT ON users
  FOR EACH ROW
  INSERT INTO `tester_checklist` (user_id) VALUES (NEW.id);

CREATE TABLE `EmailControler` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `birthday_notification` BOOLEAN NOT NULL DEFAULT 0,
    `christmas_notification` BOOLEAN NOT NULL DEFAULT 0,
    `weekly_notification` BOOLEAN NOT NULL DEFAULT 0,
    `new_user` BOOLEAN NOT NULL DEFAULT 0,
    `user_id`  INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES users(`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
  INSERT INTO
  `EmailControler`
VALUES
  (
    1,
    DEFAULT,
    DEFAULT,
    DEFAULT,
    DEFAULT,
    1
  );

CREATE TRIGGER MyTrigger AFTER INSERT ON users
    FOR EACH ROW
    INSERT INTO EmailControler (user_id) VALUES (NEW.id);

CREATE TABLE `csv` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `date` DATE NOT NULL ,
    `transaction_date` VARCHAR(40) NOT NULL,
    `transaction_type` VARCHAR(40) NOT NULL,
    `entity` VARCHAR(40) NOT NULL,
    `value` INT NOT NULL,
    `user_id`  INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES users(`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
INSERT INTO
  `csv`
VALUES
  (
    1,
    "2022-08-10",
    "2022-08-10",
    "amazon",
    "banco bic",
    400,
    1
  );