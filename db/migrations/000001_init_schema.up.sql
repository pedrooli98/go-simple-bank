CREATE SCHEMA "simplebank";

CREATE TABLE "simplebank"."accounts" (
  "id" bigserial PRIMARY KEY,
  "owner" varchar NOT NULL,
  "balance" bigint NOT NULL,
  "currency" varchar NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "simplebank"."entries" (
  "id" bigserial PRIMARY KEY,
  "account_id" bigint,
  "amount" bigint NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "simplebank"."transfers" (
  "id" bigserial PRIMARY KEY,
  "from_account_id" bigint,
  "to_account_id" bigint,
  "amount" bigint NOT NULL,
  "name" varchar,
  "created_at" timestamp NOT NULL DEFAULT (now())
);

CREATE INDEX ON "simplebank"."accounts" ("owner");

CREATE INDEX ON "simplebank"."entries" ("account_id");

CREATE INDEX ON "simplebank"."transfers" ("from_account_id");

CREATE INDEX ON "simplebank"."transfers" ("to_account_id");

CREATE INDEX ON "simplebank"."transfers" ("from_account_id", "to_account_id");

COMMENT ON COLUMN "simplebank"."entries"."amount" IS 'can be negative or positive';

COMMENT ON COLUMN "simplebank"."transfers"."amount" IS 'can only be positive';

ALTER TABLE "simplebank"."entries" ADD FOREIGN KEY ("account_id") REFERENCES "simplebank"."accounts" ("id");

ALTER TABLE "simplebank"."transfers" ADD FOREIGN KEY ("from_account_id") REFERENCES "simplebank"."accounts" ("id");

ALTER TABLE "simplebank"."transfers" ADD FOREIGN KEY ("to_account_id") REFERENCES "simplebank"."accounts" ("id");
