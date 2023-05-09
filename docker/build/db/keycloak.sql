# ************************************************************
# Sequel Ace SQL dump
# Version 20029
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 0.0.0.0 (MySQL 5.5.5-10.6.5-MariaDB-1:10.6.5+maria~focal)
# Database: keycloak
# Generation Time: 2022-03-08 07:38:58 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ADMIN_EVENT_ENTITY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;

CREATE TABLE `ADMIN_EVENT_ENTITY` (
                                      `ID` varchar(36) NOT NULL,
                                      `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
                                      `REALM_ID` varchar(255) DEFAULT NULL,
                                      `OPERATION_TYPE` varchar(255) DEFAULT NULL,
                                      `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
                                      `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
                                      `AUTH_USER_ID` varchar(255) DEFAULT NULL,
                                      `IP_ADDRESS` varchar(255) DEFAULT NULL,
                                      `RESOURCE_PATH` text DEFAULT NULL,
                                      `REPRESENTATION` text DEFAULT NULL,
                                      `ERROR` varchar(255) DEFAULT NULL,
                                      `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
                                      PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table ASSOCIATED_POLICY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;

CREATE TABLE `ASSOCIATED_POLICY` (
                                     `POLICY_ID` varchar(36) NOT NULL,
                                     `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
                                     PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
                                     KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
                                     CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
                                     CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table AUTHENTICATION_EXECUTION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;

CREATE TABLE `AUTHENTICATION_EXECUTION` (
                                            `ID` varchar(36) NOT NULL,
                                            `ALIAS` varchar(255) DEFAULT NULL,
                                            `AUTHENTICATOR` varchar(36) DEFAULT NULL,
                                            `REALM_ID` varchar(36) DEFAULT NULL,
                                            `FLOW_ID` varchar(36) DEFAULT NULL,
                                            `REQUIREMENT` int(11) DEFAULT NULL,
                                            `PRIORITY` int(11) DEFAULT NULL,
                                            `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
                                            `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
                                            `AUTH_CONFIG` varchar(36) DEFAULT NULL,
                                            PRIMARY KEY (`ID`),
                                            KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
                                            KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
                                            CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
                                            CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;

INSERT INTO `AUTHENTICATION_EXECUTION` (`ID`, `ALIAS`, `AUTHENTICATOR`, `REALM_ID`, `FLOW_ID`, `REQUIREMENT`, `PRIORITY`, `AUTHENTICATOR_FLOW`, `AUTH_FLOW_ID`, `AUTH_CONFIG`)
VALUES
('09694473-96ba-403b-9b85-62c7406263e6',NULL,NULL,'master','f2f8832c-fa81-43bf-add6-043f75c8112e',0,20,b'1','c6a4e114-42ba-4ea9-8d4b-c33962548d1b',NULL),
('0ff5f41d-a7d7-4166-8c2d-372e5a4c562d',NULL,'docker-http-basic-authenticator','master','03775cdc-1c4b-4f4f-814b-5b50a05d61e0',0,10,b'0',NULL,NULL),
('107cfacb-2184-4cd3-a12a-87a013da7561',NULL,'reset-password','master','a5b17112-cca7-42b2-bf47-dc8aa9612b1c',0,30,b'0',NULL,NULL),
('138c1244-a7da-4789-8cfa-38818f9fc479',NULL,'idp-review-profile','master','8cc124eb-46ef-43ac-b88a-2a641d6faf89',0,10,b'0',NULL,'3bd01173-e0fd-4c6c-aa96-0b65a30897a3'),
('14e05715-0d9a-40f5-90cb-48f6fb90ddba',NULL,'direct-grant-validate-password','master','fc49b494-8d74-4a5d-b9f0-f096c641f72a',0,20,b'0',NULL,NULL),
('192bcb99-fd92-406b-a030-c201ab201a12',NULL,'auth-spnego','master','c6a4e114-42ba-4ea9-8d4b-c33962548d1b',3,30,b'0',NULL,NULL),
('1cd45e6d-6a6e-45ca-b990-77871562a20e',NULL,'auth-spnego','master','e9ab4e66-32e7-4a00-a10a-43ece6fa323b',3,20,b'0',NULL,NULL),
('2631a99c-db5e-4685-9d73-7b3c61e66c3e',NULL,'auth-otp-form','master','9d6cb1a4-8da6-4adb-8aaf-b90108fd316a',0,20,b'0',NULL,NULL),
('267479d6-db34-469d-8b66-bcb719d2e6fd',NULL,'client-secret','master','69b91c80-8f71-46a8-bc8e-47fcaf7acc19',2,10,b'0',NULL,NULL),
('328ae622-b367-4b3b-81d2-ff69dc59c5f7',NULL,'direct-grant-validate-username','master','fc49b494-8d74-4a5d-b9f0-f096c641f72a',0,10,b'0',NULL,NULL),
('3608e09a-fed9-454f-bb70-183db458f135',NULL,'client-secret-jwt','master','69b91c80-8f71-46a8-bc8e-47fcaf7acc19',2,30,b'0',NULL,NULL),
('3f52bcd4-061a-4e69-99fc-3e6162a2acad',NULL,'client-jwt','master','69b91c80-8f71-46a8-bc8e-47fcaf7acc19',2,20,b'0',NULL,NULL),
('411ea468-06de-45fd-9771-f892c67479cc',NULL,'registration-profile-action','master','f833134a-d3c7-49b9-a8c9-7c0c0e836893',0,40,b'0',NULL,NULL),
('45fb3404-f103-4a65-ae42-0dfda82eae72',NULL,'auth-cookie','master','e9ab4e66-32e7-4a00-a10a-43ece6fa323b',2,10,b'0',NULL,NULL),
('47c727fe-3a35-4e67-9fde-fe577a60d634',NULL,'identity-provider-redirector','master','e9ab4e66-32e7-4a00-a10a-43ece6fa323b',2,25,b'0',NULL,NULL),
('50e1e7f1-d4aa-41e1-a7ca-862034468ef6',NULL,'registration-user-creation','master','f833134a-d3c7-49b9-a8c9-7c0c0e836893',0,20,b'0',NULL,NULL),
('61bb2ed3-3fe2-4740-9347-e7eb49c94697',NULL,'idp-confirm-link','master','6d3cfa46-ce00-4ef7-9846-f1067ea720da',0,10,b'0',NULL,NULL),
('63bc1ccd-2db1-46a7-8ea6-0686586b8552',NULL,'conditional-user-configured','master','e91f3698-cc37-48f7-ace9-7366c30bc82b',0,10,b'0',NULL,NULL),
('66323b03-5148-4745-a9a6-8ae17857ae6d',NULL,NULL,'master','a5b17112-cca7-42b2-bf47-dc8aa9612b1c',1,40,b'1','a1796c46-a489-4e4a-899c-a504734753c0',NULL),
('6adb6dbe-2dbd-4bb1-ac78-df1c8cb065ed',NULL,NULL,'master','acbdca98-fd5b-4f79-af28-d4e634862ea1',2,20,b'1','f41d81aa-ffe7-4a0c-a429-c9b639432198',NULL),
('6c1c229e-cc75-4c4f-b0c6-2cbc4c9066cf',NULL,NULL,'master','e3795c9b-6864-451d-85cf-f96aaf92ef09',1,20,b'1','9f077dc3-70d0-41ed-a130-eee13af76661',NULL),
('6ffc164b-83bd-4178-91db-e1a161f09d64',NULL,'http-basic-authenticator','master','df25716c-2285-4c67-a810-caf087466795',0,10,b'0',NULL,NULL),
('7216ec18-7ce3-4ea6-88e3-de11cfd204ee',NULL,'registration-page-form','master','661121d3-9f9c-4c89-b44e-3caccbfa9f4b',0,10,b'1','f833134a-d3c7-49b9-a8c9-7c0c0e836893',NULL),
('76560f65-6e59-4433-99b4-76fab4298e80',NULL,'registration-password-action','master','f833134a-d3c7-49b9-a8c9-7c0c0e836893',0,50,b'0',NULL,NULL),
('77309d5d-d1ac-443d-8733-3d27780ed14a',NULL,NULL,'master','8cc124eb-46ef-43ac-b88a-2a641d6faf89',0,20,b'1','c664420f-ec15-4140-8828-2b167b88d084',NULL),
('796b8284-6581-4d97-8c2a-eacc51ed1deb',NULL,'auth-otp-form','master','9f077dc3-70d0-41ed-a130-eee13af76661',0,20,b'0',NULL,NULL),
('8152b415-de8a-4b83-9404-3e218758839c',NULL,NULL,'master','6d3cfa46-ce00-4ef7-9846-f1067ea720da',0,20,b'1','acbdca98-fd5b-4f79-af28-d4e634862ea1',NULL),
('87153e46-91de-4a29-9b07-a12a68c89eee',NULL,'client-x509','master','69b91c80-8f71-46a8-bc8e-47fcaf7acc19',2,40,b'0',NULL,NULL),
('87abf2b5-f6c7-4378-971f-8744f1fd1706',NULL,'conditional-user-configured','master','9d6cb1a4-8da6-4adb-8aaf-b90108fd316a',0,10,b'0',NULL,NULL),
('96e4428c-adb5-495f-b9f0-9bb3093423a2',NULL,'registration-recaptcha-action','master','f833134a-d3c7-49b9-a8c9-7c0c0e836893',3,60,b'0',NULL,NULL),
('97dfb213-5526-4074-8fca-efa9c73cda50',NULL,'idp-username-password-form','master','f41d81aa-ffe7-4a0c-a429-c9b639432198',0,10,b'0',NULL,NULL),
('9a3ab11e-15d5-4576-ae5a-9df3302e5c8a',NULL,'idp-email-verification','master','acbdca98-fd5b-4f79-af28-d4e634862ea1',2,10,b'0',NULL,NULL),
('a44f9cf9-a93e-4e67-8f71-a1d78e277b89',NULL,'auth-username-password-form','master','e3795c9b-6864-451d-85cf-f96aaf92ef09',0,10,b'0',NULL,NULL),
('ab3b83aa-f45e-44c7-8f7b-8b5e6c855420',NULL,NULL,'master','e9ab4e66-32e7-4a00-a10a-43ece6fa323b',2,30,b'1','e3795c9b-6864-451d-85cf-f96aaf92ef09',NULL),
('b7433fbf-f12b-4f6e-8e70-348a0bfc1c22',NULL,'idp-create-user-if-unique','master','c664420f-ec15-4140-8828-2b167b88d084',2,10,b'0',NULL,'cf4111a4-c011-40a4-b697-b915e8ccecec'),
('ba38c247-a696-43a3-a9a2-087df9f58eb8',NULL,'reset-credential-email','master','a5b17112-cca7-42b2-bf47-dc8aa9612b1c',0,20,b'0',NULL,NULL),
('bc8ae644-e6bd-45a6-abb0-4155972960e3',NULL,'basic-auth-otp','master','c6a4e114-42ba-4ea9-8d4b-c33962548d1b',3,20,b'0',NULL,NULL),
('c71ca041-1a65-409b-a3c1-0656df1e4073',NULL,'direct-grant-validate-otp','master','e91f3698-cc37-48f7-ace9-7366c30bc82b',0,20,b'0',NULL,NULL),
('cceb407f-0791-46a7-aa5d-a16283373333',NULL,NULL,'master','fc49b494-8d74-4a5d-b9f0-f096c641f72a',1,30,b'1','e91f3698-cc37-48f7-ace9-7366c30bc82b',NULL),
('d2537bb2-035a-435b-913c-3c68fc061a66',NULL,NULL,'master','f41d81aa-ffe7-4a0c-a429-c9b639432198',1,20,b'1','9d6cb1a4-8da6-4adb-8aaf-b90108fd316a',NULL),
('dd297d8c-2eef-4782-b707-0ebbc3043dac',NULL,'no-cookie-redirect','master','f2f8832c-fa81-43bf-add6-043f75c8112e',0,10,b'0',NULL,NULL),
('e22a61de-6e89-4564-b6c6-7f4d7a46ddb1',NULL,'conditional-user-configured','master','9f077dc3-70d0-41ed-a130-eee13af76661',0,10,b'0',NULL,NULL),
('ec1bef43-e67d-43ae-99a4-2d663a75b121',NULL,'conditional-user-configured','master','a1796c46-a489-4e4a-899c-a504734753c0',0,10,b'0',NULL,NULL),
('f2ae8d97-1c54-46e9-9358-73378ab330ce',NULL,NULL,'master','c664420f-ec15-4140-8828-2b167b88d084',2,20,b'1','6d3cfa46-ce00-4ef7-9846-f1067ea720da',NULL),
('f4b5c7ef-371a-419e-aee1-a6a77d0cde9f',NULL,'basic-auth','master','c6a4e114-42ba-4ea9-8d4b-c33962548d1b',0,10,b'0',NULL,NULL),
('f855adad-139c-4174-b9d9-02777c6459e1',NULL,'reset-credentials-choose-user','master','a5b17112-cca7-42b2-bf47-dc8aa9612b1c',0,10,b'0',NULL,NULL),
('fd4a878e-f559-49d8-bfe8-69a6393064a1',NULL,'reset-otp','master','a1796c46-a489-4e4a-899c-a504734753c0',0,20,b'0',NULL,NULL);

/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table AUTHENTICATION_FLOW
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;

CREATE TABLE `AUTHENTICATION_FLOW` (
                                       `ID` varchar(36) NOT NULL,
                                       `ALIAS` varchar(255) DEFAULT NULL,
                                       `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
                                       `REALM_ID` varchar(36) DEFAULT NULL,
                                       `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
                                       `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
                                       `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
                                       PRIMARY KEY (`ID`),
                                       KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
                                       CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;

INSERT INTO `AUTHENTICATION_FLOW` (`ID`, `ALIAS`, `DESCRIPTION`, `REALM_ID`, `PROVIDER_ID`, `TOP_LEVEL`, `BUILT_IN`)
VALUES
('03775cdc-1c4b-4f4f-814b-5b50a05d61e0','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',b'1',b'1'),
('661121d3-9f9c-4c89-b44e-3caccbfa9f4b','registration','registration flow','master','basic-flow',b'1',b'1'),
('69b91c80-8f71-46a8-bc8e-47fcaf7acc19','clients','Base authentication for clients','master','client-flow',b'1',b'1'),
('6d3cfa46-ce00-4ef7-9846-f1067ea720da','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',b'0',b'1'),
('8cc124eb-46ef-43ac-b88a-2a641d6faf89','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',b'1',b'1'),
('9d6cb1a4-8da6-4adb-8aaf-b90108fd316a','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',b'0',b'1'),
('9f077dc3-70d0-41ed-a130-eee13af76661','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',b'0',b'1'),
('a1796c46-a489-4e4a-899c-a504734753c0','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',b'0',b'1'),
('a5b17112-cca7-42b2-bf47-dc8aa9612b1c','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',b'1',b'1'),
('acbdca98-fd5b-4f79-af28-d4e634862ea1','Account verification options','Method with which to verity the existing account','master','basic-flow',b'0',b'1'),
('c664420f-ec15-4140-8828-2b167b88d084','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',b'0',b'1'),
('c6a4e114-42ba-4ea9-8d4b-c33962548d1b','Authentication Options','Authentication options.','master','basic-flow',b'0',b'1'),
('df25716c-2285-4c67-a810-caf087466795','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',b'1',b'1'),
('e3795c9b-6864-451d-85cf-f96aaf92ef09','forms','Username, password, otp and other auth forms.','master','basic-flow',b'0',b'1'),
('e91f3698-cc37-48f7-ace9-7366c30bc82b','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',b'0',b'1'),
('e9ab4e66-32e7-4a00-a10a-43ece6fa323b','browser','browser based authentication','master','basic-flow',b'1',b'1'),
('f2f8832c-fa81-43bf-add6-043f75c8112e','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',b'1',b'1'),
('f41d81aa-ffe7-4a0c-a429-c9b639432198','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',b'0',b'1'),
('f833134a-d3c7-49b9-a8c9-7c0c0e836893','registration form','registration form','master','form-flow',b'0',b'1'),
('fc49b494-8d74-4a5d-b9f0-f096c641f72a','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',b'1',b'1');

/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table AUTHENTICATOR_CONFIG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;

CREATE TABLE `AUTHENTICATOR_CONFIG` (
                                        `ID` varchar(36) NOT NULL,
                                        `ALIAS` varchar(255) DEFAULT NULL,
                                        `REALM_ID` varchar(36) DEFAULT NULL,
                                        PRIMARY KEY (`ID`),
                                        KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
                                        CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;

INSERT INTO `AUTHENTICATOR_CONFIG` (`ID`, `ALIAS`, `REALM_ID`)
VALUES
('3bd01173-e0fd-4c6c-aa96-0b65a30897a3','review profile config','master'),
('cf4111a4-c011-40a4-b697-b915e8ccecec','create unique user config','master');

/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table AUTHENTICATOR_CONFIG_ENTRY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;

CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
                                              `AUTHENTICATOR_ID` varchar(36) NOT NULL,
                                              `VALUE` longtext DEFAULT NULL,
                                              `NAME` varchar(255) NOT NULL,
                                              PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;

INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` (`AUTHENTICATOR_ID`, `VALUE`, `NAME`)
VALUES
('3bd01173-e0fd-4c6c-aa96-0b65a30897a3','missing','update.profile.on.first.login'),
('cf4111a4-c011-40a4-b697-b915e8ccecec','false','require.password.update.after.registration');

/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table BROKER_LINK
# ------------------------------------------------------------

DROP TABLE IF EXISTS `BROKER_LINK`;

CREATE TABLE `BROKER_LINK` (
                               `IDENTITY_PROVIDER` varchar(255) NOT NULL,
                               `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
                               `REALM_ID` varchar(36) NOT NULL,
                               `BROKER_USER_ID` varchar(255) DEFAULT NULL,
                               `BROKER_USERNAME` varchar(255) DEFAULT NULL,
                               `TOKEN` text DEFAULT NULL,
                               `USER_ID` varchar(255) NOT NULL,
                               PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table CLIENT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLIENT`;

CREATE TABLE `CLIENT` (
                          `ID` varchar(36) NOT NULL,
                          `ENABLED` bit(1) NOT NULL DEFAULT b'0',
                          `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
                          `CLIENT_ID` varchar(255) DEFAULT NULL,
                          `NOT_BEFORE` int(11) DEFAULT NULL,
                          `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
                          `SECRET` varchar(255) DEFAULT NULL,
                          `BASE_URL` varchar(255) DEFAULT NULL,
                          `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
                          `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
                          `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
                          `REALM_ID` varchar(36) DEFAULT NULL,
                          `PROTOCOL` varchar(255) DEFAULT NULL,
                          `NODE_REREG_TIMEOUT` int(11) DEFAULT 0,
                          `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
                          `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
                          `NAME` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
                          `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                          `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
                          `ROOT_URL` varchar(255) DEFAULT NULL,
                          `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
                          `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
                          `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
                          `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                          `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                          `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
                          PRIMARY KEY (`ID`),
                          UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
                          KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;

INSERT INTO `CLIENT` (`ID`, `ENABLED`, `FULL_SCOPE_ALLOWED`, `CLIENT_ID`, `NOT_BEFORE`, `PUBLIC_CLIENT`, `SECRET`, `BASE_URL`, `BEARER_ONLY`, `MANAGEMENT_URL`, `SURROGATE_AUTH_REQUIRED`, `REALM_ID`, `PROTOCOL`, `NODE_REREG_TIMEOUT`, `FRONTCHANNEL_LOGOUT`, `CONSENT_REQUIRED`, `NAME`, `SERVICE_ACCOUNTS_ENABLED`, `CLIENT_AUTHENTICATOR_TYPE`, `ROOT_URL`, `DESCRIPTION`, `REGISTRATION_TOKEN`, `STANDARD_FLOW_ENABLED`, `IMPLICIT_FLOW_ENABLED`, `DIRECT_ACCESS_GRANTS_ENABLED`, `ALWAYS_DISPLAY_IN_CONSOLE`)
VALUES
('117e64fb-62c0-4c00-89e3-1adc91ab4ff0',b'1',b'0','security-admin-console',0,b'1',NULL,'/admin/master/console/',b'0',NULL,b'0','master','openid-connect',0,b'0',b'0','${client_security-admin-console}',b'0','client-secret','${authAdminUrl}',NULL,NULL,b'1',b'0',b'0',b'0'),
('2232cc79-35ab-45ac-919a-97e7a9992854',b'1',b'1','reparcar-connect',0,b'0','78f16986-d1f3-4861-a5bc-300837f0b0b5',NULL,b'0',NULL,b'0','master','openid-connect',-1,b'0',b'0',NULL,b'1','client-secret',NULL,NULL,NULL,b'1',b'0',b'1',b'0'),
('759b7f0d-b50c-480d-a2b8-13957e29fcd9',b'1',b'0','broker',0,b'0',NULL,NULL,b'1',NULL,b'0','master','openid-connect',0,b'0',b'0','${client_broker}',b'0','client-secret',NULL,NULL,NULL,b'1',b'0',b'0',b'0'),
('985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1',b'0','master-realm',0,b'0',NULL,NULL,b'1',NULL,b'0','master',NULL,0,b'0',b'0','master Realm',b'0','client-secret',NULL,NULL,NULL,b'1',b'0',b'0',b'0'),
('9ed8555f-966d-4ae7-bf03-0ad62de2ccde',b'1',b'0','account-console',0,b'1',NULL,'/realms/master/account/',b'0',NULL,b'0','master','openid-connect',0,b'0',b'0','${client_account-console}',b'0','client-secret','${authBaseUrl}',NULL,NULL,b'1',b'0',b'0',b'0'),
('9f6b7b2f-aa64-4caa-a400-bf55a2c781a0',b'1',b'0','admin-cli',0,b'1',NULL,NULL,b'0',NULL,b'0','master','openid-connect',0,b'0',b'0','${client_admin-cli}',b'0','client-secret',NULL,NULL,NULL,b'0',b'0',b'1',b'0'),
('ce9d3a13-6e02-43b7-8082-e57755d4f987',b'1',b'0','account',0,b'1',NULL,'/realms/master/account/',b'0',NULL,b'0','master','openid-connect',0,b'0',b'0','${client_account}',b'0','client-secret','${authBaseUrl}',NULL,NULL,b'1',b'0',b'0',b'0'),
('da177eb1-c9d3-4692-bcad-62189329a12a',b'1',b'1','confidential-connect',0,b'0','5151ba0d-fe30-4972-9b64-7fdbe8651e09',NULL,b'1',NULL,b'0','master','openid-connect',-1,b'0',b'0',NULL,b'0','client-secret',NULL,NULL,NULL,b'1',b'0',b'1',b'0');

/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CLIENT_ATTRIBUTES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;

CREATE TABLE `CLIENT_ATTRIBUTES` (
                                     `CLIENT_ID` varchar(36) NOT NULL,
                                     `VALUE` text DEFAULT NULL,
                                     `NAME` varchar(255) NOT NULL,
                                     PRIMARY KEY (`CLIENT_ID`,`NAME`),
                                     KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
                                     CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;

INSERT INTO `CLIENT_ATTRIBUTES` (`CLIENT_ID`, `VALUE`, `NAME`)
VALUES
('117e64fb-62c0-4c00-89e3-1adc91ab4ff0','S256','pkce.code.challenge.method'),
('2232cc79-35ab-45ac-919a-97e7a9992854','604800','access.token.lifespan'),
('2232cc79-35ab-45ac-919a-97e7a9992854','false','backchannel.logout.revoke.offline.tokens'),
('2232cc79-35ab-45ac-919a-97e7a9992854','true','backchannel.logout.session.required'),
('2232cc79-35ab-45ac-919a-97e7a9992854','false','client_credentials.use_refresh_token'),
('2232cc79-35ab-45ac-919a-97e7a9992854','false','display.on.consent.screen'),
('2232cc79-35ab-45ac-919a-97e7a9992854','false','exclude.session.state.from.auth.response'),
('2232cc79-35ab-45ac-919a-97e7a9992854','false','oauth2.device.authorization.grant.enabled'),
('2232cc79-35ab-45ac-919a-97e7a9992854','false','oidc.ciba.grant.enabled'),
('2232cc79-35ab-45ac-919a-97e7a9992854','false','saml.artifact.binding'),
('2232cc79-35ab-45ac-919a-97e7a9992854','false','saml.assertion.signature'),
('2232cc79-35ab-45ac-919a-97e7a9992854','false','saml.authnstatement'),
('2232cc79-35ab-45ac-919a-97e7a9992854','false','saml.client.signature'),
('2232cc79-35ab-45ac-919a-97e7a9992854','false','saml.encrypt'),
('2232cc79-35ab-45ac-919a-97e7a9992854','false','saml.force.post.binding'),
('2232cc79-35ab-45ac-919a-97e7a9992854','false','saml.multivalued.roles'),
('2232cc79-35ab-45ac-919a-97e7a9992854','false','saml.onetimeuse.condition'),
('2232cc79-35ab-45ac-919a-97e7a9992854','false','saml.server.signature'),
('2232cc79-35ab-45ac-919a-97e7a9992854','false','saml.server.signature.keyinfo.ext'),
('2232cc79-35ab-45ac-919a-97e7a9992854','false','saml_force_name_id_format'),
('2232cc79-35ab-45ac-919a-97e7a9992854','false','tls.client.certificate.bound.access.tokens'),
('2232cc79-35ab-45ac-919a-97e7a9992854','true','use.refresh.tokens'),
('9ed8555f-966d-4ae7-bf03-0ad62de2ccde','S256','pkce.code.challenge.method'),
('da177eb1-c9d3-4692-bcad-62189329a12a','false','backchannel.logout.revoke.offline.tokens'),
('da177eb1-c9d3-4692-bcad-62189329a12a','true','backchannel.logout.session.required'),
('da177eb1-c9d3-4692-bcad-62189329a12a','false','client_credentials.use_refresh_token'),
('da177eb1-c9d3-4692-bcad-62189329a12a','false','display.on.consent.screen'),
('da177eb1-c9d3-4692-bcad-62189329a12a','false','exclude.session.state.from.auth.response'),
('da177eb1-c9d3-4692-bcad-62189329a12a','false','oauth2.device.authorization.grant.enabled'),
('da177eb1-c9d3-4692-bcad-62189329a12a','false','oidc.ciba.grant.enabled'),
('da177eb1-c9d3-4692-bcad-62189329a12a','false','saml.artifact.binding'),
('da177eb1-c9d3-4692-bcad-62189329a12a','false','saml.assertion.signature'),
('da177eb1-c9d3-4692-bcad-62189329a12a','false','saml.authnstatement'),
('da177eb1-c9d3-4692-bcad-62189329a12a','false','saml.client.signature'),
('da177eb1-c9d3-4692-bcad-62189329a12a','false','saml.encrypt'),
('da177eb1-c9d3-4692-bcad-62189329a12a','false','saml.force.post.binding'),
('da177eb1-c9d3-4692-bcad-62189329a12a','false','saml.multivalued.roles'),
('da177eb1-c9d3-4692-bcad-62189329a12a','false','saml.onetimeuse.condition'),
('da177eb1-c9d3-4692-bcad-62189329a12a','false','saml.server.signature'),
('da177eb1-c9d3-4692-bcad-62189329a12a','false','saml.server.signature.keyinfo.ext'),
('da177eb1-c9d3-4692-bcad-62189329a12a','false','saml_force_name_id_format'),
('da177eb1-c9d3-4692-bcad-62189329a12a','false','tls.client.certificate.bound.access.tokens'),
('da177eb1-c9d3-4692-bcad-62189329a12a','true','use.refresh.tokens');

/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CLIENT_AUTH_FLOW_BINDINGS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;

CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
                                             `CLIENT_ID` varchar(36) NOT NULL,
                                             `FLOW_ID` varchar(36) DEFAULT NULL,
                                             `BINDING_NAME` varchar(255) NOT NULL,
                                             PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table CLIENT_INITIAL_ACCESS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;

CREATE TABLE `CLIENT_INITIAL_ACCESS` (
                                         `ID` varchar(36) NOT NULL,
                                         `REALM_ID` varchar(36) NOT NULL,
                                         `TIMESTAMP` int(11) DEFAULT NULL,
                                         `EXPIRATION` int(11) DEFAULT NULL,
                                         `COUNT` int(11) DEFAULT NULL,
                                         `REMAINING_COUNT` int(11) DEFAULT NULL,
                                         PRIMARY KEY (`ID`),
                                         KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
                                         CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table CLIENT_NODE_REGISTRATIONS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;

CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
                                             `CLIENT_ID` varchar(36) NOT NULL,
                                             `VALUE` int(11) DEFAULT NULL,
                                             `NAME` varchar(255) NOT NULL,
                                             PRIMARY KEY (`CLIENT_ID`,`NAME`),
                                             CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table CLIENT_SCOPE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLIENT_SCOPE`;

CREATE TABLE `CLIENT_SCOPE` (
                                `ID` varchar(36) NOT NULL,
                                `NAME` varchar(255) DEFAULT NULL,
                                `REALM_ID` varchar(36) DEFAULT NULL,
                                `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
                                `PROTOCOL` varchar(255) DEFAULT NULL,
                                PRIMARY KEY (`ID`),
                                UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
                                KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;

INSERT INTO `CLIENT_SCOPE` (`ID`, `NAME`, `REALM_ID`, `DESCRIPTION`, `PROTOCOL`)
VALUES
('1dd2f0b5-8ce7-4caf-b792-330e5775fe9d','address','master','OpenID Connect built-in scope: address','openid-connect'),
('20dfc797-92f9-4017-bf89-57790cf810fd','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),
('21dfeb2b-7c55-477a-a3b4-5907b5ea7f0c','phone','master','OpenID Connect built-in scope: phone','openid-connect'),
('44ca6980-d0e4-4fee-ab54-da3818b9179a','good-service','master',NULL,'openid-connect'),
('47a235dc-8132-490a-af85-af56e0cb8e1c','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),
('73a3f96d-d0f7-4e59-8c97-ed38bf7f3332','email','master','OpenID Connect built-in scope: email','openid-connect'),
('7e256bab-e1e2-421c-b745-583795aa974a','role_list','master','SAML role list','saml'),
('e3b08470-7359-44e1-a665-e1d6a44623b5','profile','master','OpenID Connect built-in scope: profile','openid-connect'),
('ee3886d8-bbb3-44d0-806f-e2aa6b7a82aa','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),
('f81fe91a-e176-4f33-8241-962c6898e26b','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect');

/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CLIENT_SCOPE_ATTRIBUTES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;

CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
                                           `SCOPE_ID` varchar(36) NOT NULL,
                                           `VALUE` text DEFAULT NULL,
                                           `NAME` varchar(255) NOT NULL,
                                           PRIMARY KEY (`SCOPE_ID`,`NAME`),
                                           KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
                                           CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;

INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` (`SCOPE_ID`, `VALUE`, `NAME`)
VALUES
('1dd2f0b5-8ce7-4caf-b792-330e5775fe9d','${addressScopeConsentText}','consent.screen.text'),
('1dd2f0b5-8ce7-4caf-b792-330e5775fe9d','true','display.on.consent.screen'),
('1dd2f0b5-8ce7-4caf-b792-330e5775fe9d','true','include.in.token.scope'),
('20dfc797-92f9-4017-bf89-57790cf810fd','${offlineAccessScopeConsentText}','consent.screen.text'),
('20dfc797-92f9-4017-bf89-57790cf810fd','true','display.on.consent.screen'),
('21dfeb2b-7c55-477a-a3b4-5907b5ea7f0c','${phoneScopeConsentText}','consent.screen.text'),
('21dfeb2b-7c55-477a-a3b4-5907b5ea7f0c','true','display.on.consent.screen'),
('21dfeb2b-7c55-477a-a3b4-5907b5ea7f0c','true','include.in.token.scope'),
('44ca6980-d0e4-4fee-ab54-da3818b9179a','true','display.on.consent.screen'),
('44ca6980-d0e4-4fee-ab54-da3818b9179a','true','include.in.token.scope'),
('47a235dc-8132-490a-af85-af56e0cb8e1c','${rolesScopeConsentText}','consent.screen.text'),
('47a235dc-8132-490a-af85-af56e0cb8e1c','true','display.on.consent.screen'),
('47a235dc-8132-490a-af85-af56e0cb8e1c','false','include.in.token.scope'),
('73a3f96d-d0f7-4e59-8c97-ed38bf7f3332','${emailScopeConsentText}','consent.screen.text'),
('73a3f96d-d0f7-4e59-8c97-ed38bf7f3332','true','display.on.consent.screen'),
('73a3f96d-d0f7-4e59-8c97-ed38bf7f3332','true','include.in.token.scope'),
('7e256bab-e1e2-421c-b745-583795aa974a','${samlRoleListScopeConsentText}','consent.screen.text'),
('7e256bab-e1e2-421c-b745-583795aa974a','true','display.on.consent.screen'),
('e3b08470-7359-44e1-a665-e1d6a44623b5','${profileScopeConsentText}','consent.screen.text'),
('e3b08470-7359-44e1-a665-e1d6a44623b5','true','display.on.consent.screen'),
('e3b08470-7359-44e1-a665-e1d6a44623b5','true','include.in.token.scope'),
('ee3886d8-bbb3-44d0-806f-e2aa6b7a82aa','false','display.on.consent.screen'),
('ee3886d8-bbb3-44d0-806f-e2aa6b7a82aa','true','include.in.token.scope'),
('f81fe91a-e176-4f33-8241-962c6898e26b','','consent.screen.text'),
('f81fe91a-e176-4f33-8241-962c6898e26b','false','display.on.consent.screen'),
('f81fe91a-e176-4f33-8241-962c6898e26b','false','include.in.token.scope');

/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CLIENT_SCOPE_CLIENT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;

CREATE TABLE `CLIENT_SCOPE_CLIENT` (
                                       `CLIENT_ID` varchar(255) NOT NULL,
                                       `SCOPE_ID` varchar(255) NOT NULL,
                                       `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
                                       PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
                                       KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
                                       KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;

INSERT INTO `CLIENT_SCOPE_CLIENT` (`CLIENT_ID`, `SCOPE_ID`, `DEFAULT_SCOPE`)
VALUES
('117e64fb-62c0-4c00-89e3-1adc91ab4ff0','1dd2f0b5-8ce7-4caf-b792-330e5775fe9d',b'0'),
('117e64fb-62c0-4c00-89e3-1adc91ab4ff0','20dfc797-92f9-4017-bf89-57790cf810fd',b'0'),
('117e64fb-62c0-4c00-89e3-1adc91ab4ff0','21dfeb2b-7c55-477a-a3b4-5907b5ea7f0c',b'0'),
('117e64fb-62c0-4c00-89e3-1adc91ab4ff0','47a235dc-8132-490a-af85-af56e0cb8e1c',b'1'),
('117e64fb-62c0-4c00-89e3-1adc91ab4ff0','73a3f96d-d0f7-4e59-8c97-ed38bf7f3332',b'1'),
('117e64fb-62c0-4c00-89e3-1adc91ab4ff0','e3b08470-7359-44e1-a665-e1d6a44623b5',b'1'),
('117e64fb-62c0-4c00-89e3-1adc91ab4ff0','ee3886d8-bbb3-44d0-806f-e2aa6b7a82aa',b'0'),
('117e64fb-62c0-4c00-89e3-1adc91ab4ff0','f81fe91a-e176-4f33-8241-962c6898e26b',b'1'),
('2232cc79-35ab-45ac-919a-97e7a9992854','1dd2f0b5-8ce7-4caf-b792-330e5775fe9d',b'0'),
('2232cc79-35ab-45ac-919a-97e7a9992854','20dfc797-92f9-4017-bf89-57790cf810fd',b'0'),
('2232cc79-35ab-45ac-919a-97e7a9992854','21dfeb2b-7c55-477a-a3b4-5907b5ea7f0c',b'0'),
('2232cc79-35ab-45ac-919a-97e7a9992854','44ca6980-d0e4-4fee-ab54-da3818b9179a',b'1'),
('2232cc79-35ab-45ac-919a-97e7a9992854','47a235dc-8132-490a-af85-af56e0cb8e1c',b'1'),
('2232cc79-35ab-45ac-919a-97e7a9992854','73a3f96d-d0f7-4e59-8c97-ed38bf7f3332',b'1'),
('2232cc79-35ab-45ac-919a-97e7a9992854','e3b08470-7359-44e1-a665-e1d6a44623b5',b'1'),
('2232cc79-35ab-45ac-919a-97e7a9992854','ee3886d8-bbb3-44d0-806f-e2aa6b7a82aa',b'0'),
('2232cc79-35ab-45ac-919a-97e7a9992854','f81fe91a-e176-4f33-8241-962c6898e26b',b'1'),
('759b7f0d-b50c-480d-a2b8-13957e29fcd9','1dd2f0b5-8ce7-4caf-b792-330e5775fe9d',b'0'),
('759b7f0d-b50c-480d-a2b8-13957e29fcd9','20dfc797-92f9-4017-bf89-57790cf810fd',b'0'),
('759b7f0d-b50c-480d-a2b8-13957e29fcd9','21dfeb2b-7c55-477a-a3b4-5907b5ea7f0c',b'0'),
('759b7f0d-b50c-480d-a2b8-13957e29fcd9','47a235dc-8132-490a-af85-af56e0cb8e1c',b'1'),
('759b7f0d-b50c-480d-a2b8-13957e29fcd9','73a3f96d-d0f7-4e59-8c97-ed38bf7f3332',b'1'),
('759b7f0d-b50c-480d-a2b8-13957e29fcd9','e3b08470-7359-44e1-a665-e1d6a44623b5',b'1'),
('759b7f0d-b50c-480d-a2b8-13957e29fcd9','ee3886d8-bbb3-44d0-806f-e2aa6b7a82aa',b'0'),
('759b7f0d-b50c-480d-a2b8-13957e29fcd9','f81fe91a-e176-4f33-8241-962c6898e26b',b'1'),
('985b4a5c-b574-4cfa-8ce2-6c7194f6bc59','1dd2f0b5-8ce7-4caf-b792-330e5775fe9d',b'0'),
('985b4a5c-b574-4cfa-8ce2-6c7194f6bc59','20dfc797-92f9-4017-bf89-57790cf810fd',b'0'),
('985b4a5c-b574-4cfa-8ce2-6c7194f6bc59','21dfeb2b-7c55-477a-a3b4-5907b5ea7f0c',b'0'),
('985b4a5c-b574-4cfa-8ce2-6c7194f6bc59','47a235dc-8132-490a-af85-af56e0cb8e1c',b'1'),
('985b4a5c-b574-4cfa-8ce2-6c7194f6bc59','73a3f96d-d0f7-4e59-8c97-ed38bf7f3332',b'1'),
('985b4a5c-b574-4cfa-8ce2-6c7194f6bc59','e3b08470-7359-44e1-a665-e1d6a44623b5',b'1'),
('985b4a5c-b574-4cfa-8ce2-6c7194f6bc59','ee3886d8-bbb3-44d0-806f-e2aa6b7a82aa',b'0'),
('985b4a5c-b574-4cfa-8ce2-6c7194f6bc59','f81fe91a-e176-4f33-8241-962c6898e26b',b'1'),
('9ed8555f-966d-4ae7-bf03-0ad62de2ccde','1dd2f0b5-8ce7-4caf-b792-330e5775fe9d',b'0'),
('9ed8555f-966d-4ae7-bf03-0ad62de2ccde','20dfc797-92f9-4017-bf89-57790cf810fd',b'0'),
('9ed8555f-966d-4ae7-bf03-0ad62de2ccde','21dfeb2b-7c55-477a-a3b4-5907b5ea7f0c',b'0'),
('9ed8555f-966d-4ae7-bf03-0ad62de2ccde','47a235dc-8132-490a-af85-af56e0cb8e1c',b'1'),
('9ed8555f-966d-4ae7-bf03-0ad62de2ccde','73a3f96d-d0f7-4e59-8c97-ed38bf7f3332',b'1'),
('9ed8555f-966d-4ae7-bf03-0ad62de2ccde','e3b08470-7359-44e1-a665-e1d6a44623b5',b'1'),
('9ed8555f-966d-4ae7-bf03-0ad62de2ccde','ee3886d8-bbb3-44d0-806f-e2aa6b7a82aa',b'0'),
('9ed8555f-966d-4ae7-bf03-0ad62de2ccde','f81fe91a-e176-4f33-8241-962c6898e26b',b'1'),
('9f6b7b2f-aa64-4caa-a400-bf55a2c781a0','1dd2f0b5-8ce7-4caf-b792-330e5775fe9d',b'0'),
('9f6b7b2f-aa64-4caa-a400-bf55a2c781a0','20dfc797-92f9-4017-bf89-57790cf810fd',b'0'),
('9f6b7b2f-aa64-4caa-a400-bf55a2c781a0','21dfeb2b-7c55-477a-a3b4-5907b5ea7f0c',b'0'),
('9f6b7b2f-aa64-4caa-a400-bf55a2c781a0','47a235dc-8132-490a-af85-af56e0cb8e1c',b'1'),
('9f6b7b2f-aa64-4caa-a400-bf55a2c781a0','73a3f96d-d0f7-4e59-8c97-ed38bf7f3332',b'1'),
('9f6b7b2f-aa64-4caa-a400-bf55a2c781a0','e3b08470-7359-44e1-a665-e1d6a44623b5',b'1'),
('9f6b7b2f-aa64-4caa-a400-bf55a2c781a0','ee3886d8-bbb3-44d0-806f-e2aa6b7a82aa',b'0'),
('9f6b7b2f-aa64-4caa-a400-bf55a2c781a0','f81fe91a-e176-4f33-8241-962c6898e26b',b'1'),
('ce9d3a13-6e02-43b7-8082-e57755d4f987','1dd2f0b5-8ce7-4caf-b792-330e5775fe9d',b'0'),
('ce9d3a13-6e02-43b7-8082-e57755d4f987','20dfc797-92f9-4017-bf89-57790cf810fd',b'0'),
('ce9d3a13-6e02-43b7-8082-e57755d4f987','21dfeb2b-7c55-477a-a3b4-5907b5ea7f0c',b'0'),
('ce9d3a13-6e02-43b7-8082-e57755d4f987','47a235dc-8132-490a-af85-af56e0cb8e1c',b'1'),
('ce9d3a13-6e02-43b7-8082-e57755d4f987','73a3f96d-d0f7-4e59-8c97-ed38bf7f3332',b'1'),
('ce9d3a13-6e02-43b7-8082-e57755d4f987','e3b08470-7359-44e1-a665-e1d6a44623b5',b'1'),
('ce9d3a13-6e02-43b7-8082-e57755d4f987','ee3886d8-bbb3-44d0-806f-e2aa6b7a82aa',b'0'),
('ce9d3a13-6e02-43b7-8082-e57755d4f987','f81fe91a-e176-4f33-8241-962c6898e26b',b'1'),
('da177eb1-c9d3-4692-bcad-62189329a12a','1dd2f0b5-8ce7-4caf-b792-330e5775fe9d',b'0'),
('da177eb1-c9d3-4692-bcad-62189329a12a','20dfc797-92f9-4017-bf89-57790cf810fd',b'0'),
('da177eb1-c9d3-4692-bcad-62189329a12a','21dfeb2b-7c55-477a-a3b4-5907b5ea7f0c',b'0'),
('da177eb1-c9d3-4692-bcad-62189329a12a','47a235dc-8132-490a-af85-af56e0cb8e1c',b'1'),
('da177eb1-c9d3-4692-bcad-62189329a12a','73a3f96d-d0f7-4e59-8c97-ed38bf7f3332',b'1'),
('da177eb1-c9d3-4692-bcad-62189329a12a','e3b08470-7359-44e1-a665-e1d6a44623b5',b'1'),
('da177eb1-c9d3-4692-bcad-62189329a12a','ee3886d8-bbb3-44d0-806f-e2aa6b7a82aa',b'0'),
('da177eb1-c9d3-4692-bcad-62189329a12a','f81fe91a-e176-4f33-8241-962c6898e26b',b'1');

/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CLIENT_SCOPE_ROLE_MAPPING
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;

CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
                                             `SCOPE_ID` varchar(36) NOT NULL,
                                             `ROLE_ID` varchar(36) NOT NULL,
                                             PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
                                             KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
                                             KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
                                             CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;

INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` (`SCOPE_ID`, `ROLE_ID`)
VALUES
('20dfc797-92f9-4017-bf89-57790cf810fd','a417f06b-f55a-4f3a-8e95-30e17721bd24');

/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CLIENT_SESSION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLIENT_SESSION`;

CREATE TABLE `CLIENT_SESSION` (
                                  `ID` varchar(36) NOT NULL,
                                  `CLIENT_ID` varchar(36) DEFAULT NULL,
                                  `REDIRECT_URI` varchar(255) DEFAULT NULL,
                                  `STATE` varchar(255) DEFAULT NULL,
                                  `TIMESTAMP` int(11) DEFAULT NULL,
                                  `SESSION_ID` varchar(36) DEFAULT NULL,
                                  `AUTH_METHOD` varchar(255) DEFAULT NULL,
                                  `REALM_ID` varchar(255) DEFAULT NULL,
                                  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
                                  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
                                  PRIMARY KEY (`ID`),
                                  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
                                  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table CLIENT_SESSION_AUTH_STATUS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;

CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
                                              `AUTHENTICATOR` varchar(36) NOT NULL,
                                              `STATUS` int(11) DEFAULT NULL,
                                              `CLIENT_SESSION` varchar(36) NOT NULL,
                                              PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
                                              CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table CLIENT_SESSION_NOTE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;

CREATE TABLE `CLIENT_SESSION_NOTE` (
                                       `NAME` varchar(255) NOT NULL,
                                       `VALUE` varchar(255) DEFAULT NULL,
                                       `CLIENT_SESSION` varchar(36) NOT NULL,
                                       PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
                                       CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table CLIENT_SESSION_PROT_MAPPER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;

CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
                                              `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
                                              `CLIENT_SESSION` varchar(36) NOT NULL,
                                              PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
                                              CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table CLIENT_SESSION_ROLE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;

CREATE TABLE `CLIENT_SESSION_ROLE` (
                                       `ROLE_ID` varchar(255) NOT NULL,
                                       `CLIENT_SESSION` varchar(36) NOT NULL,
                                       PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
                                       CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table CLIENT_USER_SESSION_NOTE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;

CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
                                            `NAME` varchar(255) NOT NULL,
                                            `VALUE` text DEFAULT NULL,
                                            `CLIENT_SESSION` varchar(36) NOT NULL,
                                            PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
                                            CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table COMPONENT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `COMPONENT`;

CREATE TABLE `COMPONENT` (
                             `ID` varchar(36) NOT NULL,
                             `NAME` varchar(255) DEFAULT NULL,
                             `PARENT_ID` varchar(36) DEFAULT NULL,
                             `PROVIDER_ID` varchar(36) DEFAULT NULL,
                             `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
                             `REALM_ID` varchar(36) DEFAULT NULL,
                             `SUB_TYPE` varchar(255) DEFAULT NULL,
                             PRIMARY KEY (`ID`),
                             KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
                             KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
                             CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;

INSERT INTO `COMPONENT` (`ID`, `NAME`, `PARENT_ID`, `PROVIDER_ID`, `PROVIDER_TYPE`, `REALM_ID`, `SUB_TYPE`)
VALUES
('21b29710-f18b-4ae4-9698-fba8531722fd','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),
('4753cd3a-fd6a-470f-a8c7-30ed67f196de','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),
('4c4c7d54-d40d-4e1f-b367-d0d3edb4f0e0','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),
('7ade17c1-c035-4f43-8d68-562c66f983eb','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),
('904da4be-b5ae-4a06-8822-99d30681e77c','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),
('a938fe89-a89e-415a-a20b-f13bc196e784','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),
('b6005fea-a863-481d-bda8-bf346b0e5f0b','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),
('bc384d8e-41d6-4979-893c-0d495b30a325','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),
('dfd156ce-14aa-4c11-aeb0-49d97bb0d030','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),
('ec0c8fc4-fb12-44a8-b543-1ece50acbae2','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),
('ec2579fd-d20f-4d5d-a8f7-6aa286d24ae3','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous');

/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table COMPONENT_CONFIG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;

CREATE TABLE `COMPONENT_CONFIG` (
                                    `ID` varchar(36) NOT NULL,
                                    `COMPONENT_ID` varchar(36) NOT NULL,
                                    `NAME` varchar(255) NOT NULL,
                                    `VALUE` varchar(4000) CHARACTER SET utf8mb3 DEFAULT NULL,
                                    PRIMARY KEY (`ID`),
                                    KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
                                    CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;

INSERT INTO `COMPONENT_CONFIG` (`ID`, `COMPONENT_ID`, `NAME`, `VALUE`)
VALUES
('0056e284-371f-470d-a173-c2d26d09f2e0','b6005fea-a863-481d-bda8-bf346b0e5f0b','kid','3f30f7df-2244-4654-a9a5-d6c4c56ca766'),
('02df4f4a-6b94-48f0-a7ae-d8f157565904','4753cd3a-fd6a-470f-a8c7-30ed67f196de','host-sending-registration-request-must-match','true'),
('0f1b5fb0-e4ed-4275-bbc1-fc67a0ab85c7','904da4be-b5ae-4a06-8822-99d30681e77c','kid','5b71bebf-5f8b-4e8e-86f9-84c5fe7425b4'),
('3ec8e104-8d8b-47e1-b826-76ce553d9d60','ec2579fd-d20f-4d5d-a8f7-6aa286d24ae3','allowed-protocol-mapper-types','saml-role-list-mapper'),
('456fffac-b43d-44be-9759-e9a3aa144b7e','ec2579fd-d20f-4d5d-a8f7-6aa286d24ae3','allowed-protocol-mapper-types','oidc-address-mapper'),
('4a82388f-0660-43b8-bb70-8d53427a9f7e','ec2579fd-d20f-4d5d-a8f7-6aa286d24ae3','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),
('508db25c-0173-44dc-80a8-e14cbd19598b','b6005fea-a863-481d-bda8-bf346b0e5f0b','algorithm','HS256'),
('54941ba5-2e41-4900-a5d2-9a86615749c2','ec2579fd-d20f-4d5d-a8f7-6aa286d24ae3','allowed-protocol-mapper-types','oidc-full-name-mapper'),
('592fac2c-8101-4b0e-8c9b-3237d1e3b524','4c4c7d54-d40d-4e1f-b367-d0d3edb4f0e0','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),
('68c983da-b792-495b-9e02-c65c520104b8','4753cd3a-fd6a-470f-a8c7-30ed67f196de','client-uris-must-match','true'),
('6d4dd2fa-5871-4101-9afd-19808d6ef97f','21b29710-f18b-4ae4-9698-fba8531722fd','allow-default-scopes','true'),
('72d01a16-a8af-4c15-8fb1-4d6ae1cba893','b6005fea-a863-481d-bda8-bf346b0e5f0b','secret','9bQJqGXimh98rrOEgPnn-ns2OL5aSwlpAeLDNxaM1t5ySsv2ltv6i6DAWCRoWXiu0FmyPNudsq5q-V3FF_54jg'),
('743dcec6-2c4c-4773-acea-4fe04f83bdad','ec2579fd-d20f-4d5d-a8f7-6aa286d24ae3','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),
('755b548d-a015-4827-985c-e8a4b1cf69e7','7ade17c1-c035-4f43-8d68-562c66f983eb','max-clients','200'),
('79273297-52b9-4efe-9cc6-5cf7c8671ae3','bc384d8e-41d6-4979-893c-0d495b30a325','certificate','MIICmzCCAYMCBgF+TbF2DjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwMTEyMDk0ODAyWhcNMzIwMTEyMDk0OTQyWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDdhyIkyhJ7+r6cEU/Q1b7/t94IpuwUkoQMAEwf7mCdzWGw8xnlLdbpddmBYMA0yuP9cyIgDCiqQij/3RMdF3mDWZMzlMkizHyRHuhM9TVlX5HDIhZCK9Sy0McquRACHGXg7wZtpKvl6GCVM/sHwGGIs0Djplc6U/ijXPg908yk4UpuA2XlHxHuKoiK3EJKADD81H5BNQftAS8X8P0n0QytCIiuTHQ3eWZIZnv7nRcC9IIWhF8iMskTGw0p+Yy+k7ec1V8wBg152VJo2OIyQqifpH/AuL4OoI2V6o58U5VJ6a1vBxRq+6udPMV9fAagf5jEN9jRQ9a1FgLTg6V2qD11AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAKG5xtBpFMuYbJPN/mgkPD9Xg3CnBji4ign8rmfSx9R/G+nw3YxRj9Op7aT07hCNDeRgsmYveS4lvBvU6pOtbJ2tACX20/nYbh6dXaEp8Kt5Tm1GbmZaaztYzhht7CpIp9bg3LJjnrNbk92AyNVPp56TBXOrA6k+P7xGYHnyzVwDLrZU5F2Bxidni+GIDaofvLkR73pexxT4BfOZYAJRU+a4VonTHt2YNDgi9F4Uz6pERnmuVLhuKO+6rfcfpoqUb0GAbVAMyrtF2Bd+kaZXouKPKD7lWKkUVwlYYNmESzCjVYGQ9eTJk25rIhmuIYrV+qhSJHkkIoMQfYQcj7SV1+o='),
('856e51f1-565b-45d9-abef-1f50abbba6e3','ec2579fd-d20f-4d5d-a8f7-6aa286d24ae3','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),
('8cc5de76-9323-4145-a682-7b4abe028a9e','4c4c7d54-d40d-4e1f-b367-d0d3edb4f0e0','allowed-protocol-mapper-types','saml-role-list-mapper'),
('8e28cf52-35b5-40d6-b0e6-4c60c74bc941','904da4be-b5ae-4a06-8822-99d30681e77c','secret','gYbag969mY_FXXhyW94qew'),
('9242a920-9c05-4b1a-ac1a-9089ef00207d','4c4c7d54-d40d-4e1f-b367-d0d3edb4f0e0','allowed-protocol-mapper-types','oidc-full-name-mapper'),
('9d83f33d-3951-47c3-8ac3-412e0325e2cc','4c4c7d54-d40d-4e1f-b367-d0d3edb4f0e0','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),
('9dbe960e-c5b0-4939-9b40-a68c5465faf3','4c4c7d54-d40d-4e1f-b367-d0d3edb4f0e0','allowed-protocol-mapper-types','saml-user-attribute-mapper'),
('9e99aa27-9e13-4b61-89df-6a4be2fbc5e6','4c4c7d54-d40d-4e1f-b367-d0d3edb4f0e0','allowed-protocol-mapper-types','saml-user-property-mapper'),
('a1130db3-2ce7-4215-84b6-fa02d6959667','904da4be-b5ae-4a06-8822-99d30681e77c','priority','100'),
('a1751bba-a5dd-4bc7-b0bf-095df55ca558','b6005fea-a863-481d-bda8-bf346b0e5f0b','priority','100'),
('b487513e-0dbd-476a-8c09-4d1ed8a05d27','4c4c7d54-d40d-4e1f-b367-d0d3edb4f0e0','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),
('c6e604bf-dda7-4169-99c4-7f13a4e546ae','bc384d8e-41d6-4979-893c-0d495b30a325','privateKey','MIIEpAIBAAKCAQEA3YciJMoSe/q+nBFP0NW+/7feCKbsFJKEDABMH+5gnc1hsPMZ5S3W6XXZgWDANMrj/XMiIAwoqkIo/90THRd5g1mTM5TJIsx8kR7oTPU1ZV+RwyIWQivUstDHKrkQAhxl4O8GbaSr5ehglTP7B8BhiLNA46ZXOlP4o1z4PdPMpOFKbgNl5R8R7iqIitxCSgAw/NR+QTUH7QEvF/D9J9EMrQiIrkx0N3lmSGZ7+50XAvSCFoRfIjLJExsNKfmMvpO3nNVfMAYNedlSaNjiMkKon6R/wLi+DqCNleqOfFOVSemtbwcUavurnTzFfXwGoH+YxDfY0UPWtRYC04Oldqg9dQIDAQABAoIBAQChB3TrVzQ+iRN7cR4ayPUw/1/X3Dap8aMo8iJj56y1qLDFpsEBFeQuCmuUH1c4SO+XsdRxhUUeFj+lVfdp40GCGF/nU9UthYVbHCNypaAt012qgaG6chAH97l/Nc0MK8ZmznlWxCfsVJG4g3OLu+1qKBsYIDcyAA4x+ge9MbOFeaB6VUQl/8nDYWLsSwYgSj0qw1WAHY8FOk6hnJxB3vPBCh7IXBrFLW4DaoDb7nJxSA6ygpjrL96Q5KaulgPhxHzGsI+1SdRb8VhA+ATSJA3yaCLQSIZJhZLz+jOiCNVh7RPbEbZUmyTw5bCjp7zKevld52zUizcH6d4kzg9too4VAoGBAPVBszAvUPTatrDDtoOa6RCjDqZnSyJAHi2fhdXisHmnbM+rH8ERmocZVr+JPlEfQP31bpyqvMYG6wpDApXvpWMrWg6+WTslMO1dqGxnp3/rQ+sEuIGV5XFePI1rMRa7BS+AkZRHzu6tsSKdLcrax6AVpZ1G3n/rPYxS4qXjRNwXAoGBAOc7VvZG6w1v/jccJPEhidkbApeL6dOaxSOjGdgK0imfCkydrmT++W2Hpnqh0vpyOJo9OcnO752kEIuByhXdSEMRqnuct0aDKe7n0Vyt1fEkl2h9dDx7ayQTiliX4QS0UBd2zHY121KjK5wemff8mLwRErnH504vNKu1rs1gNW5TAoGAI2m8LO34G5LlJDruRKx+kLdqqx5pG+X0NZQ+J/cWkkpZjNbhu+gFzxIak4eGpwIDSWhB8383yMRA9fddDTdQQzSESXK0wbSKDwwiAJ0q826OHQZOee+h9K+twKHEscqJYiWHX8jKmW4dEKlvbkYO4w+dHUuZXxEhjvx824UocTsCgYBdQIMboxIcQzQkiYckb8Al/EyZTWWpXttuOdKsXADRpEAFEfpI5MM2tuQexLBPLE1Ddrmdd4UO8CF0AY28L5d65N76JwOKvk7k+Dxowfpr27PsAdwkoClfTToX7Hhk60r5i4F9ks62jvOBbJ3vcsEt5zzEC6hu0X7OWOD8Fna13QKBgQC0cvZfu/be48A8RPh7dZ/UO93fNYHWU94bI0ggbHuQh9SLopzJEhNKfZWj9H6WN/V9llEe71+rDW7NkiCoU4SDazj/DoQLRD74fFwo55As85Ye8m5u7tAlplFP9HzrTDdnWyivja+bjCQxstEZ7+OPWay/TcdiiMtyFlKHgJIaqQ=='),
('ce42f9a7-b57f-4627-9420-b499c7f55270','bc384d8e-41d6-4979-893c-0d495b30a325','priority','100'),
('d3a67c75-df84-4a26-b4a1-fc5ac960541e','ec2579fd-d20f-4d5d-a8f7-6aa286d24ae3','allowed-protocol-mapper-types','saml-user-attribute-mapper'),
('e24e08e9-cc8e-464e-9623-b96a9c35119e','4c4c7d54-d40d-4e1f-b367-d0d3edb4f0e0','allowed-protocol-mapper-types','oidc-address-mapper'),
('e7350378-c370-4ec8-9634-116f4c4f5bde','ec2579fd-d20f-4d5d-a8f7-6aa286d24ae3','allowed-protocol-mapper-types','saml-user-property-mapper'),
('f9def649-8f9b-470b-8340-e6ab49c62fc1','a938fe89-a89e-415a-a20b-f13bc196e784','allow-default-scopes','true');

/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table COMPOSITE_ROLE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;

CREATE TABLE `COMPOSITE_ROLE` (
                                  `COMPOSITE` varchar(36) NOT NULL,
                                  `CHILD_ROLE` varchar(36) NOT NULL,
                                  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
                                  KEY `IDX_COMPOSITE` (`COMPOSITE`),
                                  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
                                  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
                                  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;

INSERT INTO `COMPOSITE_ROLE` (`COMPOSITE`, `CHILD_ROLE`)
VALUES
('448772ba-17b4-4e32-9620-03624adf23d9','39943576-241d-4c1c-82de-a99f0b01cea4'),
('7928ccfb-52df-42bd-92e1-3dc359024da2','4517e8ba-914d-4fbe-9a4f-9bc91074811c'),
('87ae2de1-7902-45c6-9b48-833682fe698d','0e12fa40-47ab-4ee6-8a68-4c47b2a7a6c0'),
('87ae2de1-7902-45c6-9b48-833682fe698d','145a1000-0fcd-4206-b8ce-e6359291ef20'),
('87ae2de1-7902-45c6-9b48-833682fe698d','1eea195c-47e3-44ae-a45f-c9d0387dd179'),
('87ae2de1-7902-45c6-9b48-833682fe698d','27d70324-732d-433e-a210-51f082ab07b1'),
('87ae2de1-7902-45c6-9b48-833682fe698d','3b34da77-0424-4937-a942-0fb0811bfa41'),
('87ae2de1-7902-45c6-9b48-833682fe698d','43e43bb9-b8e7-4816-ae83-76ced1056ed0'),
('87ae2de1-7902-45c6-9b48-833682fe698d','743a135d-d913-44ce-b951-68cdae43597f'),
('87ae2de1-7902-45c6-9b48-833682fe698d','7f223955-12d7-4e55-b304-145c30f91495'),
('87ae2de1-7902-45c6-9b48-833682fe698d','8b136d86-543e-42da-8e62-3b50887e593d'),
('87ae2de1-7902-45c6-9b48-833682fe698d','9dad7334-3d75-476a-8c89-f51d848f0df8'),
('87ae2de1-7902-45c6-9b48-833682fe698d','9eb7bc47-fc95-4571-b10e-dbe20a1f1b6e'),
('87ae2de1-7902-45c6-9b48-833682fe698d','a0954cd1-e878-4d26-96a1-ded33b3a373c'),
('87ae2de1-7902-45c6-9b48-833682fe698d','ace2062c-1fdc-402d-95d8-72183f5d2907'),
('87ae2de1-7902-45c6-9b48-833682fe698d','bf6fe66d-e656-4cd3-8d18-23d082472634'),
('87ae2de1-7902-45c6-9b48-833682fe698d','d407fd02-7d98-4395-99c9-d61c00297061'),
('87ae2de1-7902-45c6-9b48-833682fe698d','eec0cda0-ef4b-4c6f-9b61-1eb3afb245b6'),
('87ae2de1-7902-45c6-9b48-833682fe698d','ef18ae8d-908e-4d12-b2ae-d3b79b5c1939'),
('87ae2de1-7902-45c6-9b48-833682fe698d','f31c73b9-d612-40b7-831a-13f5eaa2f33b'),
('87ae2de1-7902-45c6-9b48-833682fe698d','f77d6e80-97a3-466b-910e-8ae8f7dcc30c'),
('ace2062c-1fdc-402d-95d8-72183f5d2907','27d70324-732d-433e-a210-51f082ab07b1'),
('ace2062c-1fdc-402d-95d8-72183f5d2907','eec0cda0-ef4b-4c6f-9b61-1eb3afb245b6'),
('c8ac7bca-0ca0-4e41-9a99-9e713515d15c','0d56c8d0-a0f5-408b-ae15-340928f87f34'),
('c8ac7bca-0ca0-4e41-9a99-9e713515d15c','448772ba-17b4-4e32-9620-03624adf23d9'),
('c8ac7bca-0ca0-4e41-9a99-9e713515d15c','a417f06b-f55a-4f3a-8e95-30e17721bd24'),
('c8ac7bca-0ca0-4e41-9a99-9e713515d15c','f03e9dea-f295-4111-964f-04692b653cb3'),
('ef18ae8d-908e-4d12-b2ae-d3b79b5c1939','3b34da77-0424-4937-a942-0fb0811bfa41');

/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CREDENTIAL
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CREDENTIAL`;

CREATE TABLE `CREDENTIAL` (
                              `ID` varchar(36) NOT NULL,
                              `SALT` tinyblob DEFAULT NULL,
                              `TYPE` varchar(255) DEFAULT NULL,
                              `USER_ID` varchar(36) DEFAULT NULL,
                              `CREATED_DATE` bigint(20) DEFAULT NULL,
                              `USER_LABEL` varchar(255) DEFAULT NULL,
                              `SECRET_DATA` longtext DEFAULT NULL,
                              `CREDENTIAL_DATA` longtext DEFAULT NULL,
                              `PRIORITY` int(11) DEFAULT NULL,
                              PRIMARY KEY (`ID`),
                              KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
                              CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;

INSERT INTO `CREDENTIAL` (`ID`, `SALT`, `TYPE`, `USER_ID`, `CREATED_DATE`, `USER_LABEL`, `SECRET_DATA`, `CREDENTIAL_DATA`, `PRIORITY`)
VALUES
('5b240816-9d7e-468a-a5fd-73e8cbfa6314',NULL,'password','f668f69c-5238-483b-b695-c2e0cb477541',1641980983288,NULL,'{\"value\":\"uJj9/Yy4dcvZZpRvJP1YWDT/MZEIKCwt1Ax4L4zhOQjpRW71qMM0ajz7dbey/Ie7MMgiFgxOEz2I/eySvhxVOQ==\",\"salt\":\"DWobczblgCRZMULJ2hVCSQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);

/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table DATABASECHANGELOG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DATABASECHANGELOG`;

CREATE TABLE `DATABASECHANGELOG` (
                                     `ID` varchar(255) NOT NULL,
                                     `AUTHOR` varchar(255) NOT NULL,
                                     `FILENAME` varchar(255) NOT NULL,
                                     `DATEEXECUTED` datetime NOT NULL,
                                     `ORDEREXECUTED` int(11) NOT NULL,
                                     `EXECTYPE` varchar(10) NOT NULL,
                                     `MD5SUM` varchar(35) DEFAULT NULL,
                                     `DESCRIPTION` varchar(255) DEFAULT NULL,
                                     `COMMENTS` varchar(255) DEFAULT NULL,
                                     `TAG` varchar(255) DEFAULT NULL,
                                     `LIQUIBASE` varchar(20) DEFAULT NULL,
                                     `CONTEXTS` varchar(255) DEFAULT NULL,
                                     `LABELS` varchar(255) DEFAULT NULL,
                                     `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;

INSERT INTO `DATABASECHANGELOG` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`)
VALUES
('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2022-01-12 09:49:34',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2022-01-12 09:49:34',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2022-01-12 09:49:34',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2022-01-12 09:49:34',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2022-01-12 09:49:34',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2022-01-12 09:49:34',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2022-01-12 09:49:35',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2022-01-12 09:49:35',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2022-01-12 09:49:35',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2022-01-12 09:49:35',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2022-01-12 09:49:35',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2022-01-12 09:49:35',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2022-01-12 09:49:35',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-01-12 09:49:35',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-01-12 09:49:35',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-01-12 09:49:35',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-01-12 09:49:35',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2022-01-12 09:49:35',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2022-01-12 09:49:35',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2022-01-12 09:49:35',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2022-01-12 09:49:35',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2022-01-12 09:49:35',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2022-01-12 09:49:35',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2022-01-12 09:49:36',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2022-01-12 09:49:36',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2022-01-12 09:49:36',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2022-01-12 09:49:36',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2022-01-12 09:49:36',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2022-01-12 09:49:36',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2022-01-12 09:49:36',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2022-01-12 09:49:36',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2022-01-12 09:49:36',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-01-12 09:49:36',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-01-12 09:49:36',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-01-12 09:49:37',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2022-01-12 09:49:37',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-01-12 09:49:37',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2022-01-12 09:49:37',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2022-01-12 09:49:37',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-01-12 09:49:37',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-01-12 09:49:37',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2022-01-12 09:49:37',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-01-12 09:49:37',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2022-01-12 09:49:37',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-01-12 09:49:37',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-01-12 09:49:37',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-01-12 09:49:37',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-01-12 09:49:37',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-01-12 09:49:37',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2022-01-12 09:49:37',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2022-01-12 09:49:37',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2022-01-12 09:49:37',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2022-01-12 09:49:37',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2022-01-12 09:49:37',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-01-12 09:49:37',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-01-12 09:49:37',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-01-12 09:49:38',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-01-12 09:49:38',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2022-01-12 09:49:38',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2022-01-12 09:49:38',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2022-01-12 09:49:38',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2022-01-12 09:49:38',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2022-01-12 09:49:38',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2022-01-12 09:49:38',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2022-01-12 09:49:38',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2022-01-12 09:49:38',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2022-01-12 09:49:38',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2022-01-12 09:49:38',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2022-01-12 09:49:38',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2022-01-12 09:49:38',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2022-01-12 09:49:38',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-12 09:49:38',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('8.0.0-updating-credential-data-not-oracle','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-12 09:49:38',73,'EXECUTED','7:03b3f4b264c3c68ba082250a80b74216','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('8.0.0-updating-credential-data-oracle','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-12 09:49:38',74,'MARK_RAN','7:64c5728f5ca1f5aa4392217701c4fe23','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-12 09:49:38',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-12 09:49:38',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-01-12 09:49:38',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-01-12 09:49:38',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-01-12 09:49:38',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-01-12 09:49:38',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-01-12 09:49:38',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-01-12 09:49:38',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-01-12 09:49:38',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-01-12 09:49:38',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-01-12 09:49:38',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2022-01-12 09:49:38',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2022-01-12 09:49:38',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2022-01-12 09:49:38',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-12 09:49:39',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-12 09:49:39',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-12 09:49:39',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-12 09:49:39',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-12 09:49:39',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-12 09:49:39',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-12 09:49:39',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-12 09:49:39',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'1980973258'),
('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-31 10:55:42',97,'MARK_RAN','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3626542906'),
('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-31 10:55:42',98,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'3626542906'),
('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-31 10:55:42',99,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'3626542906'),
('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-31 10:55:42',100,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3626542906'),
('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-31 10:55:42',101,'MARK_RAN','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3626542906'),
('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-31 10:55:42',102,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3626542906'),
('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-31 10:55:42',103,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'3626542906'),
('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-31 10:55:42',104,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'3626542906'),
('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-31 10:55:42',105,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'3626542906'),
('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2022-01-31 10:55:43',106,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'3626542906');

/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table DATABASECHANGELOGLOCK
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;

CREATE TABLE `DATABASECHANGELOGLOCK` (
                                         `ID` int(11) NOT NULL,
                                         `LOCKED` bit(1) NOT NULL,
                                         `LOCKGRANTED` datetime DEFAULT NULL,
                                         `LOCKEDBY` varchar(255) DEFAULT NULL,
                                         PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;

INSERT INTO `DATABASECHANGELOGLOCK` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`)
VALUES
(1,b'0',NULL,NULL),
(1000,b'0',NULL,NULL),
(1001,b'0',NULL,NULL);

/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table DEFAULT_CLIENT_SCOPE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;

CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
                                        `REALM_ID` varchar(36) NOT NULL,
                                        `SCOPE_ID` varchar(36) NOT NULL,
                                        `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
                                        PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
                                        KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
                                        KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
                                        CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;

INSERT INTO `DEFAULT_CLIENT_SCOPE` (`REALM_ID`, `SCOPE_ID`, `DEFAULT_SCOPE`)
VALUES
('master','1dd2f0b5-8ce7-4caf-b792-330e5775fe9d',b'0'),
('master','20dfc797-92f9-4017-bf89-57790cf810fd',b'0'),
('master','21dfeb2b-7c55-477a-a3b4-5907b5ea7f0c',b'0'),
('master','47a235dc-8132-490a-af85-af56e0cb8e1c',b'1'),
('master','73a3f96d-d0f7-4e59-8c97-ed38bf7f3332',b'1'),
('master','7e256bab-e1e2-421c-b745-583795aa974a',b'1'),
('master','e3b08470-7359-44e1-a665-e1d6a44623b5',b'1'),
('master','ee3886d8-bbb3-44d0-806f-e2aa6b7a82aa',b'0'),
('master','f81fe91a-e176-4f33-8241-962c6898e26b',b'1');

/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table EVENT_ENTITY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EVENT_ENTITY`;

CREATE TABLE `EVENT_ENTITY` (
                                `ID` varchar(36) NOT NULL,
                                `CLIENT_ID` varchar(255) DEFAULT NULL,
                                `DETAILS_JSON` text DEFAULT NULL,
                                `ERROR` varchar(255) DEFAULT NULL,
                                `IP_ADDRESS` varchar(255) DEFAULT NULL,
                                `REALM_ID` varchar(255) DEFAULT NULL,
                                `SESSION_ID` varchar(255) DEFAULT NULL,
                                `EVENT_TIME` bigint(20) DEFAULT NULL,
                                `TYPE` varchar(255) DEFAULT NULL,
                                `USER_ID` varchar(255) DEFAULT NULL,
                                PRIMARY KEY (`ID`),
                                KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table FED_USER_ATTRIBUTE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;

CREATE TABLE `FED_USER_ATTRIBUTE` (
                                      `ID` varchar(36) NOT NULL,
                                      `NAME` varchar(255) NOT NULL,
                                      `USER_ID` varchar(255) NOT NULL,
                                      `REALM_ID` varchar(36) NOT NULL,
                                      `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
                                      `VALUE` text DEFAULT NULL,
                                      PRIMARY KEY (`ID`),
                                      KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table FED_USER_CONSENT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FED_USER_CONSENT`;

CREATE TABLE `FED_USER_CONSENT` (
                                    `ID` varchar(36) NOT NULL,
                                    `CLIENT_ID` varchar(255) DEFAULT NULL,
                                    `USER_ID` varchar(255) NOT NULL,
                                    `REALM_ID` varchar(36) NOT NULL,
                                    `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
                                    `CREATED_DATE` bigint(20) DEFAULT NULL,
                                    `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
                                    `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
                                    `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
                                    PRIMARY KEY (`ID`),
                                    KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
                                    KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
                                    KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table FED_USER_CONSENT_CL_SCOPE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;

CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
                                             `USER_CONSENT_ID` varchar(36) NOT NULL,
                                             `SCOPE_ID` varchar(36) NOT NULL,
                                             PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table FED_USER_CREDENTIAL
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;

CREATE TABLE `FED_USER_CREDENTIAL` (
                                       `ID` varchar(36) NOT NULL,
                                       `SALT` tinyblob DEFAULT NULL,
                                       `TYPE` varchar(255) DEFAULT NULL,
                                       `CREATED_DATE` bigint(20) DEFAULT NULL,
                                       `USER_ID` varchar(255) NOT NULL,
                                       `REALM_ID` varchar(36) NOT NULL,
                                       `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
                                       `USER_LABEL` varchar(255) DEFAULT NULL,
                                       `SECRET_DATA` longtext DEFAULT NULL,
                                       `CREDENTIAL_DATA` longtext DEFAULT NULL,
                                       `PRIORITY` int(11) DEFAULT NULL,
                                       PRIMARY KEY (`ID`),
                                       KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
                                       KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table FED_USER_GROUP_MEMBERSHIP
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;

CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
                                             `GROUP_ID` varchar(36) NOT NULL,
                                             `USER_ID` varchar(255) NOT NULL,
                                             `REALM_ID` varchar(36) NOT NULL,
                                             `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
                                             PRIMARY KEY (`GROUP_ID`,`USER_ID`),
                                             KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
                                             KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table FED_USER_REQUIRED_ACTION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;

CREATE TABLE `FED_USER_REQUIRED_ACTION` (
                                            `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
                                            `USER_ID` varchar(255) NOT NULL,
                                            `REALM_ID` varchar(36) NOT NULL,
                                            `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
                                            PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
                                            KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
                                            KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table FED_USER_ROLE_MAPPING
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;

CREATE TABLE `FED_USER_ROLE_MAPPING` (
                                         `ROLE_ID` varchar(36) NOT NULL,
                                         `USER_ID` varchar(255) NOT NULL,
                                         `REALM_ID` varchar(36) NOT NULL,
                                         `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
                                         PRIMARY KEY (`ROLE_ID`,`USER_ID`),
                                         KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
                                         KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table FEDERATED_IDENTITY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;

CREATE TABLE `FEDERATED_IDENTITY` (
                                      `IDENTITY_PROVIDER` varchar(255) NOT NULL,
                                      `REALM_ID` varchar(36) DEFAULT NULL,
                                      `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
                                      `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
                                      `TOKEN` text DEFAULT NULL,
                                      `USER_ID` varchar(36) NOT NULL,
                                      PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
                                      KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
                                      KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
                                      CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table FEDERATED_USER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FEDERATED_USER`;

CREATE TABLE `FEDERATED_USER` (
                                  `ID` varchar(255) NOT NULL,
                                  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
                                  `REALM_ID` varchar(36) NOT NULL,
                                  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table GROUP_ATTRIBUTE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;

CREATE TABLE `GROUP_ATTRIBUTE` (
                                   `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
                                   `NAME` varchar(255) NOT NULL,
                                   `VALUE` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
                                   `GROUP_ID` varchar(36) NOT NULL,
                                   PRIMARY KEY (`ID`),
                                   KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
                                   CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table GROUP_ROLE_MAPPING
# ------------------------------------------------------------

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;

CREATE TABLE `GROUP_ROLE_MAPPING` (
                                      `ROLE_ID` varchar(36) NOT NULL,
                                      `GROUP_ID` varchar(36) NOT NULL,
                                      PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
                                      KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
                                      CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table IDENTITY_PROVIDER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;

CREATE TABLE `IDENTITY_PROVIDER` (
                                     `INTERNAL_ID` varchar(36) NOT NULL,
                                     `ENABLED` bit(1) NOT NULL DEFAULT b'0',
                                     `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
                                     `PROVIDER_ID` varchar(255) DEFAULT NULL,
                                     `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
                                     `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
                                     `REALM_ID` varchar(36) DEFAULT NULL,
                                     `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
                                     `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
                                     `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
                                     `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
                                     `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
                                     `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
                                     PRIMARY KEY (`INTERNAL_ID`),
                                     UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
                                     KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
                                     CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table IDENTITY_PROVIDER_CONFIG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;

CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
                                            `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
                                            `VALUE` longtext DEFAULT NULL,
                                            `NAME` varchar(255) NOT NULL,
                                            PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
                                            CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table IDENTITY_PROVIDER_MAPPER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;

CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
                                            `ID` varchar(36) NOT NULL,
                                            `NAME` varchar(255) NOT NULL,
                                            `IDP_ALIAS` varchar(255) NOT NULL,
                                            `IDP_MAPPER_NAME` varchar(255) NOT NULL,
                                            `REALM_ID` varchar(36) NOT NULL,
                                            PRIMARY KEY (`ID`),
                                            KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
                                            CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table IDP_MAPPER_CONFIG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;

CREATE TABLE `IDP_MAPPER_CONFIG` (
                                     `IDP_MAPPER_ID` varchar(36) NOT NULL,
                                     `VALUE` longtext DEFAULT NULL,
                                     `NAME` varchar(255) NOT NULL,
                                     PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
                                     CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table KEYCLOAK_GROUP
# ------------------------------------------------------------

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;

CREATE TABLE `KEYCLOAK_GROUP` (
                                  `ID` varchar(36) NOT NULL,
                                  `NAME` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
                                  `PARENT_GROUP` varchar(36) NOT NULL,
                                  `REALM_ID` varchar(36) DEFAULT NULL,
                                  PRIMARY KEY (`ID`),
                                  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table KEYCLOAK_ROLE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;

CREATE TABLE `KEYCLOAK_ROLE` (
                                 `ID` varchar(36) NOT NULL,
                                 `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
                                 `CLIENT_ROLE` bit(1) DEFAULT NULL,
                                 `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
                                 `NAME` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
                                 `REALM_ID` varchar(255) DEFAULT NULL,
                                 `CLIENT` varchar(36) DEFAULT NULL,
                                 `REALM` varchar(36) DEFAULT NULL,
                                 PRIMARY KEY (`ID`),
                                 UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
                                 KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
                                 KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
                                 CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;

INSERT INTO `KEYCLOAK_ROLE` (`ID`, `CLIENT_REALM_CONSTRAINT`, `CLIENT_ROLE`, `DESCRIPTION`, `NAME`, `REALM_ID`, `CLIENT`, `REALM`)
VALUES
('01d91a98-73de-4019-8afe-03a35b1f6957','2232cc79-35ab-45ac-919a-97e7a9992854',b'1',NULL,'admin','master','2232cc79-35ab-45ac-919a-97e7a9992854',NULL),
('0d56c8d0-a0f5-408b-ae15-340928f87f34','master',b'0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),
('0e12fa40-47ab-4ee6-8a68-4c47b2a7a6c0','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1','${role_manage-identity-providers}','manage-identity-providers','master','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',NULL),
('145a1000-0fcd-4206-b8ce-e6359291ef20','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1','${role_manage-realm}','manage-realm','master','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',NULL),
('1eea195c-47e3-44ae-a45f-c9d0387dd179','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1','${role_manage-users}','manage-users','master','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',NULL),
('27d70324-732d-433e-a210-51f082ab07b1','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1','${role_query-groups}','query-groups','master','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',NULL),
('3308383d-cc75-4da9-abc9-8ff87e0e6273','ce9d3a13-6e02-43b7-8082-e57755d4f987',b'1','${role_delete-account}','delete-account','master','ce9d3a13-6e02-43b7-8082-e57755d4f987',NULL),
('39943576-241d-4c1c-82de-a99f0b01cea4','ce9d3a13-6e02-43b7-8082-e57755d4f987',b'1','${role_manage-account-links}','manage-account-links','master','ce9d3a13-6e02-43b7-8082-e57755d4f987',NULL),
('3b34da77-0424-4937-a942-0fb0811bfa41','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1','${role_query-clients}','query-clients','master','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',NULL),
('43e43bb9-b8e7-4816-ae83-76ced1056ed0','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1','${role_view-authorization}','view-authorization','master','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',NULL),
('448772ba-17b4-4e32-9620-03624adf23d9','ce9d3a13-6e02-43b7-8082-e57755d4f987',b'1','${role_manage-account}','manage-account','master','ce9d3a13-6e02-43b7-8082-e57755d4f987',NULL),
('4517e8ba-914d-4fbe-9a4f-9bc91074811c','ce9d3a13-6e02-43b7-8082-e57755d4f987',b'1','${role_view-consent}','view-consent','master','ce9d3a13-6e02-43b7-8082-e57755d4f987',NULL),
('59e37b17-0294-4f71-8ec4-7ce73928a649','759b7f0d-b50c-480d-a2b8-13957e29fcd9',b'1','${role_read-token}','read-token','master','759b7f0d-b50c-480d-a2b8-13957e29fcd9',NULL),
('639b85d2-66ca-4d76-8ab9-56d54c2a78c3','ce9d3a13-6e02-43b7-8082-e57755d4f987',b'1','${role_view-applications}','view-applications','master','ce9d3a13-6e02-43b7-8082-e57755d4f987',NULL),
('743a135d-d913-44ce-b951-68cdae43597f','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1','${role_manage-events}','manage-events','master','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',NULL),
('7928ccfb-52df-42bd-92e1-3dc359024da2','ce9d3a13-6e02-43b7-8082-e57755d4f987',b'1','${role_manage-consent}','manage-consent','master','ce9d3a13-6e02-43b7-8082-e57755d4f987',NULL),
('7f223955-12d7-4e55-b304-145c30f91495','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1','${role_query-realms}','query-realms','master','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',NULL),
('87ae2de1-7902-45c6-9b48-833682fe698d','master',b'0','${role_admin}','admin','master',NULL,NULL),
('8b136d86-543e-42da-8e62-3b50887e593d','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1','${role_view-realm}','view-realm','master','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',NULL),
('9dad7334-3d75-476a-8c89-f51d848f0df8','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1','${role_view-identity-providers}','view-identity-providers','master','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',NULL),
('9eb7bc47-fc95-4571-b10e-dbe20a1f1b6e','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1','${role_view-events}','view-events','master','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',NULL),
('a0954cd1-e878-4d26-96a1-ded33b3a373c','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1','${role_manage-clients}','manage-clients','master','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',NULL),
('a417f06b-f55a-4f3a-8e95-30e17721bd24','master',b'0','${role_offline-access}','offline_access','master',NULL,NULL),
('ace2062c-1fdc-402d-95d8-72183f5d2907','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1','${role_view-users}','view-users','master','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',NULL),
('bd403de2-d6fe-473d-8f17-a0ebbf58e034','da177eb1-c9d3-4692-bcad-62189329a12a',b'1',NULL,'uma_protection','master','da177eb1-c9d3-4692-bcad-62189329a12a',NULL),
('bf6fe66d-e656-4cd3-8d18-23d082472634','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1','${role_impersonation}','impersonation','master','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',NULL),
('c8ac7bca-0ca0-4e41-9a99-9e713515d15c','master',b'0','${role_default-roles}','default-roles-master','master',NULL,NULL),
('d407fd02-7d98-4395-99c9-d61c00297061','master',b'0','${role_create-realm}','create-realm','master',NULL,NULL),
('eec0cda0-ef4b-4c6f-9b61-1eb3afb245b6','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1','${role_query-users}','query-users','master','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',NULL),
('ef18ae8d-908e-4d12-b2ae-d3b79b5c1939','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1','${role_view-clients}','view-clients','master','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',NULL),
('f03e9dea-f295-4111-964f-04692b653cb3','ce9d3a13-6e02-43b7-8082-e57755d4f987',b'1','${role_view-profile}','view-profile','master','ce9d3a13-6e02-43b7-8082-e57755d4f987',NULL),
('f31c73b9-d612-40b7-831a-13f5eaa2f33b','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1','${role_manage-authorization}','manage-authorization','master','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',NULL),
('f77d6e80-97a3-466b-910e-8ae8f7dcc30c','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',b'1','${role_create-client}','create-client','master','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',NULL);

/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table MIGRATION_MODEL
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MIGRATION_MODEL`;

CREATE TABLE `MIGRATION_MODEL` (
                                   `ID` varchar(36) NOT NULL,
                                   `VERSION` varchar(36) DEFAULT NULL,
                                   `UPDATE_TIME` bigint(20) NOT NULL DEFAULT 0,
                                   PRIMARY KEY (`ID`),
                                   KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;

INSERT INTO `MIGRATION_MODEL` (`ID`, `VERSION`, `UPDATE_TIME`)
VALUES
('1wcw1','13.0.1',1641980981),
('xc7e1','16.1.1',1643626545);

/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table OFFLINE_CLIENT_SESSION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;

CREATE TABLE `OFFLINE_CLIENT_SESSION` (
                                          `USER_SESSION_ID` varchar(36) NOT NULL,
                                          `CLIENT_ID` varchar(255) NOT NULL,
                                          `OFFLINE_FLAG` varchar(4) NOT NULL,
                                          `TIMESTAMP` int(11) DEFAULT NULL,
                                          `DATA` longtext DEFAULT NULL,
                                          `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
                                          `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
                                          PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
                                          KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
                                          KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table OFFLINE_USER_SESSION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;

CREATE TABLE `OFFLINE_USER_SESSION` (
                                        `USER_SESSION_ID` varchar(36) NOT NULL,
                                        `USER_ID` varchar(255) DEFAULT NULL,
                                        `REALM_ID` varchar(36) NOT NULL,
                                        `CREATED_ON` int(11) NOT NULL,
                                        `OFFLINE_FLAG` varchar(4) NOT NULL,
                                        `DATA` longtext DEFAULT NULL,
                                        `LAST_SESSION_REFRESH` int(11) NOT NULL DEFAULT 0,
                                        PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
                                        KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
                                        KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
                                        KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
                                        KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table POLICY_CONFIG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `POLICY_CONFIG`;

CREATE TABLE `POLICY_CONFIG` (
                                 `POLICY_ID` varchar(36) NOT NULL,
                                 `NAME` varchar(255) NOT NULL,
                                 `VALUE` longtext DEFAULT NULL,
                                 PRIMARY KEY (`POLICY_ID`,`NAME`),
                                 CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table PROTOCOL_MAPPER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;

CREATE TABLE `PROTOCOL_MAPPER` (
                                   `ID` varchar(36) NOT NULL,
                                   `NAME` varchar(255) NOT NULL,
                                   `PROTOCOL` varchar(255) NOT NULL,
                                   `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
                                   `CLIENT_ID` varchar(36) DEFAULT NULL,
                                   `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
                                   PRIMARY KEY (`ID`),
                                   KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
                                   KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
                                   CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
                                   CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;

INSERT INTO `PROTOCOL_MAPPER` (`ID`, `NAME`, `PROTOCOL`, `PROTOCOL_MAPPER_NAME`, `CLIENT_ID`, `CLIENT_SCOPE_ID`)
VALUES
('006daf25-10cd-4ad2-9bb4-496e00f08e3a','my-app-audience','openid-connect','oidc-audience-mapper',NULL,'44ca6980-d0e4-4fee-ab54-da3818b9179a'),
('0405421f-eff2-4f73-bddd-d1bcdfa7279e','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e3b08470-7359-44e1-a665-e1d6a44623b5'),
('04ccdd71-fe3d-4c04-bb1e-482dae2ec368','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'f81fe91a-e176-4f33-8241-962c6898e26b'),
('0f6efe22-f792-4fdc-b5c5-0320824bfcd3','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','2232cc79-35ab-45ac-919a-97e7a9992854',NULL),
('1ccb3343-319b-4a2d-8ef9-7669304941f8','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e3b08470-7359-44e1-a665-e1d6a44623b5'),
('24fd3320-17fb-41c1-a24b-5856795e3071','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e3b08470-7359-44e1-a665-e1d6a44623b5'),
('26c129eb-857a-44d3-a664-78847edf5ca9','address','openid-connect','oidc-address-mapper',NULL,'1dd2f0b5-8ce7-4caf-b792-330e5775fe9d'),
('28c7c64d-c1cf-4590-ace2-b6dbc3baaeea','full name','openid-connect','oidc-full-name-mapper',NULL,'e3b08470-7359-44e1-a665-e1d6a44623b5'),
('2b17a1c2-60e2-4716-bad2-2dbf2c9d17b4','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e3b08470-7359-44e1-a665-e1d6a44623b5'),
('2d1c881d-6805-4841-85a7-6911ab2164a7','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'ee3886d8-bbb3-44d0-806f-e2aa6b7a82aa'),
('2da52892-18ff-49f7-b572-bbb345b40f56','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','2232cc79-35ab-45ac-919a-97e7a9992854',NULL),
('384ceec0-0da8-4a91-bcb9-db8fe4e7f285','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e3b08470-7359-44e1-a665-e1d6a44623b5'),
('41bd55da-7c8b-4823-80eb-00a27ca3ba82','locale','openid-connect','oidc-usermodel-attribute-mapper','117e64fb-62c0-4c00-89e3-1adc91ab4ff0',NULL),
('427deeb5-6540-4f00-b79d-6aa00661b375','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'ee3886d8-bbb3-44d0-806f-e2aa6b7a82aa'),
('4844fd03-9218-42dc-b0b8-01300139c37e','audience resolve','openid-connect','oidc-audience-resolve-mapper','9ed8555f-966d-4ae7-bf03-0ad62de2ccde',NULL),
('4a11a1bc-01b9-42b5-b313-4a76c255115b','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e3b08470-7359-44e1-a665-e1d6a44623b5'),
('4c2dfca3-3884-4c23-b64f-1fd9c0f03292','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e3b08470-7359-44e1-a665-e1d6a44623b5'),
('50adacbc-3a21-4977-be45-36b13fb06e57','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'21dfeb2b-7c55-477a-a3b4-5907b5ea7f0c'),
('50f4d0ca-f465-42ba-a93a-f4ef58d5b067','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e3b08470-7359-44e1-a665-e1d6a44623b5'),
('5a07d51f-7d61-4475-ac5f-998451207926','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'e3b08470-7359-44e1-a665-e1d6a44623b5'),
('5cb914b1-6a0a-47af-8ea1-c9280cdcaf42','username','openid-connect','oidc-usermodel-property-mapper',NULL,'e3b08470-7359-44e1-a665-e1d6a44623b5'),
('5e5974d0-7751-428d-a7be-bc5e0c4abe9f','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e3b08470-7359-44e1-a665-e1d6a44623b5'),
('634133c7-bc3a-49d5-94ef-2547eb69e0f8','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'47a235dc-8132-490a-af85-af56e0cb8e1c'),
('795c7b4d-7a79-4290-9ccb-c898a7436dd6','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','2232cc79-35ab-45ac-919a-97e7a9992854',NULL),
('91acdc77-e9fa-4ff3-ad3e-12701bb0dc5f','email','openid-connect','oidc-usermodel-property-mapper',NULL,'73a3f96d-d0f7-4e59-8c97-ed38bf7f3332'),
('af7820e1-33c5-4589-ad70-950ef05bf422','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'73a3f96d-d0f7-4e59-8c97-ed38bf7f3332'),
('babcd2b8-c401-463a-8be3-20d9219aeecd','role list','saml','saml-role-list-mapper',NULL,'7e256bab-e1e2-421c-b745-583795aa974a'),
('d1f7edf7-d6bb-4841-be23-3087f17ca446','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'47a235dc-8132-490a-af85-af56e0cb8e1c'),
('d2c65e9e-cd7d-4fd6-8c39-5a0e50c8e09a','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'e3b08470-7359-44e1-a665-e1d6a44623b5'),
('df4c56f1-2b79-4301-9954-decab1939954','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'21dfeb2b-7c55-477a-a3b4-5907b5ea7f0c'),
('f3e7832a-1834-401f-bf3b-610e02b1f16f','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'e3b08470-7359-44e1-a665-e1d6a44623b5'),
('fcffc06e-e314-4942-9f63-c2dd7dff43bf','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'47a235dc-8132-490a-af85-af56e0cb8e1c');

/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table PROTOCOL_MAPPER_CONFIG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;

CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
                                          `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
                                          `VALUE` longtext DEFAULT NULL,
                                          `NAME` varchar(255) NOT NULL,
                                          PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
                                          CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;

INSERT INTO `PROTOCOL_MAPPER_CONFIG` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`)
VALUES
('006daf25-10cd-4ad2-9bb4-496e00f08e3a','true','access.token.claim'),
('006daf25-10cd-4ad2-9bb4-496e00f08e3a','false','id.token.claim'),
('006daf25-10cd-4ad2-9bb4-496e00f08e3a','confidential-connect','included.client.audience'),
('0405421f-eff2-4f73-bddd-d1bcdfa7279e','true','access.token.claim'),
('0405421f-eff2-4f73-bddd-d1bcdfa7279e','zoneinfo','claim.name'),
('0405421f-eff2-4f73-bddd-d1bcdfa7279e','true','id.token.claim'),
('0405421f-eff2-4f73-bddd-d1bcdfa7279e','String','jsonType.label'),
('0405421f-eff2-4f73-bddd-d1bcdfa7279e','zoneinfo','user.attribute'),
('0405421f-eff2-4f73-bddd-d1bcdfa7279e','true','userinfo.token.claim'),
('0f6efe22-f792-4fdc-b5c5-0320824bfcd3','true','access.token.claim'),
('0f6efe22-f792-4fdc-b5c5-0320824bfcd3','clientId','claim.name'),
('0f6efe22-f792-4fdc-b5c5-0320824bfcd3','true','id.token.claim'),
('0f6efe22-f792-4fdc-b5c5-0320824bfcd3','String','jsonType.label'),
('0f6efe22-f792-4fdc-b5c5-0320824bfcd3','clientId','user.session.note'),
('1ccb3343-319b-4a2d-8ef9-7669304941f8','true','access.token.claim'),
('1ccb3343-319b-4a2d-8ef9-7669304941f8','profile','claim.name'),
('1ccb3343-319b-4a2d-8ef9-7669304941f8','true','id.token.claim'),
('1ccb3343-319b-4a2d-8ef9-7669304941f8','String','jsonType.label'),
('1ccb3343-319b-4a2d-8ef9-7669304941f8','profile','user.attribute'),
('1ccb3343-319b-4a2d-8ef9-7669304941f8','true','userinfo.token.claim'),
('24fd3320-17fb-41c1-a24b-5856795e3071','true','access.token.claim'),
('24fd3320-17fb-41c1-a24b-5856795e3071','locale','claim.name'),
('24fd3320-17fb-41c1-a24b-5856795e3071','true','id.token.claim'),
('24fd3320-17fb-41c1-a24b-5856795e3071','String','jsonType.label'),
('24fd3320-17fb-41c1-a24b-5856795e3071','locale','user.attribute'),
('24fd3320-17fb-41c1-a24b-5856795e3071','true','userinfo.token.claim'),
('26c129eb-857a-44d3-a664-78847edf5ca9','true','access.token.claim'),
('26c129eb-857a-44d3-a664-78847edf5ca9','true','id.token.claim'),
('26c129eb-857a-44d3-a664-78847edf5ca9','country','user.attribute.country'),
('26c129eb-857a-44d3-a664-78847edf5ca9','formatted','user.attribute.formatted'),
('26c129eb-857a-44d3-a664-78847edf5ca9','locality','user.attribute.locality'),
('26c129eb-857a-44d3-a664-78847edf5ca9','postal_code','user.attribute.postal_code'),
('26c129eb-857a-44d3-a664-78847edf5ca9','region','user.attribute.region'),
('26c129eb-857a-44d3-a664-78847edf5ca9','street','user.attribute.street'),
('26c129eb-857a-44d3-a664-78847edf5ca9','true','userinfo.token.claim'),
('28c7c64d-c1cf-4590-ace2-b6dbc3baaeea','true','access.token.claim'),
('28c7c64d-c1cf-4590-ace2-b6dbc3baaeea','true','id.token.claim'),
('28c7c64d-c1cf-4590-ace2-b6dbc3baaeea','true','userinfo.token.claim'),
('2b17a1c2-60e2-4716-bad2-2dbf2c9d17b4','true','access.token.claim'),
('2b17a1c2-60e2-4716-bad2-2dbf2c9d17b4','birthdate','claim.name'),
('2b17a1c2-60e2-4716-bad2-2dbf2c9d17b4','true','id.token.claim'),
('2b17a1c2-60e2-4716-bad2-2dbf2c9d17b4','String','jsonType.label'),
('2b17a1c2-60e2-4716-bad2-2dbf2c9d17b4','birthdate','user.attribute'),
('2b17a1c2-60e2-4716-bad2-2dbf2c9d17b4','true','userinfo.token.claim'),
('2d1c881d-6805-4841-85a7-6911ab2164a7','true','access.token.claim'),
('2d1c881d-6805-4841-85a7-6911ab2164a7','upn','claim.name'),
('2d1c881d-6805-4841-85a7-6911ab2164a7','true','id.token.claim'),
('2d1c881d-6805-4841-85a7-6911ab2164a7','String','jsonType.label'),
('2d1c881d-6805-4841-85a7-6911ab2164a7','username','user.attribute'),
('2d1c881d-6805-4841-85a7-6911ab2164a7','true','userinfo.token.claim'),
('2da52892-18ff-49f7-b572-bbb345b40f56','true','access.token.claim'),
('2da52892-18ff-49f7-b572-bbb345b40f56','clientHost','claim.name'),
('2da52892-18ff-49f7-b572-bbb345b40f56','true','id.token.claim'),
('2da52892-18ff-49f7-b572-bbb345b40f56','String','jsonType.label'),
('2da52892-18ff-49f7-b572-bbb345b40f56','clientHost','user.session.note'),
('384ceec0-0da8-4a91-bcb9-db8fe4e7f285','true','access.token.claim'),
('384ceec0-0da8-4a91-bcb9-db8fe4e7f285','updated_at','claim.name'),
('384ceec0-0da8-4a91-bcb9-db8fe4e7f285','true','id.token.claim'),
('384ceec0-0da8-4a91-bcb9-db8fe4e7f285','String','jsonType.label'),
('384ceec0-0da8-4a91-bcb9-db8fe4e7f285','updatedAt','user.attribute'),
('384ceec0-0da8-4a91-bcb9-db8fe4e7f285','true','userinfo.token.claim'),
('41bd55da-7c8b-4823-80eb-00a27ca3ba82','true','access.token.claim'),
('41bd55da-7c8b-4823-80eb-00a27ca3ba82','locale','claim.name'),
('41bd55da-7c8b-4823-80eb-00a27ca3ba82','true','id.token.claim'),
('41bd55da-7c8b-4823-80eb-00a27ca3ba82','String','jsonType.label'),
('41bd55da-7c8b-4823-80eb-00a27ca3ba82','locale','user.attribute'),
('41bd55da-7c8b-4823-80eb-00a27ca3ba82','true','userinfo.token.claim'),
('427deeb5-6540-4f00-b79d-6aa00661b375','true','access.token.claim'),
('427deeb5-6540-4f00-b79d-6aa00661b375','groups','claim.name'),
('427deeb5-6540-4f00-b79d-6aa00661b375','true','id.token.claim'),
('427deeb5-6540-4f00-b79d-6aa00661b375','String','jsonType.label'),
('427deeb5-6540-4f00-b79d-6aa00661b375','true','multivalued'),
('427deeb5-6540-4f00-b79d-6aa00661b375','foo','user.attribute'),
('4a11a1bc-01b9-42b5-b313-4a76c255115b','true','access.token.claim'),
('4a11a1bc-01b9-42b5-b313-4a76c255115b','website','claim.name'),
('4a11a1bc-01b9-42b5-b313-4a76c255115b','true','id.token.claim'),
('4a11a1bc-01b9-42b5-b313-4a76c255115b','String','jsonType.label'),
('4a11a1bc-01b9-42b5-b313-4a76c255115b','website','user.attribute'),
('4a11a1bc-01b9-42b5-b313-4a76c255115b','true','userinfo.token.claim'),
('4c2dfca3-3884-4c23-b64f-1fd9c0f03292','true','access.token.claim'),
('4c2dfca3-3884-4c23-b64f-1fd9c0f03292','middle_name','claim.name'),
('4c2dfca3-3884-4c23-b64f-1fd9c0f03292','true','id.token.claim'),
('4c2dfca3-3884-4c23-b64f-1fd9c0f03292','String','jsonType.label'),
('4c2dfca3-3884-4c23-b64f-1fd9c0f03292','middleName','user.attribute'),
('4c2dfca3-3884-4c23-b64f-1fd9c0f03292','true','userinfo.token.claim'),
('50adacbc-3a21-4977-be45-36b13fb06e57','true','access.token.claim'),
('50adacbc-3a21-4977-be45-36b13fb06e57','phone_number','claim.name'),
('50adacbc-3a21-4977-be45-36b13fb06e57','true','id.token.claim'),
('50adacbc-3a21-4977-be45-36b13fb06e57','String','jsonType.label'),
('50adacbc-3a21-4977-be45-36b13fb06e57','phoneNumber','user.attribute'),
('50adacbc-3a21-4977-be45-36b13fb06e57','true','userinfo.token.claim'),
('50f4d0ca-f465-42ba-a93a-f4ef58d5b067','true','access.token.claim'),
('50f4d0ca-f465-42ba-a93a-f4ef58d5b067','gender','claim.name'),
('50f4d0ca-f465-42ba-a93a-f4ef58d5b067','true','id.token.claim'),
('50f4d0ca-f465-42ba-a93a-f4ef58d5b067','String','jsonType.label'),
('50f4d0ca-f465-42ba-a93a-f4ef58d5b067','gender','user.attribute'),
('50f4d0ca-f465-42ba-a93a-f4ef58d5b067','true','userinfo.token.claim'),
('5a07d51f-7d61-4475-ac5f-998451207926','true','access.token.claim'),
('5a07d51f-7d61-4475-ac5f-998451207926','given_name','claim.name'),
('5a07d51f-7d61-4475-ac5f-998451207926','true','id.token.claim'),
('5a07d51f-7d61-4475-ac5f-998451207926','String','jsonType.label'),
('5a07d51f-7d61-4475-ac5f-998451207926','firstName','user.attribute'),
('5a07d51f-7d61-4475-ac5f-998451207926','true','userinfo.token.claim'),
('5cb914b1-6a0a-47af-8ea1-c9280cdcaf42','true','access.token.claim'),
('5cb914b1-6a0a-47af-8ea1-c9280cdcaf42','preferred_username','claim.name'),
('5cb914b1-6a0a-47af-8ea1-c9280cdcaf42','true','id.token.claim'),
('5cb914b1-6a0a-47af-8ea1-c9280cdcaf42','String','jsonType.label'),
('5cb914b1-6a0a-47af-8ea1-c9280cdcaf42','username','user.attribute'),
('5cb914b1-6a0a-47af-8ea1-c9280cdcaf42','true','userinfo.token.claim'),
('5e5974d0-7751-428d-a7be-bc5e0c4abe9f','true','access.token.claim'),
('5e5974d0-7751-428d-a7be-bc5e0c4abe9f','picture','claim.name'),
('5e5974d0-7751-428d-a7be-bc5e0c4abe9f','true','id.token.claim'),
('5e5974d0-7751-428d-a7be-bc5e0c4abe9f','String','jsonType.label'),
('5e5974d0-7751-428d-a7be-bc5e0c4abe9f','picture','user.attribute'),
('5e5974d0-7751-428d-a7be-bc5e0c4abe9f','true','userinfo.token.claim'),
('634133c7-bc3a-49d5-94ef-2547eb69e0f8','true','access.token.claim'),
('634133c7-bc3a-49d5-94ef-2547eb69e0f8','realm_access.roles','claim.name'),
('634133c7-bc3a-49d5-94ef-2547eb69e0f8','String','jsonType.label'),
('634133c7-bc3a-49d5-94ef-2547eb69e0f8','true','multivalued'),
('634133c7-bc3a-49d5-94ef-2547eb69e0f8','foo','user.attribute'),
('795c7b4d-7a79-4290-9ccb-c898a7436dd6','true','access.token.claim'),
('795c7b4d-7a79-4290-9ccb-c898a7436dd6','clientAddress','claim.name'),
('795c7b4d-7a79-4290-9ccb-c898a7436dd6','true','id.token.claim'),
('795c7b4d-7a79-4290-9ccb-c898a7436dd6','String','jsonType.label'),
('795c7b4d-7a79-4290-9ccb-c898a7436dd6','clientAddress','user.session.note'),
('91acdc77-e9fa-4ff3-ad3e-12701bb0dc5f','true','access.token.claim'),
('91acdc77-e9fa-4ff3-ad3e-12701bb0dc5f','email','claim.name'),
('91acdc77-e9fa-4ff3-ad3e-12701bb0dc5f','true','id.token.claim'),
('91acdc77-e9fa-4ff3-ad3e-12701bb0dc5f','String','jsonType.label'),
('91acdc77-e9fa-4ff3-ad3e-12701bb0dc5f','email','user.attribute'),
('91acdc77-e9fa-4ff3-ad3e-12701bb0dc5f','true','userinfo.token.claim'),
('af7820e1-33c5-4589-ad70-950ef05bf422','true','access.token.claim'),
('af7820e1-33c5-4589-ad70-950ef05bf422','email_verified','claim.name'),
('af7820e1-33c5-4589-ad70-950ef05bf422','true','id.token.claim'),
('af7820e1-33c5-4589-ad70-950ef05bf422','boolean','jsonType.label'),
('af7820e1-33c5-4589-ad70-950ef05bf422','emailVerified','user.attribute'),
('af7820e1-33c5-4589-ad70-950ef05bf422','true','userinfo.token.claim'),
('babcd2b8-c401-463a-8be3-20d9219aeecd','Role','attribute.name'),
('babcd2b8-c401-463a-8be3-20d9219aeecd','Basic','attribute.nameformat'),
('babcd2b8-c401-463a-8be3-20d9219aeecd','false','single'),
('d2c65e9e-cd7d-4fd6-8c39-5a0e50c8e09a','true','access.token.claim'),
('d2c65e9e-cd7d-4fd6-8c39-5a0e50c8e09a','family_name','claim.name'),
('d2c65e9e-cd7d-4fd6-8c39-5a0e50c8e09a','true','id.token.claim'),
('d2c65e9e-cd7d-4fd6-8c39-5a0e50c8e09a','String','jsonType.label'),
('d2c65e9e-cd7d-4fd6-8c39-5a0e50c8e09a','lastName','user.attribute'),
('d2c65e9e-cd7d-4fd6-8c39-5a0e50c8e09a','true','userinfo.token.claim'),
('df4c56f1-2b79-4301-9954-decab1939954','true','access.token.claim'),
('df4c56f1-2b79-4301-9954-decab1939954','phone_number_verified','claim.name'),
('df4c56f1-2b79-4301-9954-decab1939954','true','id.token.claim'),
('df4c56f1-2b79-4301-9954-decab1939954','boolean','jsonType.label'),
('df4c56f1-2b79-4301-9954-decab1939954','phoneNumberVerified','user.attribute'),
('df4c56f1-2b79-4301-9954-decab1939954','true','userinfo.token.claim'),
('f3e7832a-1834-401f-bf3b-610e02b1f16f','true','access.token.claim'),
('f3e7832a-1834-401f-bf3b-610e02b1f16f','nickname','claim.name'),
('f3e7832a-1834-401f-bf3b-610e02b1f16f','true','id.token.claim'),
('f3e7832a-1834-401f-bf3b-610e02b1f16f','String','jsonType.label'),
('f3e7832a-1834-401f-bf3b-610e02b1f16f','nickname','user.attribute'),
('f3e7832a-1834-401f-bf3b-610e02b1f16f','true','userinfo.token.claim'),
('fcffc06e-e314-4942-9f63-c2dd7dff43bf','true','access.token.claim'),
('fcffc06e-e314-4942-9f63-c2dd7dff43bf','resource_access.${client_id}.roles','claim.name'),
('fcffc06e-e314-4942-9f63-c2dd7dff43bf','String','jsonType.label'),
('fcffc06e-e314-4942-9f63-c2dd7dff43bf','true','multivalued'),
('fcffc06e-e314-4942-9f63-c2dd7dff43bf','foo','user.attribute');

/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table REALM
# ------------------------------------------------------------

DROP TABLE IF EXISTS `REALM`;

CREATE TABLE `REALM` (
                         `ID` varchar(36) NOT NULL,
                         `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
                         `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
                         `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
                         `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
                         `ADMIN_THEME` varchar(255) DEFAULT NULL,
                         `EMAIL_THEME` varchar(255) DEFAULT NULL,
                         `ENABLED` bit(1) NOT NULL DEFAULT b'0',
                         `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                         `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
                         `LOGIN_THEME` varchar(255) DEFAULT NULL,
                         `NAME` varchar(255) DEFAULT NULL,
                         `NOT_BEFORE` int(11) DEFAULT NULL,
                         `PASSWORD_POLICY` text DEFAULT NULL,
                         `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
                         `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
                         `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
                         `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
                         `SSL_REQUIRED` varchar(255) DEFAULT NULL,
                         `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
                         `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
                         `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
                         `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
                         `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
                         `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
                         `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                         `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
                         `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
                         `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                         `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                         `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
                         `OTP_POLICY_COUNTER` int(11) DEFAULT 0,
                         `OTP_POLICY_WINDOW` int(11) DEFAULT 1,
                         `OTP_POLICY_PERIOD` int(11) DEFAULT 30,
                         `OTP_POLICY_DIGITS` int(11) DEFAULT 6,
                         `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
                         `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
                         `BROWSER_FLOW` varchar(36) DEFAULT NULL,
                         `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
                         `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
                         `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
                         `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
                         `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT 0,
                         `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
                         `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT 0,
                         `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
                         `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
                         `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
                         `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT 0,
                         `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
                         `SSO_MAX_LIFESPAN_REMEMBER_ME` int(11) NOT NULL,
                         `SSO_IDLE_TIMEOUT_REMEMBER_ME` int(11) NOT NULL,
                         `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
                         PRIMARY KEY (`ID`),
                         UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
                         KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;

INSERT INTO `REALM` (`ID`, `ACCESS_CODE_LIFESPAN`, `USER_ACTION_LIFESPAN`, `ACCESS_TOKEN_LIFESPAN`, `ACCOUNT_THEME`, `ADMIN_THEME`, `EMAIL_THEME`, `ENABLED`, `EVENTS_ENABLED`, `EVENTS_EXPIRATION`, `LOGIN_THEME`, `NAME`, `NOT_BEFORE`, `PASSWORD_POLICY`, `REGISTRATION_ALLOWED`, `REMEMBER_ME`, `RESET_PASSWORD_ALLOWED`, `SOCIAL`, `SSL_REQUIRED`, `SSO_IDLE_TIMEOUT`, `SSO_MAX_LIFESPAN`, `UPDATE_PROFILE_ON_SOC_LOGIN`, `VERIFY_EMAIL`, `MASTER_ADMIN_CLIENT`, `LOGIN_LIFESPAN`, `INTERNATIONALIZATION_ENABLED`, `DEFAULT_LOCALE`, `REG_EMAIL_AS_USERNAME`, `ADMIN_EVENTS_ENABLED`, `ADMIN_EVENTS_DETAILS_ENABLED`, `EDIT_USERNAME_ALLOWED`, `OTP_POLICY_COUNTER`, `OTP_POLICY_WINDOW`, `OTP_POLICY_PERIOD`, `OTP_POLICY_DIGITS`, `OTP_POLICY_ALG`, `OTP_POLICY_TYPE`, `BROWSER_FLOW`, `REGISTRATION_FLOW`, `DIRECT_GRANT_FLOW`, `RESET_CREDENTIALS_FLOW`, `CLIENT_AUTH_FLOW`, `OFFLINE_SESSION_IDLE_TIMEOUT`, `REVOKE_REFRESH_TOKEN`, `ACCESS_TOKEN_LIFE_IMPLICIT`, `LOGIN_WITH_EMAIL_ALLOWED`, `DUPLICATE_EMAILS_ALLOWED`, `DOCKER_AUTH_FLOW`, `REFRESH_TOKEN_MAX_REUSE`, `ALLOW_USER_MANAGED_ACCESS`, `SSO_MAX_LIFESPAN_REMEMBER_ME`, `SSO_IDLE_TIMEOUT_REMEMBER_ME`, `DEFAULT_ROLE`)
VALUES
('master',60,300,60,NULL,NULL,NULL,b'1',b'0',0,NULL,'master',0,NULL,b'0',b'0',b'0',b'0','EXTERNAL',1800,36000,b'0',b'0','985b4a5c-b574-4cfa-8ce2-6c7194f6bc59',1800,b'0',NULL,b'0',b'0',b'0',b'0',0,1,30,6,'HmacSHA1','totp','e9ab4e66-32e7-4a00-a10a-43ece6fa323b','661121d3-9f9c-4c89-b44e-3caccbfa9f4b','fc49b494-8d74-4a5d-b9f0-f096c641f72a','a5b17112-cca7-42b2-bf47-dc8aa9612b1c','69b91c80-8f71-46a8-bc8e-47fcaf7acc19',2592000,b'0',900,b'1',b'0','03775cdc-1c4b-4f4f-814b-5b50a05d61e0',0,b'0',0,0,'c8ac7bca-0ca0-4e41-9a99-9e713515d15c');

/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table REALM_ATTRIBUTE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;

CREATE TABLE `REALM_ATTRIBUTE` (
                                   `NAME` varchar(255) NOT NULL,
                                   `REALM_ID` varchar(36) NOT NULL,
                                   `VALUE` longtext CHARACTER SET utf8mb3 DEFAULT NULL,
                                   PRIMARY KEY (`NAME`,`REALM_ID`),
                                   KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
                                   CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;

INSERT INTO `REALM_ATTRIBUTE` (`NAME`, `REALM_ID`, `VALUE`)
VALUES
('bruteForceProtected','master','false'),
('client-policies.policies','master','{\"policies\":[]}'),
('client-policies.profiles','master','{\"profiles\":[]}'),
('defaultSignatureAlgorithm','master','RS256'),
('displayName','master','Keycloak'),
('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),
('failureFactor','master','30'),
('maxDeltaTimeSeconds','master','43200'),
('maxFailureWaitSeconds','master','900'),
('minimumQuickLoginWaitSeconds','master','60'),
('offlineSessionMaxLifespan','master','5184000'),
('offlineSessionMaxLifespanEnabled','master','false'),
('permanentLockout','master','false'),
('quickLoginCheckMilliSeconds','master','1000'),
('waitIncrementSeconds','master','60'),
('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),
('_browser_header.contentSecurityPolicyReportOnly','master',''),
('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),
('_browser_header.xContentTypeOptions','master','nosniff'),
('_browser_header.xFrameOptions','master','SAMEORIGIN'),
('_browser_header.xRobotsTag','master','none'),
('_browser_header.xXSSProtection','master','1; mode=block');

/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table REALM_DEFAULT_GROUPS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;

CREATE TABLE `REALM_DEFAULT_GROUPS` (
                                        `REALM_ID` varchar(36) NOT NULL,
                                        `GROUP_ID` varchar(36) NOT NULL,
                                        PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
                                        UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
                                        KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
                                        CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table REALM_ENABLED_EVENT_TYPES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;

CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
                                             `REALM_ID` varchar(36) NOT NULL,
                                             `VALUE` varchar(255) NOT NULL,
                                             PRIMARY KEY (`REALM_ID`,`VALUE`),
                                             KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
                                             CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table REALM_EVENTS_LISTENERS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;

CREATE TABLE `REALM_EVENTS_LISTENERS` (
                                          `REALM_ID` varchar(36) NOT NULL,
                                          `VALUE` varchar(255) NOT NULL,
                                          PRIMARY KEY (`REALM_ID`,`VALUE`),
                                          KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
                                          CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;

INSERT INTO `REALM_EVENTS_LISTENERS` (`REALM_ID`, `VALUE`)
VALUES
('master','jboss-logging');

/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table REALM_LOCALIZATIONS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;

CREATE TABLE `REALM_LOCALIZATIONS` (
                                       `REALM_ID` varchar(255) NOT NULL,
                                       `LOCALE` varchar(255) NOT NULL,
                                       `TEXTS` longtext CHARACTER SET utf8mb3 NOT NULL,
                                       PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table REALM_REQUIRED_CREDENTIAL
# ------------------------------------------------------------

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;

CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
                                             `TYPE` varchar(255) NOT NULL,
                                             `FORM_LABEL` varchar(255) DEFAULT NULL,
                                             `INPUT` bit(1) NOT NULL DEFAULT b'0',
                                             `SECRET` bit(1) NOT NULL DEFAULT b'0',
                                             `REALM_ID` varchar(36) NOT NULL,
                                             PRIMARY KEY (`REALM_ID`,`TYPE`),
                                             CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;

INSERT INTO `REALM_REQUIRED_CREDENTIAL` (`TYPE`, `FORM_LABEL`, `INPUT`, `SECRET`, `REALM_ID`)
VALUES
('password','password',b'1',b'1','master');

/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table REALM_SMTP_CONFIG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;

CREATE TABLE `REALM_SMTP_CONFIG` (
                                     `REALM_ID` varchar(36) NOT NULL,
                                     `VALUE` varchar(255) DEFAULT NULL,
                                     `NAME` varchar(255) NOT NULL,
                                     PRIMARY KEY (`REALM_ID`,`NAME`),
                                     CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table REALM_SUPPORTED_LOCALES
# ------------------------------------------------------------

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;

CREATE TABLE `REALM_SUPPORTED_LOCALES` (
                                           `REALM_ID` varchar(36) NOT NULL,
                                           `VALUE` varchar(255) NOT NULL,
                                           PRIMARY KEY (`REALM_ID`,`VALUE`),
                                           KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
                                           CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table REDIRECT_URIS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `REDIRECT_URIS`;

CREATE TABLE `REDIRECT_URIS` (
                                 `CLIENT_ID` varchar(36) NOT NULL,
                                 `VALUE` varchar(255) NOT NULL,
                                 PRIMARY KEY (`CLIENT_ID`,`VALUE`),
                                 KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
                                 CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;

INSERT INTO `REDIRECT_URIS` (`CLIENT_ID`, `VALUE`)
VALUES
('117e64fb-62c0-4c00-89e3-1adc91ab4ff0','/admin/master/console/*'),
('2232cc79-35ab-45ac-919a-97e7a9992854','reparcar.fr'),
('9ed8555f-966d-4ae7-bf03-0ad62de2ccde','/realms/master/account/*'),
('ce9d3a13-6e02-43b7-8082-e57755d4f987','/realms/master/account/*');

/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table REQUIRED_ACTION_CONFIG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;

CREATE TABLE `REQUIRED_ACTION_CONFIG` (
                                          `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
                                          `VALUE` longtext DEFAULT NULL,
                                          `NAME` varchar(255) NOT NULL,
                                          PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table REQUIRED_ACTION_PROVIDER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;

CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
                                            `ID` varchar(36) NOT NULL,
                                            `ALIAS` varchar(255) DEFAULT NULL,
                                            `NAME` varchar(255) DEFAULT NULL,
                                            `REALM_ID` varchar(36) DEFAULT NULL,
                                            `ENABLED` bit(1) NOT NULL DEFAULT b'0',
                                            `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
                                            `PROVIDER_ID` varchar(255) DEFAULT NULL,
                                            `PRIORITY` int(11) DEFAULT NULL,
                                            PRIMARY KEY (`ID`),
                                            KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
                                            CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;

INSERT INTO `REQUIRED_ACTION_PROVIDER` (`ID`, `ALIAS`, `NAME`, `REALM_ID`, `ENABLED`, `DEFAULT_ACTION`, `PROVIDER_ID`, `PRIORITY`)
VALUES
('05d984cf-d0c7-456c-808f-9a278a62e1c8','CONFIGURE_TOTP','Configure OTP','master',b'1',b'0','CONFIGURE_TOTP',10),
('4392755c-da18-45ad-96c2-fd0728d91ea9','UPDATE_PROFILE','Update Profile','master',b'1',b'0','UPDATE_PROFILE',40),
('48f529ef-e6b8-4dab-90dd-3cb886150e6c','UPDATE_PASSWORD','Update Password','master',b'1',b'0','UPDATE_PASSWORD',30),
('b57c2af5-ff75-4dc1-9d06-634ca344af64','delete_account','Delete Account','master',b'0',b'0','delete_account',60),
('c83e3b1e-765a-46e9-9d40-e98be1c01740','VERIFY_EMAIL','Verify Email','master',b'1',b'0','VERIFY_EMAIL',50),
('c9fdc251-5fd1-4101-a1c7-9916b8504a6e','update_user_locale','Update User Locale','master',b'1',b'0','update_user_locale',1000),
('cb73824b-74fe-4529-91ff-1fc333681214','terms_and_conditions','Terms and Conditions','master',b'0',b'0','terms_and_conditions',20);

/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table RESOURCE_ATTRIBUTE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;

CREATE TABLE `RESOURCE_ATTRIBUTE` (
                                      `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
                                      `NAME` varchar(255) NOT NULL,
                                      `VALUE` varchar(255) DEFAULT NULL,
                                      `RESOURCE_ID` varchar(36) NOT NULL,
                                      PRIMARY KEY (`ID`),
                                      KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
                                      CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table RESOURCE_POLICY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RESOURCE_POLICY`;

CREATE TABLE `RESOURCE_POLICY` (
                                   `RESOURCE_ID` varchar(36) NOT NULL,
                                   `POLICY_ID` varchar(36) NOT NULL,
                                   PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
                                   KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
                                   CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
                                   CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table RESOURCE_SCOPE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;

CREATE TABLE `RESOURCE_SCOPE` (
                                  `RESOURCE_ID` varchar(36) NOT NULL,
                                  `SCOPE_ID` varchar(36) NOT NULL,
                                  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
                                  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
                                  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
                                  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table RESOURCE_SERVER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RESOURCE_SERVER`;

CREATE TABLE `RESOURCE_SERVER` (
                                   `ID` varchar(36) NOT NULL,
                                   `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
                                   `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
                                   `DECISION_STRATEGY` tinyint(4) NOT NULL DEFAULT 1,
                                   PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table RESOURCE_SERVER_PERM_TICKET
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;

CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
                                               `ID` varchar(36) NOT NULL,
                                               `OWNER` varchar(255) DEFAULT NULL,
                                               `REQUESTER` varchar(255) DEFAULT NULL,
                                               `CREATED_TIMESTAMP` bigint(20) NOT NULL,
                                               `GRANTED_TIMESTAMP` bigint(20) DEFAULT NULL,
                                               `RESOURCE_ID` varchar(36) NOT NULL,
                                               `SCOPE_ID` varchar(36) DEFAULT NULL,
                                               `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
                                               `POLICY_ID` varchar(36) DEFAULT NULL,
                                               PRIMARY KEY (`ID`),
                                               UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
                                               KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
                                               KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
                                               KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
                                               KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
                                               CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
                                               CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
                                               CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
                                               CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table RESOURCE_SERVER_POLICY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;

CREATE TABLE `RESOURCE_SERVER_POLICY` (
                                          `ID` varchar(36) NOT NULL,
                                          `NAME` varchar(255) NOT NULL,
                                          `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
                                          `TYPE` varchar(255) NOT NULL,
                                          `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
                                          `LOGIC` varchar(20) DEFAULT NULL,
                                          `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
                                          `OWNER` varchar(255) DEFAULT NULL,
                                          PRIMARY KEY (`ID`),
                                          UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
                                          KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
                                          CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table RESOURCE_SERVER_RESOURCE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;

CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
                                            `ID` varchar(36) NOT NULL,
                                            `NAME` varchar(255) NOT NULL,
                                            `TYPE` varchar(255) DEFAULT NULL,
                                            `ICON_URI` varchar(255) DEFAULT NULL,
                                            `OWNER` varchar(255) DEFAULT NULL,
                                            `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
                                            `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
                                            `DISPLAY_NAME` varchar(255) DEFAULT NULL,
                                            PRIMARY KEY (`ID`),
                                            UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
                                            KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
                                            CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table RESOURCE_SERVER_SCOPE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;

CREATE TABLE `RESOURCE_SERVER_SCOPE` (
                                         `ID` varchar(36) NOT NULL,
                                         `NAME` varchar(255) NOT NULL,
                                         `ICON_URI` varchar(255) DEFAULT NULL,
                                         `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
                                         `DISPLAY_NAME` varchar(255) DEFAULT NULL,
                                         PRIMARY KEY (`ID`),
                                         UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
                                         KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
                                         CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table RESOURCE_URIS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RESOURCE_URIS`;

CREATE TABLE `RESOURCE_URIS` (
                                 `RESOURCE_ID` varchar(36) NOT NULL,
                                 `VALUE` varchar(255) NOT NULL,
                                 PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
                                 CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table ROLE_ATTRIBUTE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;

CREATE TABLE `ROLE_ATTRIBUTE` (
                                  `ID` varchar(36) NOT NULL,
                                  `ROLE_ID` varchar(36) NOT NULL,
                                  `NAME` varchar(255) NOT NULL,
                                  `VALUE` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
                                  PRIMARY KEY (`ID`),
                                  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
                                  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table SCOPE_MAPPING
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SCOPE_MAPPING`;

CREATE TABLE `SCOPE_MAPPING` (
                                 `CLIENT_ID` varchar(36) NOT NULL,
                                 `ROLE_ID` varchar(36) NOT NULL,
                                 PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
                                 KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
                                 CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;

INSERT INTO `SCOPE_MAPPING` (`CLIENT_ID`, `ROLE_ID`)
VALUES
('9ed8555f-966d-4ae7-bf03-0ad62de2ccde','448772ba-17b4-4e32-9620-03624adf23d9');

/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table SCOPE_POLICY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SCOPE_POLICY`;

CREATE TABLE `SCOPE_POLICY` (
                                `SCOPE_ID` varchar(36) NOT NULL,
                                `POLICY_ID` varchar(36) NOT NULL,
                                PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
                                KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
                                CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
                                CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table USER_ATTRIBUTE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;

CREATE TABLE `USER_ATTRIBUTE` (
                                  `NAME` varchar(255) NOT NULL,
                                  `VALUE` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
                                  `USER_ID` varchar(36) NOT NULL,
                                  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
                                  PRIMARY KEY (`ID`),
                                  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
                                  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
                                  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table USER_CONSENT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER_CONSENT`;

CREATE TABLE `USER_CONSENT` (
                                `ID` varchar(36) NOT NULL,
                                `CLIENT_ID` varchar(255) DEFAULT NULL,
                                `USER_ID` varchar(36) NOT NULL,
                                `CREATED_DATE` bigint(20) DEFAULT NULL,
                                `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
                                `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
                                `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
                                PRIMARY KEY (`ID`),
                                UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
                                KEY `IDX_USER_CONSENT` (`USER_ID`),
                                CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table USER_CONSENT_CLIENT_SCOPE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;

CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
                                             `USER_CONSENT_ID` varchar(36) NOT NULL,
                                             `SCOPE_ID` varchar(36) NOT NULL,
                                             PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
                                             KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
                                             CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table USER_ENTITY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER_ENTITY`;

CREATE TABLE `USER_ENTITY` (
                               `ID` varchar(36) NOT NULL,
                               `EMAIL` varchar(255) DEFAULT NULL,
                               `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
                               `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
                               `ENABLED` bit(1) NOT NULL DEFAULT b'0',
                               `FEDERATION_LINK` varchar(255) DEFAULT NULL,
                               `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
                               `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
                               `REALM_ID` varchar(255) DEFAULT NULL,
                               `USERNAME` varchar(255) CHARACTER SET utf8mb3 DEFAULT NULL,
                               `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
                               `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
                               `NOT_BEFORE` int(11) NOT NULL DEFAULT 0,
                               PRIMARY KEY (`ID`),
                               UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
                               UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
                               KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;

INSERT INTO `USER_ENTITY` (`ID`, `EMAIL`, `EMAIL_CONSTRAINT`, `EMAIL_VERIFIED`, `ENABLED`, `FEDERATION_LINK`, `FIRST_NAME`, `LAST_NAME`, `REALM_ID`, `USERNAME`, `CREATED_TIMESTAMP`, `SERVICE_ACCOUNT_CLIENT_LINK`, `NOT_BEFORE`)
VALUES
('cd224585-11ed-492b-b4e5-bd01d6e5493f',NULL,'b7ff888f-842d-4f2c-8782-b3ed6ea41618',b'0',b'1',NULL,NULL,NULL,'master','service-account-reparcar-connect',1641999716868,'2232cc79-35ab-45ac-919a-97e7a9992854',0),
('f668f69c-5238-483b-b695-c2e0cb477541',NULL,'468bdf1f-27c4-4efd-bd2e-8c972db66c5e',b'0',b'1',NULL,NULL,NULL,'master','admin',1641980983199,NULL,0);

/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table USER_FEDERATION_CONFIG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;

CREATE TABLE `USER_FEDERATION_CONFIG` (
                                          `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
                                          `VALUE` varchar(255) DEFAULT NULL,
                                          `NAME` varchar(255) NOT NULL,
                                          PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
                                          CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table USER_FEDERATION_MAPPER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;

CREATE TABLE `USER_FEDERATION_MAPPER` (
                                          `ID` varchar(36) NOT NULL,
                                          `NAME` varchar(255) NOT NULL,
                                          `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
                                          `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
                                          `REALM_ID` varchar(36) NOT NULL,
                                          PRIMARY KEY (`ID`),
                                          KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
                                          KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
                                          CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
                                          CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table USER_FEDERATION_MAPPER_CONFIG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;

CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
                                                 `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
                                                 `VALUE` varchar(255) DEFAULT NULL,
                                                 `NAME` varchar(255) NOT NULL,
                                                 PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
                                                 CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table USER_FEDERATION_PROVIDER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;

CREATE TABLE `USER_FEDERATION_PROVIDER` (
                                            `ID` varchar(36) NOT NULL,
                                            `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
                                            `DISPLAY_NAME` varchar(255) DEFAULT NULL,
                                            `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
                                            `LAST_SYNC` int(11) DEFAULT NULL,
                                            `PRIORITY` int(11) DEFAULT NULL,
                                            `PROVIDER_NAME` varchar(255) DEFAULT NULL,
                                            `REALM_ID` varchar(36) DEFAULT NULL,
                                            PRIMARY KEY (`ID`),
                                            KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
                                            CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table USER_GROUP_MEMBERSHIP
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;

CREATE TABLE `USER_GROUP_MEMBERSHIP` (
                                         `GROUP_ID` varchar(36) NOT NULL,
                                         `USER_ID` varchar(36) NOT NULL,
                                         PRIMARY KEY (`GROUP_ID`,`USER_ID`),
                                         KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
                                         CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table USER_REQUIRED_ACTION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;

CREATE TABLE `USER_REQUIRED_ACTION` (
                                        `USER_ID` varchar(36) NOT NULL,
                                        `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
                                        PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
                                        KEY `IDX_USER_REQACTIONS` (`USER_ID`),
                                        CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table USER_ROLE_MAPPING
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;

CREATE TABLE `USER_ROLE_MAPPING` (
                                     `ROLE_ID` varchar(255) NOT NULL,
                                     `USER_ID` varchar(36) NOT NULL,
                                     PRIMARY KEY (`ROLE_ID`,`USER_ID`),
                                     KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
                                     CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;

INSERT INTO `USER_ROLE_MAPPING` (`ROLE_ID`, `USER_ID`)
VALUES
('87ae2de1-7902-45c6-9b48-833682fe698d','f668f69c-5238-483b-b695-c2e0cb477541'),
('c8ac7bca-0ca0-4e41-9a99-9e713515d15c','cd224585-11ed-492b-b4e5-bd01d6e5493f'),
('c8ac7bca-0ca0-4e41-9a99-9e713515d15c','f668f69c-5238-483b-b695-c2e0cb477541');

/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table USER_SESSION
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER_SESSION`;

CREATE TABLE `USER_SESSION` (
                                `ID` varchar(36) NOT NULL,
                                `AUTH_METHOD` varchar(255) DEFAULT NULL,
                                `IP_ADDRESS` varchar(255) DEFAULT NULL,
                                `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
                                `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
                                `REALM_ID` varchar(255) DEFAULT NULL,
                                `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
                                `STARTED` int(11) DEFAULT NULL,
                                `USER_ID` varchar(255) DEFAULT NULL,
                                `USER_SESSION_STATE` int(11) DEFAULT NULL,
                                `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
                                `BROKER_USER_ID` varchar(255) DEFAULT NULL,
                                PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table USER_SESSION_NOTE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;

CREATE TABLE `USER_SESSION_NOTE` (
                                     `USER_SESSION` varchar(36) NOT NULL,
                                     `NAME` varchar(255) NOT NULL,
                                     `VALUE` text DEFAULT NULL,
                                     PRIMARY KEY (`USER_SESSION`,`NAME`),
                                     CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table USERNAME_LOGIN_FAILURE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;

CREATE TABLE `USERNAME_LOGIN_FAILURE` (
                                          `REALM_ID` varchar(36) NOT NULL,
                                          `USERNAME` varchar(255) CHARACTER SET utf8mb3 NOT NULL,
                                          `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
                                          `LAST_FAILURE` bigint(20) DEFAULT NULL,
                                          `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
                                          `NUM_FAILURES` int(11) DEFAULT NULL,
                                          PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table WEB_ORIGINS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `WEB_ORIGINS`;

CREATE TABLE `WEB_ORIGINS` (
                               `CLIENT_ID` varchar(36) NOT NULL,
                               `VALUE` varchar(255) NOT NULL,
                               PRIMARY KEY (`CLIENT_ID`,`VALUE`),
                               KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
                               CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;

INSERT INTO `WEB_ORIGINS` (`CLIENT_ID`, `VALUE`)
VALUES
('117e64fb-62c0-4c00-89e3-1adc91ab4ff0','+'),
('2232cc79-35ab-45ac-919a-97e7a9992854','*');

/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
