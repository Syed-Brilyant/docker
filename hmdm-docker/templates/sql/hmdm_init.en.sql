UPDATE userroles SET name='Super-Admin', description='Can sign in as any user. In shared mode, manages corporate accounts' WHERE id=1;
UPDATE userroles SET name='Admin', description='Full access to the control panel' WHERE id=2;
UPDATE userroles SET name='User', description='Limited access to the control panel' WHERE id=3;
UPDATE userroles SET name='Observer', description='Read-only access to the control panel' WHERE id=100;

UPDATE users SET email='_ADMIN_EMAIL_', passwordReset=true, passwordResetToken=md5(random()::text) WHERE id=1;

UPDATE groups SET name='General' WHERE id=1;

UPDATE permissions SET description='Super-administrator functions for the whole system' WHERE id=1;
UPDATE permissions SET description='Access to system settings' WHERE id=2;
UPDATE permissions SET description='Access to configurations, applications and files' WHERE id=3;
UPDATE permissions SET description='Access to devices' WHERE id=4;
UPDATE permissions SET description='Access to image removal (image plugin)' WHERE id=100;

UPDATE plugins SET name='Images', description='Retrieve images from devices' WHERE id=1;

INSERT INTO settings (id, backgroundcolor, textcolor, backgroundimageurl, iconsize, desktopheader, customerid, usedefaultlanguage, language) VALUES (1, '#1c40e3', '#fcfcfc', NULL, 'SMALL', 'NO_HEADER', 1, true, NULL);

INSERT INTO userrolesettings (id, roleid, customerid, columndisplayeddevicestatus, columndisplayeddevicedate, columndisplayeddevicenumber, columndisplayeddevicemodel, columndisplayeddevicepermissionsstatus, columndisplayeddeviceappinstallstatus, columndisplayeddeviceconfiguration, columndisplayeddeviceimei, columndisplayeddevicephone, columndisplayeddevicedesc, columndisplayeddevicegroup, columndisplayedlauncherversion) VALUES 
(1, 1, 1, true, true, true, NULL, true, true, true, NULL, NULL, NULL, NULL, NULL),
(2, 2, 1, true, true, true, NULL, true, true, true, NULL, NULL, NULL, NULL, NULL),
(3, 3, 1, true, true, true, NULL, true, true, true, NULL, NULL, NULL, NULL, NULL),
(4, 100, 1, true, true, true, NULL, true, true, true, NULL, NULL, NULL, NULL, NULL);

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);

ALTER TABLE applications DROP CONSTRAINT applications_latestversion_fkey;

