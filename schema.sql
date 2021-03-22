CREATE TABLE "users" (
  "id" int PRIMARY KEY,
  "email" varchar,
  "user_name" varchar,
  "created_at" varchar
);

CREATE TABLE "events" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "location" varchar,
  "event_date" datetime,
  "group_amount" int,
  "host_id" int,
  "created_at" datetime DEFAULT (now())
);

CREATE TABLE "event_user_list" (
  "user_id" int,
  "event_id" int,
  "status" varchar DEFAULT 1
);

CREATE TABLE "groups" (
  "group_id" int,
  "group_number" int,
  "event_id" int,
  "user_id" int,
  "is_host" boolean,
  "time_slot" datetime
);

ALTER TABLE "events" ADD FOREIGN KEY ("host_id") REFERENCES "users" ("id");

ALTER TABLE "event_user_list" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "event_user_list" ADD FOREIGN KEY ("event_id") REFERENCES "events" ("id");

ALTER TABLE "groups" ADD FOREIGN KEY ("event_id") REFERENCES "events" ("id");

ALTER TABLE "groups" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

COMMENT ON COLUMN "users"."created_at" IS 'When order created';
