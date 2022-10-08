-- Script de criação de tableas: ADDRESS, ORDER, ORDER_HAS_PRODUCT, DELIVERY, CLIENTCARDS, ORDER_HAS_PAYMENTTYPE  

INSERT INTO `ecommerce`.`address` (`idAddress`, `Client_idCliente`, `Public_Place`, `Number`, `Complement`, `District`, `City`, `UF`, `CEP`, `Padrao`, `Address_Type_id Address_Type`)
VALUES ('1','1', 'AVENIDA CARAVELAS', '250', '', 'PRAIA DO FRANCES', 'MARECHAL DEODORO', 'AL', '57160000', 'S', '1'),
		('2','2', 'QRSW QUADRA 01 BLOCO B7', '', 'APT 203', 'SUDOESTE', 'BRASILIA', 'DF', '70675127', 'S', '1'),
        ('3','3', 'RUA ALEXANDRE LEVI', '90', 'TORRE 02 APT 125', 'CAMBUCI', 'SAO PAULO', 'SP', '01520000', 'S', '1'),
        ('4','4', 'RUA TEIXEIRA DA SILVA', '630', 'APT 22', 'PARAISO', 'SAO PAULO', 'SP', '02314678', 'S', '1'),
        ('5','5', 'RUA DAS LARANJEIRAS', '33', 'APT 12', 'LARANJEIRAS', 'RIO DE JANEIRO', 'RJ', '21056789', 'S', '1');

INSERT INTO `ecommerce`.`order` (`idOrder`, `OrderDate`, `ExpectedDeliveryDate`, `DeliveryDate`, `Frete`, `Client_idCliente`, `Status_idOrderStatus`)
VALUES ('1', '20220215', '20220221', '20220219', '53.67', '1', '6'),
		('2', '20220324', '20220410', '20220422', '267.35', '4', '6'),
        ('3', '20220807', '20220811', '20220808', '0', '1', '1'),
        ('4', '20220912', '20220924', '20991231', '123.50', '2', '5'),
        ('5', '20220928', '20221011', '20991231', '99.20', '3', '5'); 

INSERT INTO `ecommerce`.`order_has_product` (`idOrder_has_Product`, `Order_idRequest`, `Order_Client_idCliente`, `Order_idProduct`, `Quantity`)
VALUES ('1', '1', '1', '4', '1'),
		('2', '2', '4', '3', '1'),
        ('3', '2', '4', '4', '1'),
        ('4', '3', '1', '2', '1'),
        ('5', '4', '2', '1', '1'),
        ('6', '4', '2', '4', '1'),
        ('7', '5', '3', '2', '1');


INSERT INTO `ecommerce`.`delivery` (`idDelivery`, `Order_idOrder`, `Order_Client_idCliente`, `TrakingCode`, `Date`, `Status_idOrderStatus`)
VALUES ('1', '1', '1', 'BR1254R8972YAL', '20220219', '6'),
		('2', '2', '4', 'BR6578125ER6AL', '20220422', '6'),
        ('3', '2', '4', 'BR6578125ER6AL', '20220422', '6'),
        ('4', '3', '1', 'BR67A28M070WAL', '20220808', '1'),
        ('5', '4', '2', 'BR927348D001AL', '20991231', '5'),
        ('6', '4', '2', 'BR927348D001AL', '20991231', '5'),
        ('7', '5', '3', 'BR961F33J702AL', '20991231', '5');

INSERT INTO `ecommerce`.`clientcards` (`idClientCards`, `CardNumber`, `CardName`, `Experation`, `Active`, `Date_Start`, `Date_End`, `Client_idCliente`, `Order_has_PaymentType_Order_idOrder`, `Order_has_PaymentType_Order_Client_idCliente`, `Order_has_PaymentType_PaymentType_idPaymentType`, `PaymentType_idPaymentType`)
VALUES ('1', '4700258519000427', 'VISA', '202705', 'T', '20220215', '20991231', '1', '1', '1', '2', '2'),
		('2', '6980121504870688', 'MASTERCARD', '202612', 'T', '20220928', '20991231', '3', '5', '3', '2', '2');


INSERT INTO `ecommerce`.`order_has_paymenttype` (`Order_idOrder`, `Order_Client_idCliente`, `PaymentType_idPaymentType`, `Value`, `BarCode`, `DigitableLine`, `OurNumber`, `Assignor_idAssignor`, `Assignor_BankAccount_idBankAccount`, `Assignor_BankAccount_Bank_idBank`)
VALUES ('1', '1', '2', '349.90', '', '', '', '1', '1', '1'),
		('2', '4', '1', '349.90', '23746921254892547626314', '0012539756218456630025000000000034990', '12354889', '1', '1', '1'),
        ('1', '1', '2', '349.90', '23874212563489547625634', '0012539756218456630025000000000034990', '12354889', '1', '1', '1');