INSERT INTO applications (id, pkg, name, showicon, customerid, system, latestversion, runafterinstall) VALUES 
    (1, 'com.android.systemui', 'System UI', false, 1, true, 10000, false),
    (2, 'com.android.bluetooth', 'Bluetooth Service', false, 1, true, 10001, false),
    (3, 'com.google.android.gms', 'Google Services', false, 1, true, 10002, false),
    (34, 'com.android.email', 'Email client', true, 1, true, 10033, false),
    (9, 'com.android.chrome', 'Chrome Browser', true, 1, true, 10008, false),
    (10, 'com.sec.android.app.browser', 'Browser (Samsung)', true, 1, true, 10009, false),
    (11, 'com.samsung.android.video', 'Samsung Video', false, 1, true, 10010, false),
    (12, 'com.android.providers.media', 'Media Service', false, 1, true, 10011, false),
    (13, 'com.android.gallery3d', 'Gallery', true, 1, true, 10012, false),
    (14, 'com.sec.android.gallery3d', 'Gallery (Samsung)', true, 1, true, 10013, false),
    (15, 'com.android.vending', 'Google Payment support', false, 1, true, 10014, false),
    (16, 'com.samsung.android.app.memo', 'Notes (Samsung)', true, 1, true, 10015, false),
    (35, 'com.android.documentsui', 'File manager extension', false, 1, true, 10034, false),
    (5, 'com.google.android.packageinstaller', 'Package installer (Google)', false, 1, true, 10004, false),
    (17, 'com.android.packageinstaller', 'Package Installer', false, 1, true, 10016, false),
    (18, 'com.samsung.android.calendar', 'Calendar (Samsung)', true, 1, true, 10017, false),
    (19, 'com.android.calculator2', 'Calculator (generic)', true, 1, true, 10018, false),
    (20, 'com.sec.android.app.popupcalculator', 'Calculator (Samsung)', true, 1, true, 10019, false),
    (21, 'com.android.camera', 'Camera (generic)', true, 1, true, 10020, false),
    (22, 'com.huawei.camera', 'Camera (Huawei)', true, 1, true, 10021, false),
    (23, 'org.codeaurora.snapcam', 'Camera (Lenovo)', true, 1, true, 10022, false),
    (24, 'com.mediatek.camera', 'Camera (Mediatek)', true, 1, true, 10023, false),
    (25, 'com.sec.android.app.camera', 'Camera (Samsung, legacy)', true, 1, true, 10024, false),
    (26, 'com.sec.android.camera', 'Camera (Samsung)', true, 1, true, 10025, false),
    (27, 'com.google.android.apps.maps', 'Google Maps', true, 1, true, 10026, false),
    (28, 'com.touchtype.swiftkey', 'Swiftkey keyboard extension', false, 1, true, 10027, false),
    (29, 'com.android.contacts', 'Contacts', true, 1, true, 10028, false),
    (31, 'com.sec.android.app.myfiles', 'File Manager (Samsung)', true, 1, true, 10030, false),
    (32, 'com.android.settings', 'Settings (usually must be disabled!)', false, 1, true, 10031, false),
    (33, 'com.sec.android.inputmethod', 'Keyboard settings (Samsung)', false, 1, true, 10032, false),
    (36, 'com.samsung.android.email.provider', 'Email service (Samsung)', false, 1, true, 10035, false),
    (37, 'android', 'Android system package', false, 1, true, 10036, false),
    (38, 'com.android.mms', 'Messaging (generic)', true, 1, true, 10037, false),
    (39, 'com.google.android.apps.messaging', 'Messaging (Google)', true, 1, true, 10038, false),
    (40, 'com.android.dialer', 'Phone (generic UI)', true, 1, true, 10039, false),
    (41, 'com.sec.phone', 'Phone (Samsung)', true, 1, true, 10040, false),
    (42, 'com.android.phone', 'Phone (generic service)', true, 1, true, 10041, false),
    (43, 'com.huaqin.filemanager', 'File manager (Lenovo)', true, 1, true, 10042, false),
    (6, 'com.google.android.apps.photos', 'Gallery (Google)', true, 1, true, 10005, false),
    (4, 'com.google.android.apps.docs', 'Google Drive', true, 1, true, 10003, false),
    (30, 'com.huawei.android.launcher', 'Default launcher (Huawei)', false, 1, true, 10029, false),
    (8, 'com.android.browser', 'Browser (generic)', true, 1, true, 10007, false),
    (46, 'com.hmdm.launcher', 'Headwind MDM', false, 1, false, 10045, false),
    (47, 'com.huawei.android.internal.app', 'Huawei Launcher Selector', false, 1, true, 10046, false),
    (48, 'com.hmdm.pager', 'Headwind MDM Pager Plugin', true, 1, false, 10047, false),
    (49, 'com.hmdm.phoneproxy', 'Dialer Helper', true, 1, false, 10048, false),
    (50, 'com.hmdm.emuilauncherrestarter', 'Headwind MDM update helper', false, 1, false, 10049, false),
    (51, 'com.miui.cleanmaster', 'MIUI Clean Master', false, 1, true, 10050, false),
    (52, 'com.miui.gallery', 'MIUI Gallery', true, 1, true, 10051, false),
    (53, 'com.miui.notes', 'MIUI Notes', true, 1, true, 10052, false),
    (54, 'com.miui.global.packageinstaller', 'MIUI Package Installer', false, 1, true, 10053, false),
    (55, 'com.miui.msa.global', 'MIUI Permissions Manager', false, 1, true, 10054, false),
    (56, 'com.miui.securitycenter', 'MIUI Security Center', false, 1, true, 10055, false),
    (57, 'com.xiaomi.discover', 'Xiaomi Updater', false, 1, true, 10056, false),
    (58, 'com.google.android.permissioncontroller', 'Permission Controller', false, 1, true, 10057, false),
    (59, 'com.samsung.accessibility', 'Samsung Accessibility', false, 1, true, 10058, false),
	(60, 'com.android.updater', 'System Update Service', false, 1, true, 10059, false),
	(61, 'com.android.printspooler', 'Print Service', false, 1, true, 10060, false),
	(62, 'com.google.android.documentsui', 'File Manager Extension (Google)', false, 1, true, 10061, false),
	(63, 'com.google.android.contacts', 'Contacts (Google)', true, 1, true, 10062, false),
	(64, 'com.google.android.dialer', 'Dialer (Google)', true, 1, true, 10063, false),
	(65, 'com.samsung.android.app.notes', 'Samsung Notes', true, 1, true, 10064, false),
	(66, 'com.hmdglobal.camera2', 'Nokia Camera (new)', true, 1, true, 10065, false),
	(67, 'com.hmdglobal.app.camera', 'Nokia Camera', true, 1, true, 10066, false),
	(68, 'com.samsung.android.dialer', 'Samsung Dialer', true, 1, true, 10067, false),
	(69, 'com.samsung.android.app.contacts', 'Samsung Contacts', true, 1, true, 10068, false),
	(70, 'com.samsung.android.messaging', 'Samsung Messaging', false, 1, true, 10069, false),
	(71, 'com.sec.android.app.launcher', 'Samsung Launcher (for Recents)', false, 1, true, 10070, false),
	(72, 'com.google.android.apps.photos', 'Photos (Google)', true, 1, true, 10071, false),
	(73, 'com.google.android.apps.nbu.files', 'File Manager (Google)', true, 1, true, 10072, false),
	(74, 'com.android.settings.intelligence', 'Samsung Search Settings', false, 1, true, 10073, false),
	(75, 'com.huawei.bluetooth', 'Huawei Bluetooth', false, 1, true, 10074, false),
	(76, 'com.google.android.gms.setup', 'Google Services Setup', false, 1, true, 10075, false),
	(77, 'com.samsung.android.app.telephonyui', 'Samsung Telephony', false, 1, true, 10076, false);

