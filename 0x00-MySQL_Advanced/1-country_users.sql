-- Create the users with enumeration of countries: US, CO and TN

CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    country ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US'
);
