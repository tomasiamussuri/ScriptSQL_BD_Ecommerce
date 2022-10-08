-- Script de criação de tableas: CATEGORY, PRODUCT, PROVIDER, INVENTORY, PRODUCT_HAS_INVENTORY, PROVIDER_HAS_PRODUCT, CLIENT   

INSERT INTO `ecommerce`.`category` (`idCategory`, `Descrição`)
VALUES ('1', 'TV'),
		('2', 'Notebook'),
        ('3', 'Geladeira'),
        ('4', 'Fogao');
        
INSERT INTO `ecommerce`.`product` (`idProduct`, `Description`, `Category`)
VALUES ('1', 'Smart TV 42 polegadas', '1'),
		('2', 'Notebook 13 polegadas 256GB', '2'),
        ('3', 'Geladeira Frost Free 397L Inverse 220v', '3'),
        ('4', 'Fogao Inducao 4 bocas 110v', '4');

INSERT INTO `ecommerce`.`provider` (`idProvider`, `Name`, `Identification`, `ProviderType`, `Address`, `Phone`)
VALUES ('1', 'Dell', '00357964000135', 'J', 'Av Paulista, 1290, providerBela Vista, Sao Paulo, SP, 01324-365', '1133269540'),
		('2', 'Brastemp', '00357964000365', 'J', 'Av Nove de Julho, 111, Bela Vista, Sao Paulo, SP, 00125-003', '1133314000'),
        ('3', 'Electrolux', '00731660000799', 'J', 'Av Rebouças, 77, Jardim Paulista, Sao Paulo, SP, 04622-305', '1135770000'),
        ('4', 'Fischer', '10596334002400', 'J', 'R Alexandre Levi, 964, Cambuci, Sao Paulo, SP, 01530-010', '1146511200'),
        ('5', 'Sony', '01037864005751', 'J', 'Av do Estado, 6578, Centro, Sao Paulo, SP, 09947-001', '1135781234');

INSERT INTO `ecommerce`.`inventory` (`idInventory`, `Local`)
VALUES ('1', 'Centro - SP'),
		('2', 'Bragança àulista - SP');

INSERT INTO `ecommerce`.`product_has_inventory` (`Product_idProduct`, `Inventory_idInventory`, `Quantity`)
VALUES ('1', '1', '7'),
		('2', '1', '5'),
        ('3', '1', '10'),
        ('4', '2', '4');

INSERT INTO `ecommerce`.`provider_has_product` (`Provider_idProvider`, `Product_idProduct`)
VALUES ('1', '2'),
		('2', '3'),
        ('3', '3'),
        ('4', '4');

