CREATE DATABASE IF NOT EXISTS ecommerce;

CREATE TABLE IF NOT EXISTS `ecommerce`.`PaymentType` (
  `idPaymentType` INT NOT NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`idPaymentType`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Provider` (
  `idProvider` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Identification` VARCHAR(45) NOT NULL,
  `ProviderType` VARCHAR(1) NOT NULL,
  `Address` VARCHAR(300) NOT NULL,
  `Phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProvider`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Category` (
  `idCategory` INT NOT NULL,
  `Descrição` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategory`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Product` (
  `idProduct` INT NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  `Category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProduct`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Inventory` (
  `idInventory` INT NOT NULL,
  `Local` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idInventory`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Client` (
  `idCliente` INT NOT NULL,
  `Name` VARCHAR(60) NOT NULL,
  `Identification` VARCHAR(45) NOT NULL,
  `PeopleType` VARCHAR(1) NOT NULL,
  `Phone` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Address_Type` (
  `idAddress_Type` INT NOT NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`idAddress_Type`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Status` (
  `idOrderStatus` INT NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  `Active` VARCHAR(1)  NOT NULL,
  PRIMARY KEY (`idOrderStatus`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Bank` (
  `idBank` INT NOT NULL,
  `Code` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`idBank`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`BankAccount` (
  `idBankAccount` INT NOT NULL,
  `Agency` VARCHAR(45) NOT NULL,
  `Number` VARCHAR(45) NOT NULL,
  `Date_Start` DATE NOT NULL,
  `Date_End` DATE NULL,
  `Bank_idBank` INT NOT NULL,
  PRIMARY KEY (`idBankAccount`, `Bank_idBank`),
  INDEX `fk_BankAccount_Bank1_idx` (`Bank_idBank` ASC) VISIBLE,
  CONSTRAINT `fk_BankAccount_Bank1`
    FOREIGN KEY (`Bank_idBank`)
    REFERENCES `ecommerce`.`Bank` (`idBank`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Assignor` (
  `idAssignor` INT NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  `OurNumber_Start` VARCHAR(45) NOT NULL,
  `OurNumber_Emd` VARCHAR(45) NOT NULL,
  `Wallet` INT NOT NULL,
  `Date_Start` DATE NOT NULL,
  `Date_End` DATE NULL,
  `BankAccount_idBankAccount` INT NOT NULL,
  `BankAccount_Bank_idBank` INT NOT NULL,
  `PaymentType_idPaymentType` INT NOT NULL,
  PRIMARY KEY (`idAssignor`, `BankAccount_idBankAccount`, `BankAccount_Bank_idBank`),
  INDEX `fk_Assignor_BankAccount1_idx` (`BankAccount_idBankAccount` ASC, `BankAccount_Bank_idBank` ASC) VISIBLE,
  INDEX `fk_Assignor_PaymentType1_idx` (`PaymentType_idPaymentType` ASC) VISIBLE,
  CONSTRAINT `fk_Assignor_BankAccount1`
    FOREIGN KEY (`BankAccount_idBankAccount` , `BankAccount_Bank_idBank`)
    REFERENCES `ecommerce`.`BankAccount` (`idBankAccount` , `Bank_idBank`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Assignor_PaymentType1`
    FOREIGN KEY (`PaymentType_idPaymentType`)
    REFERENCES `ecommerce`.`PaymentType` (`idPaymentType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Provider_has_Product` (
  `Provider_idProvider` INT NOT NULL,
  `Product_idProduct` INT NOT NULL,
  PRIMARY KEY (`Provider_idProvider`, `Product_idProduct`),
  INDEX `fk_Provider_has_Product_Product1_idx` (`Product_idProduct` ASC) VISIBLE,
  INDEX `fk_Provider_has_Product_Provider_idx` (`Provider_idProvider` ASC) VISIBLE,
  CONSTRAINT `fk_Provider_has_Product_Provider`
    FOREIGN KEY (`Provider_idProvider`)
    REFERENCES `ecommerce`.`Provider` (`idProvider`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Provider_has_Product_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `ecommerce`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Product_has_Inventory` (
  `Product_idProduct` INT NOT NULL,
  `Inventory_idInventory` INT NOT NULL,
  `Quantity` VARCHAR(45) NULL,
  PRIMARY KEY (`Product_idProduct`, `Inventory_idInventory`),
  INDEX `fk_Product_has_Inventory_Inventory1_idx` (`Inventory_idInventory` ASC) VISIBLE,
  INDEX `fk_Product_has_Inventory_Product1_idx` (`Product_idProduct` ASC) VISIBLE,
  CONSTRAINT `fk_Product_has_Inventory_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `ecommerce`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_has_Inventory_Inventory1`
    FOREIGN KEY (`Inventory_idInventory`)
    REFERENCES `ecommerce`.`Inventory` (`idInventory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Order` (
  `idOrder` INT NOT NULL,
  `Description` VARCHAR(45) NULL,
  `OrderDate` DATETIME NULL,
  `ExpectedDeliveryDate` DATE NULL,
  `DeliveryDate` DATETIME NULL,
  `Frete` FLOAT NULL,
  `Client_idCliente` INT NOT NULL,
  `Status_idOrderStatus` INT NOT NULL,
  PRIMARY KEY (`idOrder`, `Client_idCliente`),
  INDEX `fk_Request_Client1_idx` (`Client_idCliente` ASC) VISIBLE,
  INDEX `fk_Order_Status1_idx` (`Status_idOrderStatus` ASC) VISIBLE,
  CONSTRAINT `fk_Request_Client1`
    FOREIGN KEY (`Client_idCliente`)
    REFERENCES `ecommerce`.`Client` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Status1`
    FOREIGN KEY (`Status_idOrderStatus`)
    REFERENCES `ecommerce`.`Status` (`idOrderStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Order_has_PaymentType` (
  `Order_idOrder` INT NOT NULL,
  `Order_Client_idCliente` INT NOT NULL,
  `PaymentType_idPaymentType` INT NOT NULL,
  `Value` FLOAT NULL,
  `Plots` INT NULL,
  `Ticket` INT NULL,
  `BarCode` INT NULL,
  `DigitableLine` INT NULL,
  `OurNumber` VARCHAR(45) NULL,
  `Assignor` VARCHAR(45) NULL,
  `Assignor_idAssignor` INT NOT NULL,
  `Assignor_BankAccount_idBankAccount` INT NOT NULL,
  `Assignor_BankAccount_Bank_idBank` INT NOT NULL,
  PRIMARY KEY (`Order_idOrder`, `Order_Client_idCliente`, `PaymentType_idPaymentType`),
  INDEX `fk_Order_has_PaymentType_Order1_idx` (`Order_idOrder` ASC, `Order_Client_idCliente` ASC) VISIBLE,
  INDEX `fk_Order_has_PaymentType_Assignor1_idx` (`Assignor_idAssignor` ASC, `Assignor_BankAccount_idBankAccount` ASC, `Assignor_BankAccount_Bank_idBank` ASC) VISIBLE,
  CONSTRAINT `fk_Order_has_PaymentType_Order1`
    FOREIGN KEY (`Order_idOrder` , `Order_Client_idCliente`)
    REFERENCES `ecommerce`.`Order` (`idOrder` , `Client_idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_has_PaymentType_Assignor1`
    FOREIGN KEY (`Assignor_idAssignor` , `Assignor_BankAccount_idBankAccount` , `Assignor_BankAccount_Bank_idBank`)
    REFERENCES `ecommerce`.`Assignor` (`idAssignor` , `BankAccount_idBankAccount` , `BankAccount_Bank_idBank`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Order_has_Product` (
  `Order_idRequest` INT NOT NULL,
  `Ordert_Client_idCliente` INT NOT NULL,
  `Order_idProduct` INT NOT NULL,
  `Quantity` VARCHAR(45) NULL,
  PRIMARY KEY (`Order_idRequest`, `Ordert_Client_idCliente`, `Order_idProduct`),
  INDEX `fk_Request_has_Product_Product1_idx` (`Order_idProduct` ASC) VISIBLE,
  INDEX `fk_Request_has_Product_Request1_idx` (`Order_idRequest` ASC, `Ordert_Client_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Request_has_Product_Request1`
    FOREIGN KEY (`Order_idRequest` , `Ordert_Client_idCliente`)
    REFERENCES `ecommerce`.`Order` (`idOrder` , `Client_idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Request_has_Product_Product1`
    FOREIGN KEY (`Order_idProduct`)
    REFERENCES `ecommerce`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Address` (
  `Client_idCliente` INT NOT NULL,
  `Public_Place` VARCHAR(45) NULL,
  `Number` VARCHAR(10) NULL,
  `Complement` VARCHAR(45) NULL,
  `District` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `CEP` VARCHAR(8) NULL,
  `Padrao` BLOB NULL,
  `Address_Type_id Address_Type` INT NOT NULL,
  `Order_idOrder` INT NOT NULL,
  `Order_Client_idCliente` INT NOT NULL,
  INDEX `fk_Endereco_Client1_idx` (`Client_idCliente` ASC) VISIBLE,
  INDEX `fk_Endereco_Tipo_Endereco1_idx` (`Address_Type_id Address_Type` ASC) VISIBLE,
  INDEX `fk_Endereco_Order1_idx` (`Order_idOrder` ASC, `Order_Client_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Endereco_Client1`
    FOREIGN KEY (`Client_idCliente`)
    REFERENCES `ecommerce`.`Client` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_Tipo_Endereco1`
    FOREIGN KEY (`Address_Type_id Address_Type`)
    REFERENCES `ecommerce`.`Address_Type` (`idAddress_Type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Endereco_Order1`
    FOREIGN KEY (`Order_idOrder` , `Order_Client_idCliente`)
    REFERENCES `ecommerce`.`Order` (`idOrder` , `Client_idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`ClientCards` (
  `idClientCards` INT NOT NULL,
  `CardNumber` VARCHAR(45) NOT NULL,
  `CardName` VARCHAR(45) NOT NULL,
  `Experation` VARCHAR(45) NOT NULL,
  `Active` TINYINT NOT NULL,
  `Date_Start` DATETIME NOT NULL,
  `Date_End` DATETIME NULL,
  `Client_idCliente` INT NOT NULL,
  `Order_has_PaymentType_Order_idOrder` INT NOT NULL,
  `Order_has_PaymentType_Order_Client_idCliente` INT NOT NULL,
  `Order_has_PaymentType_PaymentType_idPaymentType` INT NOT NULL,
  PRIMARY KEY (`idClientCards`),
  INDEX `fk_ClientCards_Client1_idx` (`Client_idCliente` ASC) VISIBLE,
  INDEX `fk_ClientCards_Order_has_PaymentType1_idx` (`Order_has_PaymentType_Order_idOrder` ASC, `Order_has_PaymentType_Order_Client_idCliente` ASC, `Order_has_PaymentType_PaymentType_idPaymentType` ASC) VISIBLE,
  CONSTRAINT `fk_ClientCards_Client1`
    FOREIGN KEY (`Client_idCliente`)
    REFERENCES `ecommerce`.`Client` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ClientCards_Order_has_PaymentType1`
    FOREIGN KEY (`Order_has_PaymentType_Order_idOrder` , `Order_has_PaymentType_Order_Client_idCliente` , `Order_has_PaymentType_PaymentType_idPaymentType`)
    REFERENCES `ecommerce`.`Order_has_PaymentType` (`Order_idOrder` , `Order_Client_idCliente` , `PaymentType_idPaymentType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ecommerce`.`Delivery` (
  `idDelivery` INT NOT NULL,
  `Order_idOrder` INT NOT NULL,
  `Order_Client_idCliente` INT NOT NULL,
  `TrakingCode` VARCHAR(45) NOT NULL,
  `Date` DATETIME NOT NULL,
  `Status_idOrderStatus` INT NOT NULL,
  PRIMARY KEY (`idDelivery`, `Order_idOrder`, `Order_Client_idCliente`),
  INDEX `fk_Delivery_Order1_idx` (`Order_idOrder` ASC, `Order_Client_idCliente` ASC) VISIBLE,
  INDEX `fk_Delivery_Status1_idx` (`Status_idOrderStatus` ASC) VISIBLE,
  CONSTRAINT `fk_Delivery_Order1`
    FOREIGN KEY (`Order_idOrder` , `Order_Client_idCliente`)
    REFERENCES `ecommerce`.`Order` (`idOrder` , `Client_idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Delivery_Status1`
    FOREIGN KEY (`Status_idOrderStatus`)
    REFERENCES `ecommerce`.`Status` (`idOrderStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
