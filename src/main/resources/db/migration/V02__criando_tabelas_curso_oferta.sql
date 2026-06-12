DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `img_gray_uri` varchar(255) DEFAULT NULL,
                          `img_uri` varchar(255) DEFAULT NULL,
                          `name` varchar(255) DEFAULT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `offer`;
CREATE TABLE `offer` (
                         `id` bigint NOT NULL AUTO_INCREMENT,
                         `edition` varchar(255) DEFAULT NULL,
                         `end_moment` datetime(6) DEFAULT NULL,
                         `start_moment` datetime(6) DEFAULT NULL,
                         `course_id` bigint DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         KEY `FK1q17i2dp3jm59xlih21imsakd` (`course_id`),
                         CONSTRAINT `FK1q17i2dp3jm59xlih21imsakd` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO course (name, img_Uri, img_Gray_Uri) VALUES ('Bootcamp HTML', 'https://cdn.pixabay.com/photo/2018/03/22/10/55/trainingcourse-3250007_1280.jpg', 'https://upload.wikimedia.org/wikipedia/commons/1/1f/Switch-course-book-grey.svg&#39');
INSERT INTO offer (edition, start_Moment, end_Moment, course_id) VALUES ('1.0', now(), now(), 1);
INSERT INTO offer (edition, start_Moment, end_Moment, course_id) VALUES ('2.0', now(), now(), 1);

CREATE TABLE `resource` (
                            `id` INT NOT NULL AUTO_INCREMENT,
                            `title` VARCHAR(100) NULL,
                            `description` VARCHAR(200) NULL,
                            `position` INT NULL,
                            `imgUri` VARCHAR(200) NULL,
                            `type` VARCHAR(60) NULL,
                            `offer_id` BIGINT NOT NULL,
                            PRIMARY KEY (`id`),
                            INDEX `FK_resource_offer_idx` (`offer_id` ASC),
                            CONSTRAINT `FK_resource_offer`
                                FOREIGN KEY (`offer_id`)
                                    REFERENCES `escola`.`offer` (`id`)
                                    ON DELETE NO ACTION
                                    ON UPDATE NO ACTION);

CREATE TABLE `section` (
                           `id` BIGINT NOT NULL AUTO_INCREMENT,
                           `title` VARCHAR(100) NULL,
                           `description` VARCHAR(200) NULL,
                           `position` INT NULL,
                           `img_uri` VARCHAR(200) NULL,
                           `resource_id` INT NULL,
                           `prerequisite_id` BIGINT NULL,
                           PRIMARY KEY (`id`),
                           INDEX `Fk_section_resource_idx` (`resource_id` ASC),
                           CONSTRAINT `Fk_section_resource`
                               FOREIGN KEY (`resource_id`)
                                   REFERENCES `resource` (`id`)
                                   ON DELETE NO ACTION
                                   ON UPDATE NO ACTION);

ALTER TABLE `section`
    ADD INDEX `Fk_self_relationship_idx` (`prerequisite_id` ASC);

ALTER TABLE `section`
    ADD CONSTRAINT `Fk_self_relationship`
        FOREIGN KEY (`prerequisite_id`)
            REFERENCES `section` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION;