-- Script de criação de tableas: BANK, BANKACCOUNT, ASSIGNOR, PAYMENTTYPE, ADDRESS_TYPE, STATUS, CLIENT   

INSERT INTO `ecommerce`.`bank` (`idBank`, `Code`, `Description`)
VALUES ('1', '001', 'BB'),
		('2', '341', 'ITAU');

INSERT INTO `ecommerce`.`bankaccount` (`idBankAccount`, `Agency`, `Number`, `Date_Start`, `Date_End`, `Bank_idBank`)
VALUES ('1', '1234', '01234567', '20220102', '20991231', '1'),
		('2', '7009', '023490', '20220102', '20991231', '2');

INSERT INTO `ecommerce`.`address_type` (`idAddress_Type`, `Description`)
VALUES ('1', 'PRINCIPAL'),
		('2', 'ENTREGA');
        
INSERT INTO `ecommerce`.`paymenttype` (`idPaymentType`, `Description`)
VALUES ('1', 'BOLETO BANCARIO'),
		('2', 'CARTAO DE CREDITO'),
		('3', 'PIX');

INSERT INTO `ecommerce`.`assignor` (`idAssignor`, `Description`, `OurNumber_Start`, `OurNumber_Emd`, `Wallet`, `Date_Start`, `Date_End`, `BankAccount_idBankAccount`, `BankAccount_Bank_idBank`, `PaymentType_idPaymentType`)
VALUES ('1', 'BOLETO BANCARIO', '0000000000', '9999999999', '123', '20220102', '20991231', '1', '1', '1'),
		('2', 'VISA', '0000000000', '9999999999', '000 ', '20220102', '20991231', '1', '1', '2'),
		('3', 'MASTERCARD', '0000000000', '9999999999', '000', '20220102', '20991231', '2', '2', '2'),
        ('4', 'PIX', '0000000000', '9999999999', '000', '20220102', '20991231', '2', '2', '3');

INSERT INTO `ecommerce`.`status` (`idOrderStatus`, `Description`, `Active`)
VALUES ('1', 'CANCELAMENTO', 'S'),
		('2', 'EM PROCESSAMENTO', 'S'),
        ('3', 'PAGAMENTO APROVADO', 'S'),
        ('4', 'EM SEPARACAO', 'S'),
        ('5', 'EM ROTA COM A TRANSPORTADORA', 'S'),
        ('6', 'ENTREGUE', 'S');

INSERT INTO `ecommerce`.`client` (`idCliente`, `Name`, `Identification`, `PeopleType`, `Phone`)
VALUES ('1', 'TOMASIA OLIVEIRA DE ANDRADE', '62753894201', 'F', '11964578023'),
		('2', 'JOAO MACHADO SILVA', '42109538477', 'F', '21947225816'),
        ('3', 'ANA MARIA VIEIRA DE LIMA', '57100328465', 'F', '319986573410'),
        ('4', 'RODRIGO SANTOS DE AZEVEDO', '67481999230', 'F', '11998762525'),
        ('5', 'LUIZA GARCIA MATOS', '99002064485', 'F', '61981212399');




