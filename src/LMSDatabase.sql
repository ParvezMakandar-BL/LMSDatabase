CREATE SCHEMA IF NOT EXISTS `LMSPROJECTDB`;

-- Table `LMSPROJECTDB`.`User_Details`
CREATE TABLE `LMSPROJECTDB`.`User_Details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(50) NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `Password` VARCHAR(50) NOT NULL,
  `contact_number` BIGINT NOT NULL,
  `verified` VARCHAR(50) NOT NULL,
  `creator_stamp` DATETIME NOT NULL,
  `creator_user` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Password_UNIQUE` (`Password` ASC) VISIBLE);



-- Table `LMSPROJECTDB`.`Tech_Type`--
CREATE TABLE IF NOT EXISTS `LMSPROJECTDB`.`Tech_Type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type_name` VARCHAR(50) NOT NULL,
  `cur_status` VARCHAR(50) NOT NULL,
  `creator_stamp` DATETIME NOT NULL,
  `creator_user` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`));



-- Table `LMSPROJECTDB`.`Tech_Stack`
CREATE TABLE IF NOT EXISTS `LMSPROJECTDB`.`Tech_Stack` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tech_name` VARCHAR(50) NOT NULL,
  `image_path` VARCHAR(50) NOT NULL,
  `framework` VARCHAR(50) NOT NULL,
  `cur_status` VARCHAR(50) NOT NULL,
  `creator_stamp` DATETIME NOT NULL,
  `creator_user` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`));

-- Table `LMSPROJECTDB`.`Mentor_Tech_Stack`
CREATE TABLE IF NOT EXISTS `LMSPROJECTDB`.`Mentor_Tech_Stack` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mentor_id` INT NOT NULL,
  `tech_stack_id` INT NOT NULL,
  `Status` VARCHAR(50) NOT NULL,
  `creator_stamp` DATETIME NOT NULL,
  `creator_user` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Mentor_Tech_Stack_1_idx` (`tech_stack_id` ASC) VISIBLE,
  INDEX `fk_Mentor_Tech_Stack_2_idx` (`mentor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Mentor_Tech_Stack_1`
    FOREIGN KEY (`tech_stack_id`)
    REFERENCES `LMSPROJECTDB`.`Tech_Stack` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mentor_Tech_Stack_2`
    FOREIGN KEY (`mentor_id`)
    REFERENCES `LMSPROJECTDB`.`Mentor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- Table `LMSPROJECTDB`.`Mentor_Ideation_Map`--
CREATE TABLE IF NOT EXISTS `LMSPROJECTDB`.`Mentor_Ideation_Map` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `parent_mentor_id` INT NOT NULL,
  `mentor_id` INT NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `creator_stamp` DATETIME NOT NULL,
  `creator_user` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Mentor_Ideation_Map_1_idx` (`mentor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Mentor_Ideation_Map_1`
    FOREIGN KEY (`mentor_id`)
    REFERENCES `LMSPROJECTDB`.`Mentor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- Table `LMSPROJECTDB`.`Mentor`--

CREATE TABLE IF NOT EXISTS `LMSPROJECTDB`.`Mentor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `mentor_type` VARCHAR(50) NOT NULL,
  `lab_id` INT NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `creator_stamp` DATETIME NOT NULL,
  `creator_user` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Mentor_1_idx` (`lab_id` ASC) VISIBLE,
  CONSTRAINT `fk_Mentor_1`
    FOREIGN KEY (`lab_id`)
    REFERENCES `LMSPROJECTDB`.`Lab` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- Table `LMSPROJECTDB`.`Maker_Program`--
CREATE TABLE IF NOT EXISTS `LMSPROJECTDB`.`Maker_Program` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `program_name` VARCHAR(50) NOT NULL,
  `program_type` VARCHAR(50) NOT NULL,
  `program_link` VARCHAR(50) NOT NULL,
  `tech_stack_id` INT NOT NULL,
  `tech_type_id` INT NOT NULL,
  `is_program_approved` VARCHAR(50) NOT NULL,
  `Description` VARCHAR(50) NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `creator_stamp` DATETIME NOT NULL,
  `creator_user` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Maker_Program_1_idx` (`tech_stack_id` ASC) VISIBLE,
  INDEX `fk_Maker_Program_2_idx` (`tech_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_Maker_Program_1`
    FOREIGN KEY (`tech_stack_id`)
    REFERENCES `LMSPROJECTDB`.`Tech_Stack` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Maker_Program_2`
    FOREIGN KEY (`tech_type_id`)
    REFERENCES `LMSPROJECTDB`.`Tech_Type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- Table `LMSPROJECTDB`.`Lab_Threshold`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LMSPROJECTDB`.`Lab_Threshold` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lab_id` INT NOT NULL,
  `lab_capacity` INT NOT NULL,
  `lead_threshold` VARCHAR(50) NOT NULL,
  `ideation_engg_threshold` VARCHAR(50) NOT NULL,
  `buddy_engg_threshold` VARCHAR(50) NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `creator_stamp` DATETIME NOT NULL,
  `creator_user` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Lab_Threshold_1_idx` (`lab_id` ASC) VISIBLE,
  CONSTRAINT `fk_Lab_Threshold_1`
    FOREIGN KEY (`lab_id`)
    REFERENCES `LMSPROJECTDB`.`Lab` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- Table `LMSPROJECTDB`.`Lab`--

CREATE TABLE IF NOT EXISTS `LMSPROJECTDB`.`Lab` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `location` VARCHAR(50) NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `creator_stamp` DATETIME NOT NULL,
  `creator_user` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`));