SELECT pg_catalog.setval('public.applications_id_seq', 77, true);

INSERT INTO applicationversions (id, applicationid, version, url) VALUES 
    (10000, 1, '0', NULL),
    (10001, 2, '0', NULL),
    (10002, 3, '0', NULL),
    (10003, 4, '0', NULL),
    (10004, 5, '0', NULL),
    (10005, 6, '0', NULL),
    (10007, 8, '0', NULL),
    (10008, 9, '0', NULL),
    (10009, 10, '0', NULL),
    (10010, 11, '0', NULL),
    (10011, 12, '0', NULL),
    (10012, 13, '0', NULL),
    (10013, 14, '0', NULL),
    (10014, 15, '0', NULL),
    (10015, 16, '0', NULL),
    (10016, 17, '0', NULL),
    (10017, 18, '0', NULL),
    (10018, 19, '0', NULL),
    (10019, 20, '0', NULL),
    (10020, 21, '0', NULL),
    (10021, 22, '0', NULL),
    (10022, 23, '0', NULL),
    (10023, 24, '0', NULL),
    (10024, 25, '0', NULL),
    (10025, 26, '0', NULL),
    (10026, 27, '0', NULL),
    (10027, 28, '0', NULL),
    (10028, 29, '0', NULL),
    (10029, 30, '0', NULL),
    (10030, 31, '0', NULL),
    (10031, 32, '0', NULL),
    (10032, 33, '0', NULL),
    (10033, 34, '0', NULL),
    (10034, 35, '0', NULL),
    (10035, 36, '0', NULL),
    (10036, 37, '0', NULL),
    (10037, 38, '0', NULL),
    (10038, 39, '0', NULL),
    (10039, 40, '0', NULL),
    (10040, 41, '0', NULL),
    (10041, 42, '0', NULL),
    (10042, 43, '0', NULL),
    (10045, 46, '_HMDM_VERSION_', 'https://h-mdm.com/files/hmdm-_HMDM_VERSION_-_HMDM_VARIANT_.apk'),
    (10046, 47, '0', NULL),
    (10047, 48, '1.01', 'https://h-mdm.com/files/pager-1.01.apk'),
    (10048, 49, '1.02', 'https://h-mdm.com/files/phoneproxy-1.02.apk'),
    (10049, 50, '1.04', 'https://h-mdm.com/files/LauncherRestarter-1.04.apk'),
    (10050, 51, '0', NULL),
    (10051, 52, '0', NULL),
    (10052, 53, '0', NULL),
    (10053, 54, '0', NULL),
    (10054, 55, '0', NULL),
    (10055, 56, '0', NULL),
    (10056, 57, '0', NULL),
    (10057, 58, '0', NULL),
	(10058, 59, '0', NULL),
    (10059, 60, '0', NULL),
    (10060, 61, '0', NULL),
    (10061, 62, '0', NULL),
    (10062, 63, '0', NULL),
    (10063, 64, '0', NULL),
    (10064, 65, '0', NULL),
    (10065, 66, '0', NULL),
    (10066, 67, '0', NULL),
    (10067, 68, '0', NULL),
    (10068, 69, '0', NULL),
    (10069, 70, '0', NULL),
    (10070, 71, '0', NULL),
    (10071, 72, '0', NULL),
    (10072, 73, '0', NULL),
    (10073, 74, '0', NULL),
    (10074, 75, '0', NULL),
    (10075, 76, '0', NULL),
    (10076, 77, '0', NULL);
    
