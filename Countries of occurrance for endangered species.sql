-- Create the Family table
CREATE TABLE `Family` (
    `family_id` INT PRIMARY KEY AUTO_INCREMENT,
    `family_name` VARCHAR(100) NOT NULL,
    `description` TEXT
);

-- Create the Genus table
CREATE TABLE `Genus` (
    `genus_id` INT PRIMARY KEY AUTO_INCREMENT,
    `genus_name` VARCHAR(100) NOT NULL,
    `description` TEXT,
    `family_id` INT,
    FOREIGN KEY (`family_id`) REFERENCES `Family`(`family_id`)
);

-- Create the Species table with endangerment status
CREATE TABLE `Species` (
    `species_id` INT PRIMARY KEY AUTO_INCREMENT,
    `species_name` VARCHAR(100) NOT NULL,
    `description` TEXT,
    `genus_id` INT,
    `endangerment_status` ENUM(
        'Not Evaluated',
        'Least Concern',
        'Near Threatened',
        'Vulnerable',
        'Endangered',
        'Critically Endangered',
        'Extinct in the Wild',
        'Extinct'
    ) NOT NULL DEFAULT 'Least Concern',
    FOREIGN KEY (`genus_id`) REFERENCES `Genus`(`genus_id`)
);

-- Create the Country table
CREATE TABLE `Country` (
    `country_id` INT PRIMARY KEY AUTO_INCREMENT,
    `country_name` VARCHAR(100) NOT NULL,
    `description` TEXT
);

-- Create the Species_Country junction table
CREATE TABLE `Species_Country` (
    `species_id` INT,
    `country_id` INT,
    PRIMARY KEY (`species_id`, `country_id`),
    FOREIGN KEY (`species_id`) REFERENCES `Species`(`species_id`) ON DELETE CASCADE,
    FOREIGN KEY (`country_id`) REFERENCES `Country`(`country_id`) ON DELETE CASCADE
);