-- Table `LMSPROJECTDB`.`Hired_Candidate`--

CREATE TABLE IF NOT EXISTS `LMSPROJECTDB`.`Hired_Candidate` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(50) NOT NULL,
  `Middle_Name` VARCHAR(50) NOT NULL,
  `Last_Name` VARCHAR(50) NOT NULL,
  `Email_Id` VARCHAR(50) NOT NULL,
  `Hired_City` VARCHAR(50) NOT NULL,
  `Degree` VARCHAR(50) NOT NULL,
  `Hired_Date` DATE NOT NULL,
  `Mobile_Number` INT(15) NOT NULL,
  `Permanent_Pincode` INT(6) NOT NULL,
  `Hired_Lab` VARCHAR(50) NOT NULL,
  `Attitude` INT NOT NULL,
  `Communication_Remark` INT NOT NULL,
  `Knowledge_Remark` INT NOT NULL,
  `Aggregate_Remark` INT NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `creator_Stamp` DATETIME NOT NULL,
  `Creator_User` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Id`));


-- Table `LMSPROJECTDB`.`Fellowship_Candidate`--

CREATE TABLE IF NOT EXISTS `LMSPROJECTDB`.`Fellowship_Candidate` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `First_Name` VARCHAR(50) NOT NULL,
  `Middle_Name` VARCHAR(50) NOT NULL,
  `Last_Name` VARCHAR(50) NOT NULL,
  `Email_Id` VARCHAR(50) NOT NULL,
  `Hired_City` VARCHAR(50) NOT NULL,
  `Degree` VARCHAR(50) NOT NULL,
  `Hired_Date` DATE NOT NULL,
  `Mobile_Number` INT(15) NOT NULL,
  `Permanent_Pincode` INT NOT NULL,
  `Hired_Lab` VARCHAR(50) NOT NULL,
  `Attitude` INT NOT NULL,
  `Communication_Remark` INT NOT NULL,
  `Knowledge_Remark` INT NOT NULL,
  `Aggregate_Remark` INT NOT NULL,
  `creator_Stamp` DATETIME NOT NULL,
  `creator_User` VARCHAR(50) NOT NULL,
  `Birth_Date` DATE NOT NULL,
  `Is_Birth_Date_Verified` VARCHAR(50) NOT NULL,
  `Parent_Name` VARCHAR(50) NOT NULL,
  `Parent_Occupation` VARCHAR(50) NOT NULL,
  `Parents_Mobile_Number` INT(15) NOT NULL,
  ` Parents_Annual_Salary` DOUBLE NOT NULL,
  `Local_Address` VARCHAR(50) NOT NULL,
  `Permanent_Address` VARCHAR(50) NOT NULL,
  `Photo_Path` VARCHAR(50) NOT NULL,
  `Joinig_Date` DATE NOT NULL,
  `Candidate_Status` VARCHAR(50) NOT NULL,
  `Personal_Information` VARCHAR(50) NOT NULL,
  `Bank_Information` VARCHAR(50) NOT NULL,
  `Educational_Information` VARCHAR(50) NOT NULL,
  `Document_Status` VARCHAR(50) NOT NULL,
  ` Remark` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;



-- Table `LMSPROJECTDB`.`Company_Requirement`--

CREATE TABLE IF NOT EXISTS `LMSPROJECTDB`.`Company_Requirement` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `company_id` INT NOT NULL,
  `requested_month` INT NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `is_doc_verifrication` VARCHAR(50) NOT NULL,
  `requirement_doc_path` VARCHAR(50) NOT NULL,
  `no_of_engg` INT NOT NULL,
  `tech_stack_id` INT NOT NULL,
  `tech_type_id` INT NOT NULL,
  `maker_program_id` INT NOT NULL,
  `lead_id` INT NOT NULL,
  `ideation_engg_id` INT NOT NULL,
  `buddy_engg_id` INT NOT NULL,
  `special_remark` VARCHAR(50) NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `creator_stamp` DATETIME NOT NULL,
  `creator_user` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Company_Requirement_1_idx` (`company_id` ASC) VISIBLE,
  INDEX `fk_Company_Requirement_2_idx` (`tech_stack_id` ASC) VISIBLE,
  INDEX `fk_Company_Requirement_3_idx` (`tech_type_id` ASC) VISIBLE,
  INDEX `fk_Company_Requirement_4_idx` (`maker_program_id` ASC) VISIBLE,
  CONSTRAINT `fk_Company_Requirement_1`
    FOREIGN KEY (`company_id`)
    REFERENCES `LMSPROJECTDB`.`Company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Company_Requirement_2`
    FOREIGN KEY (`tech_stack_id`)
    REFERENCES `LMSPROJECTDB`.`Tech_Stack` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Company_Requirement_3`
    FOREIGN KEY (`tech_type_id`)
    REFERENCES `LMSPROJECTDB`.`Tech_Type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Company_Requirement_4`
    FOREIGN KEY (`maker_program_id`)
    REFERENCES `LMSPROJECTDB`.`Maker_Program` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- Table `LMSPROJECTDB`.`Company`--

CREATE TABLE IF NOT EXISTS `LMSPROJECTDB`.`Company` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  `location` VARCHAR(50) NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `creator_stamp` DATETIME NOT NULL,
  `creator_user` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;



-- Table `LMSPROJECTDB`.`Candidate_Stack_Assignment`--

CREATE TABLE IF NOT EXISTS `LMSPROJECTDB`.`Candidate_Stack_Assignment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `requirement_id` INT NOT NULL,
  `candidate_id` INT NOT NULL,
  `assign_date` DATE NOT NULL,
  `complete_date` DATE NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `creator_stamp` DATETIME NOT NULL,
  `creator_user` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Candidate_Stack_Assignment_1_idx` (`candidate_id` ASC) VISIBLE,
  CONSTRAINT `fk_Candidate_Stack_Assignment_1`
    FOREIGN KEY (`candidate_id`)
    REFERENCES `LMSPROJECTDB`.`Fellowship_Candidate` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- Table `LMSPROJECTDB`.`Candidate_Qualification`--

CREATE TABLE IF NOT EXISTS `LMSPROJECTDB`.`Candidate_Qualification` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `candidate_id` INT NOT NULL,
  `diploma` VARCHAR(50) NOT NULL,
  `degree_name` VARCHAR(50) NOT NULL,
  `is_degree_name_verified` VARCHAR(50) NOT NULL,
  `employee_decipline` VARCHAR(50) NOT NULL,
  `is_employee_decipline_verified` VARCHAR(50) NOT NULL,
  `passing_year` INT NOT NULL,
  `is_passing_year_verified` INT NOT NULL,
  `aggr_per` DOUBLE NOT NULL,
  `is_passing_year_verified,` VARCHAR(50) NOT NULL,
  `final_year_per` INT NOT NULL,
  `is_final_year_per_verified,` VARCHAR(50) NOT NULL,
  `training_institute` VARCHAR(50) NOT NULL,
  `is_training_institute_verified` VARCHAR(50) NOT NULL,
  `training_duration_month` INT NOT NULL,
  `is_training_duration_month_verified` VARCHAR(50) NOT NULL,
  `other_training` VARCHAR(50) NOT NULL,
  `is_other_training_verified` VARCHAR(50) NOT NULL,
  `creator_stamp` DATETIME NOT NULL,
  `creator_user` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ Candidate_Qualification_1_idx` (`candidate_id` ASC) VISIBLE,
  CONSTRAINT `fk_ Candidate_Qualification_CandidateId`
    FOREIGN KEY (`candidate_id`)
    REFERENCES `LMSPROJECTDB`.`Fellowship_Candidate` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- Table `LMSPROJECTDB`.`Candidate_Documents`--
