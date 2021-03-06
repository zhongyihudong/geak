-- ----------------------------
--  Test Records of geak_company
-- ----------------------------
BEGIN;
INSERT INTO geak_company VALUES 
(1, '大南门店', '大南门', '大南门'), 
(2, '体育路店', '体育路', '体育路'), 
(3, '食品街店', '食品街', '食品街'), 
(4, '柳巷店', '柳巷', '柳巷'), 
(5, '长风店', '长风', '长风街'), 
(6, '千峰店', '千峰', '千峰路'),
(7, '极客工厂', '工厂', '极客工厂')
;
COMMIT;


-- ----------------------------
--  Test Records of geak_user
-- ----------------------------
BEGIN;
INSERT INTO geak_user VALUES ('1', '1', '麻文强', '15001276389', '', 'NORMAL', 1);
COMMIT;

-- ----------------------------
--  Test Records of geak_product
-- ----------------------------
BEGIN;
INSERT INTO geak_product VALUES 
(1, '猎人', '猎人', '密室门票', 'NORMAL', 68, 80, 1)
;
COMMIT;

-- ----------------------------
--  Test Records of geak_member
-- ----------------------------
BEGIN;
INSERT INTO geak_member VALUES 
(1, '麻文强', '麻文强', '15001276389', 'M', 'SUBSCRIBED', 'openid', 'unionid', 'head', '2016-06-01', '2016-06-01 00:00:00', 0, 0)
;
COMMIT;


-- ----------------------------
--  Test Records of geak_member_deposit
-- ----------------------------
BEGIN;
INSERT INTO geak_member_deposit VALUES 
(1, 100, 'OK', 'DEPOSIT', '201606010001', '充值100元', 'JSAPI', '192.168.1.1', '2016-06-01 00:00:00', '2016-06-01 00:00:00', 1, 'openid')
;
COMMIT;


-- ----------------------------
--  Test Records of geak_order
-- ----------------------------
BEGIN;
INSERT INTO geak_order VALUES 
(1, 100, 'OK', 1, 1, '麻文强', 'M', '15001276389', 5, '青年人,中年人', '猎人', 'source', 'note', '', '0', '', '2016-06-01 00:00:00', '2016-06-01 00:00:00', '2016-06-01 00:00:00', '2016-06-01 00:00:00', '2016-06-01 00:00:00')
;
INSERT INTO geak_order_payment VALUES (1, '现金', 68);
INSERT INTO geak_order_promotion VALUES (1, '打车券', 1, '');
INSERT INTO geak_order_product VALUES (1, 1, 5, 68);
COMMIT;