SELECT pg_catalog.setval('public.applicationversions_id_seq', 10076, true);

ALTER TABLE applications ADD CONSTRAINT applications_latestversion_fkey FOREIGN KEY (latestversion) REFERENCES applicationversions(id) ON DELETE SET NULL;
    
DELETE FROM configurations;
INSERT INTO configurations (id, name, description, type, password, backgroundcolor, textcolor, backgroundimageurl, iconsize, desktopheader, usedefaultdesignsettings, customerid, gps, bluetooth, wifi, mobiledata, mainappid, eventreceivingcomponent, kioskmode, qrcodekey, contentappid,autoupdate, blockstatusbar, systemupdatetype, systemupdatefrom, systemupdateto, pushoptions) VALUES 
(1, 'Common - Minimal', 'Suitable for generic Android devices; minimum of apps installed', 0, '12345678', '', '', NULL, 'SMALL', 'NO_HEADER', true, 1, NULL, NULL, NULL, NULL, 10045, 'com.hmdm.launcher.AdminReceiver', false, '6fb9c8dc81483173a0c0e9f8b2e46be1', NULL, false, false, 0, NULL, NULL, 'mqttAlarm'),
(2, 'MIUI (Xiaomi Redmi)', 'Optimized for MIUI-running devices', 0, '12345678', '', '', NULL, 'SMALL', 'NO_HEADER', true, 1, NULL, NULL, NULL, NULL, 10045, 'com.hmdm.launcher.AdminReceiver', false, '8e6ca072ddb926a1af61578dfa9fc334', NULL, false, false, 0, NULL, NULL, 'mqttAlarm');

SELECT pg_catalog.setval('public.configurations_id_seq', 2, true);