CREATE TABLE IF NOT EXISTS `LMSPROJECTDB`.`Candidate_Documents` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `candidate_id` INT NOT NULL,
  `doc_type` VARCHAR(50) NOT NULL,
  `doc_path` VARCHAR(50) NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `creator_stamp` DATETIME NOT NULL,
  `creator_user` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Candidate_Documents_1_idx` (`candidate_id` ASC) VISIBLE,
  CONSTRAINT `fk_Candidate_Documents_1`
    FOREIGN KEY (`candidate_id`)
    REFERENCES `LMSPROJECTDB`.`Fellowship_Candidate` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- Table `LMSPROJECTDB`.`Candidate_Bank_Details`--
CREATE TABLE IF NOT EXISTS `LMSPROJECTDB`.`Candidate_Bank_Details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `candidate_Id` INT NOT NULL,
  `Account_Number` INT(20) NOT NULL,
  `Is_Account_Num_Verified` VARCHAR(50) NOT NULL,
  `Ifsc_code` VARCHAR(50) NOT NULL,
  `is_ifsc_code_verified` VARCHAR(50) NOT NULL,
  ` pan_number` VARCHAR(50) NOT NULL,
  `  is_pan_number_verified` VARCHAR(50) NOT NULL,
  `addhaar_number` VARCHAR(50) NOT NULL,
  `is_addhaar_number_verified` VARCHAR(50) NOT NULL,
  `creator_stamp` DATETIME NOT NULL,
  `creator_user` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Candidate_Bank_Details_1_idx` (`candidate_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Candidate_Bank_Details_1`
    FOREIGN KEY (`candidate_Id`)
    REFERENCES `LMSPROJECTDB`.`Fellowship_Candidate` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- Table `LMSPROJECTDB`.`App_Parameters`--
CREATE TABLE IF NOT EXISTS `LMSPROJECTDB`.`App_Parameters` (
  `id` INT NOT NULL,
  `key_type` VARCHAR(50) NOT NULL,
  `key_value` VARCHAR(50) NOT NULL,
  `key_text` VARCHAR(50) NOT NULL,
  `cur_status` VARCHAR(50) NOT NULL,
  `lastupd_user` VARCHAR(50) NOT NULL,
  `lastupd_stamp` VARCHAR(50) NOT NULL,
  `creator_stamp` DATETIME NOT NULL,
  `creator_user` VARCHAR(50) NOT NULL,
  `seq_num` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;