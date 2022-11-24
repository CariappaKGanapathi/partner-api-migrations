ALTER TABLE "partners"
ADD COLUMN "home_city" text NOT NULL,
ADD COLUMN "user_id" int4 NOT NULL,
ADD COLUMN "latitude" text,
ADD COLUMN "longitude" text,
ADD COLUMN "owner_doctor_id" int4;