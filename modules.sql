CREATE TABLE "branch" (
  "id" UUID PRIMARY KEY ,
  "name" varchar,
  "branch_code" varchar NOT NULL,
  "address" varchar,
  "phone_number" varchar,
  "created_at" timestamp DEFAULT (CURRENT_TIMESTAMP),
  "updated_at" timestamp
);


CREATE TABLE "market" (
  "id" UUID PRIMARY KEY ,
  "name" varchar,
  "branch_id" UUID REFERENCES  "branch"("id"),
  "created_at" timestamp DEFAULT (CURRENT_TIMESTAMP),
  "updated_at" timestamp
);


CREATE TABLE "staff" (
  "id" UUID PRIMARY KEY ,
  "name" varchar,
  "surname" varchar,
  "phone_number" varchar,
  "login" varchar,
  "password" varchar,
  "user_type" varchar,
  "market_id" UUID REFERENCES  "market"("id"),
  "created_at" timestamp DEFAULT (CURRENT_TIMESTAMP),
  "updated_at" timestamp
);


CREATE TABLE "provider" (
  "id" UUID PRIMARY KEY ,
  "name" varchar,
  "phone_number" varchar,
  "active" boolean default true,
  "created_at" timestamp DEFAULT (CURRENT_TIMESTAMP),
  "updated_at" timestamp
);


CREATE TABLE "brand" (
  "id" UUID PRIMARY KEY ,
  "photo" varchar,
  "name" varchar(45),
  "created_at" timestamp DEFAULT (CURRENT_TIMESTAMP),
  "updated_at" timestamp
);

CREATE TABLE "category" (
  "id" UUID PRIMARY KEY,
  "name" varchar(45),
  "parent_id" UUID REFERENCES  "category"("id"),
  "brand_id" UUID REFERENCES  "brand"("id"),
  "created_at" timestamp DEFAULT (CURRENT_TIMESTAMP),
  "updated_at" timestamp
);



CREATE TABLE "product" (
  "id" UUID PRIMARY KEY ,
  "photo" varchar,
  "name" varchar(45),
  "category_id" UUID REFERENCES  "category"("id"),
  "brand_id" UUID REFERENCES  "brand"("id"),
  "bar_code" varchar unique,
  "price" NUMERIC ,
  "created_at" timestamp DEFAULT (CURRENT_TIMESTAMP),
  "updated_at" timestamp
);



CREATE TABLE "arrival_product" (
 "id" UUID PRIMARY KEY,
  "category_id" UUID  NOT NULL,
  "brand_id" UUID  NOT NULL,
  "product_id" UUID  NOT NULL,
  "bar_code" varchar unique,
  "count" int,
  "price" NUMERIC ,
  "arrival_id" varchar REFERENCES "arrival"("id"),
  "created_at" timestamp DEFAULT (CURRENT_TIMESTAMP),
  "updated_at" timestamp
);


CREATE TABLE "arrival" (
  "id" UUID PRIMARY KEY ,
  "branch_id" UUID NOT NULL,
  "provider_id"  UUID  NOT NULL,
  "status" varchar DEFAULT 'in_proccess',
  "arrival_product_id"  UUID REFERENCES  "arrival_product"("id"),
  "arrival_id" varchar unique,
  "created_at" timestamp DEFAULT (CURRENT_TIMESTAMP),
  "updated_at" timestamp
);



CREATE TABLE "remainder" (
 "id" UUID PRIMARY KEY ,
  "branch_id" UUID  NOT NULL,
  "category_id" UUID  NOT NULL,
  "brand_id" UUID  NOT NULL,
  "product_id" UUID  NOT NULL,
  "bar_code" varchar unique,
  "count" int,
  "price" NUMERIC ,
  "created_at" timestamp DEFAULT (CURRENT_TIMESTAMP),
  "updated_at" timestamp
);


CREATE TABLE "transaction" (
 "id" UUID PRIMARY KEY ,
 "cash" NUMERIC,
 "uzcard" NUMERIC,
 "payme" NUMERIC,
 "click" NUMERIC,
 "humo" NUMERIC,
 "apelsin" NUMERIC,
  "total_price" NUMERIC ,
  "created_at" timestamp DEFAULT (CURRENT_TIMESTAMP),
  "updated_at" timestamp
);



CREATE TABLE "shift" (
  "id" UUID PRIMARY KEY ,
  "branch_id" UUID  NOT NULL,
  "staff_id" UUID  NOT NULL,
  "provider_id"  UUID  NOT NULL,
  "market_id"  UUID  NOT NULL,
  "status" varchar,
  "transaction_id"  UUID REFERENCES  "transaction"("id"),
  "shift_id" varchar unique,
  "created_at" timestamp DEFAULT (CURRENT_TIMESTAMP),
  "updated_at" timestamp
);


CREATE TABLE "sale_product" (
 "id" UUID PRIMARY KEY,
  "brand_id" UUID  NOT NULL,
  "product_id" UUID  NOT NULL,
  "category_id" UUID  NOT NULL,
  "bar_code" varchar unique,
  "remainder_id" UUID  NOT NULL,
  "count" int,
  "price" NUMERIC ,
  "total_price" NUMERIC ,
  "created_at" timestamp DEFAULT (CURRENT_TIMESTAMP),
  "updated_at" timestamp
);





CREATE TABLE "sales" (
 "id" UUID PRIMARY KEY ,
  "branch_id" UUID  NOT NULL,
  "shift_id" UUID REFERENCES  "shift"("id"),
  "market_id"  UUID  NOT NULL,
  "staff_id"  UUID  NOT NULL,
    "status" varchar,
    "sale_product_id"  UUID REFERENCES  "sale_product"("id"),
    "payment_id" UUID REFERENCES  "payment"("id"),
    "sale_id" varchar unique,
  "created_at" timestamp DEFAULT (CURRENT_TIMESTAMP),
  "updated_at" timestamp
);

CREATE TABLE "payment" (
 "id" UUID PRIMARY KEY ,
 "cash" NUMERIC,
 "uzcard" NUMERIC,
 "payme" NUMERIC,
 "click" NUMERIC,
 "humo" NUMERIC,
 "apelsin" NUMERIC,
 "visa" NUMERIC,
 "currency" varchar,
 "exchange_sum" NUMERIC,
  "total_price" NUMERIC ,
  "created_at" timestamp DEFAULT (CURRENT_TIMESTAMP),
  "updated_at" timestamp
);