INSERT INTO configurationapplications (id, configurationid, applicationid, remove, showicon, applicationversionid) VALUES 
    (2, 1, 8, false, true, 10007),
    (3, 1, 37, false, false, 10036),
    (4, 1, 2, false, false, 10001),
    (5, 1, 10, false, true, 10009),
    (6, 1, 19, false, false, 10018),
    (7, 1, 20, false, false, 10019),
    (8, 1, 18, false, false, 10017),
    (9, 1, 21, false, true, 10020),
    (10, 1, 22, false, true, 10021),
    (11, 1, 23, false, true, 10022),
    (12, 1, 24, false, true, 10023),
    (13, 1, 26, false, true, 10025),
    (14, 1, 25, false, true, 10024),
    (15, 1, 9, false, true, 10008),
    (16, 1, 29, false, true, 10028),
    (17, 1, 30, false, false, 10029),
    (18, 1, 34, false, true, 10033),
    (19, 1, 36, false, false, 10035),
    (20, 1, 35, false, false, 10034),
    (21, 1, 43, false, false, 10042),
    (22, 1, 31, false, false, 10030),
    (23, 1, 13, false, false, 10012),
    (24, 1, 6, false, false, 10005),
    (25, 1, 14, false, false, 10013),
    (26, 1, 4, false, false, 10003),
    (27, 1, 27, false, false, 10026),
    (28, 1, 15, false, false, 10014),
    (29, 1, 3, false, false, 10002),
    (30, 1, 33, false, false, 10032),
    (31, 1, 12, false, false, 10011),
    (32, 1, 38, false, true, 10037),
    (33, 1, 39, false, true, 10038),
    (34, 1, 16, false, false, 10015),
    (35, 1, 5, false, false, 10004),
    (36, 1, 17, false, false, 10016),
    (37, 1, 42, false, true, 10041),
    (38, 1, 40, false, true, 10039),
    (39, 1, 41, false, true, 10040),
    (40, 1, 11, false, false, 10010),
    (41, 1, 28, false, false, 10027),
    (42, 1, 1, false, false, 10000),
    (43, 1, 46, false, false, 10045),
    (44, 1, 47, false, false, 10046),
    (45, 1, 48, false, true, 10047),
    (46, 1, 50, false, false, 10049),
    (48, 2, 8, false, true, 10007),
    (49, 2, 37, false, false, 10036),
    (50, 2, 2, false, false, 10001),
    (51, 2, 21, false, true, 10020),
    (52, 2, 9, false, true, 10008),
    (53, 2, 29, false, true, 10028),
    (54, 2, 34, false, true, 10033),
    (55, 2, 35, false, false, 10034),
    (56, 2, 13, false, false, 10012),
    (57, 2, 6, false, false, 10005),
    (58, 2, 4, false, false, 10003),
    (59, 2, 27, false, false, 10026),
    (60, 2, 15, false, false, 10014),
    (61, 2, 3, false, false, 10002),
    (62, 2, 12, false, false, 10011),
    (63, 2, 38, false, true, 10037),
    (64, 2, 39, false, true, 10038),
    (65, 2, 5, false, false, 10004),
    (66, 2, 17, false, false, 10016),
    (67, 2, 42, false, true, 10041),
    (68, 2, 40, false, true, 10039),
    (69, 2, 28, false, false, 10027),
    (70, 2, 1, false, false, 10000),
    (71, 2, 46, false, false, 10045),
    (72, 2, 48, false, true, 10047),
    (73, 2, 49, false, true, 10048),
    (74, 2, 50, false, false, 10049),
    (75, 2, 51, false, false, 10050),
    (76, 2, 52, false, false, 10051),
    (77, 2, 53, false, false, 10052),
    (78, 2, 54, false, false, 10053),
    (79, 2, 55, false, false, 10054),
    (80, 2, 56, false, false, 10055),
    (81, 2, 57, false, false, 10056),
	(82, 1, 59, false, false, 10058),
    (83, 1, 60, false, false, 10059),
    (84, 1, 61, false, false, 10060),
    (85, 1, 62, false, false, 10061),
    (86, 1, 63, false, true, 10062),
    (87, 1, 64, false, true, 10063),
    (88, 1, 66, false, true, 10065),
    (89, 1, 67, false, true, 10066),
    (90, 1, 68, false, true, 10067),
    (91, 1, 69, false, true, 10068),
    (92, 1, 71, false, false, 10070),
    (93, 1, 74, false, false, 10073),
    (94, 1, 75, false, false, 10074),
    (95, 1, 76, false, false, 10075),
    (96, 1, 77, false, false, 10076);
    
SELECT pg_catalog.setval('public.configurationapplications_id_seq', 96, true);

INSERT INTO devices (id, number, description, lastupdate, configurationid, oldconfigurationid, info, imei, phone, customerid) VALUES (1, 'h0001', 'My first Android device', 0, 1, NULL, NULL, NULL, NULL, 1);

SELECT pg_catalog.setval('public.devices_id_seq', 1, true);

INSERT INTO plugin_devicelog_settings_rules (id, settingid, name, active, applicationid, severity) VALUES (1, 1, 'Headwind MDM', true, 46, 'VERBOSE');
SELECT pg_catalog.setval('public.plugin_devicelog_settings_rules_id_seq', 1, true);

