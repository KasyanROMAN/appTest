BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "captcha_captchastore" (
	"challenge"	varchar(32) NOT NULL,
	"response"	varchar(32) NOT NULL,
	"hashkey"	varchar(40) NOT NULL UNIQUE,
	"expiration"	datetime NOT NULL,
	"id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "comment" (
	"id"	integer NOT NULL,
	"user_name"	varchar(50) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"home_page"	varchar(200),
	"text"	text NOT NULL,
	"created_at"	datetime NOT NULL,
	"parent_id"	bigint,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("parent_id") REFERENCES "comment"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_comment','Can add comment');
INSERT INTO "auth_permission" VALUES (26,7,'change_comment','Can change comment');
INSERT INTO "auth_permission" VALUES (27,7,'delete_comment','Can delete comment');
INSERT INTO "auth_permission" VALUES (28,7,'view_comment','Can view comment');
INSERT INTO "auth_permission" VALUES (29,8,'add_captchastore','Can add captcha store');
INSERT INTO "auth_permission" VALUES (30,8,'change_captchastore','Can change captcha store');
INSERT INTO "auth_permission" VALUES (31,8,'delete_captchastore','Can delete captcha store');
INSERT INTO "auth_permission" VALUES (32,8,'view_captchastore','Can view captcha store');
INSERT INTO "captcha_captchastore" VALUES ('PAMQ','pamq','a0409aacd18e54b5c98813b341a705d394cb5bcc','2025-03-26 11:33:55.403535',2);
INSERT INTO "captcha_captchastore" VALUES ('ZMDL','zmdl','91058f76ddf06857583a8df3417ab42f81cfae1a','2025-03-26 11:34:10.538063',3);
INSERT INTO "comment" VALUES (1,'Roma','awddw@gmail.com',NULL,'wadadaw','2025-03-26 11:28:53.656448',NULL);
INSERT INTO "comment" VALUES (2,'Roma','Adwwd@gmail.com',NULL,'awdwda','2025-03-26 11:29:25.553628',1);
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'post','comment');
INSERT INTO "django_content_type" VALUES (8,'captcha','captchastore');
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2025-03-26 11:25:26.804941');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2025-03-26 11:25:26.810510');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2025-03-26 11:25:26.815339');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2025-03-26 11:25:26.819442');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2025-03-26 11:25:26.821890');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2025-03-26 11:25:26.830737');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2025-03-26 11:25:26.834497');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2025-03-26 11:25:26.838045');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2025-03-26 11:25:26.841019');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2025-03-26 11:25:26.845419');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2025-03-26 11:25:26.845929');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2025-03-26 11:25:26.848136');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2025-03-26 11:25:26.851747');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2025-03-26 11:25:26.855062');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2025-03-26 11:25:26.860270');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2025-03-26 11:25:26.862599');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2025-03-26 11:25:26.866374');
INSERT INTO "django_migrations" VALUES (18,'captcha','0001_initial','2025-03-26 11:25:26.867414');
INSERT INTO "django_migrations" VALUES (19,'captcha','0002_alter_captchastore_id','2025-03-26 11:25:26.869108');
INSERT INTO "django_migrations" VALUES (20,'post','0001_initial','2025-03-26 11:25:26.871153');
INSERT INTO "django_migrations" VALUES (21,'post','0002_post_image','2025-03-26 11:25:26.873149');
INSERT INTO "django_migrations" VALUES (22,'post','0003_alter_post_image','2025-03-26 11:25:26.876707');
INSERT INTO "django_migrations" VALUES (23,'post','0004_remove_post_image','2025-03-26 11:25:26.878786');
INSERT INTO "django_migrations" VALUES (24,'post','0005_rename_post_comment','2025-03-26 11:25:26.885708');
INSERT INTO "django_migrations" VALUES (25,'post','0006_alter_comment_table','2025-03-26 11:25:26.887493');
INSERT INTO "django_migrations" VALUES (26,'sessions','0001_initial','2025-03-26 11:25:26.889428');
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "post_comment_created_at_f23c5164" ON "comment" (
	"created_at"
);
CREATE INDEX IF NOT EXISTS "post_comment_email_157b9bae" ON "comment" (
	"email"
);
CREATE INDEX IF NOT EXISTS "post_comment_parent_id_cf69c90a" ON "comment" (
	"parent_id"
);
CREATE INDEX IF NOT EXISTS "post_comment_user_name_4d6a1b29" ON "comment" (
	"user_name"
);
COMMIT;
