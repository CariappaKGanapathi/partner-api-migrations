CREATE SEQUENCE IF NOT EXISTS partners_id_seq;

CREATE TABLE "partners" (
    "id" int4 NOT NULL DEFAULT nextval('partners_id_seq'::regclass),
    "created_by" int4,
    "created_on" timestamp,
    "updated_by" int4,
    "updated_on" timestamp,
    "deleted_by" int4,
    "deleted_on" timestamptz,
    "unique_partner_id" text,
    "partner_code" text,
    "status" int4,
    "legal_name" text,
    "partner_name" text,
    "partner_pan" text,
    "partner_gst" text,
    "partner_cin" text,
    "partner_tan" text,
    "partner_contact_name" text,
    "partner_contact_number" text,
    "partner_contact_email" text,
    "partner_billing_email" text,
    "partner_report_email" text,
    "autofill_location" text,
    "address" text,
    "partnership_nature" text,
    "report_format" int4 NOT NULL DEFAULT 2,
    "is_reference_number_required" int4,
    "reference_field_title" text,
    "validity" text,
    "payment_type" text,
    "b2_b" bool,
    "category" text,
    "sub_category" text,
    "test_price_list_id" int4,
    "billing_cycle" int4,
    "communication_preferences" json,
    "category_a_discount" numeric,
    "category_a_discount_type" text,
    "category_b_discount" numeric,
    "category_b_discount_type" text,
    "category_c_discount" numeric,
    "category_c_discount_type" text,
    "prepaid_balance" numeric,
    "pending_amount" numeric,
    "total_billing" numeric,
    "total_orders" int4,
    "doctor_registration_number" text,
    "partner_meta" json,
    "has_collection_charge" int4,
    "credit_limit" numeric,
    "credit_period" int4,
    "cobranded_image_url" text,
    "sales_poc_email" text,
    PRIMARY KEY ("id")
);

CREATE SEQUENCE IF NOT EXISTS partner_references_id_seq;

CREATE TABLE "partner_references" (
    "id" int4 NOT NULL DEFAULT nextval('partner_references_id_seq'::regclass),
    "created_by" int4,
    "created_on" timestamptz,
    "updated_by" int4,
    "updated_on" timestamptz,
    "deleted_by" int4,
    "deleted_at" timestamptz,
    "partner_id" int4 NOT NULL,
    "reference" text NOT NULL,
    CONSTRAINT "partner_references_partner_id_partners_id_foreign" FOREIGN KEY ("partner_id") REFERENCES "public"."partners"("id") ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY ("id")
);

CREATE SEQUENCE IF NOT EXISTS partner_reference_files_id_seq;

CREATE TABLE "partner_reference_files" (
    "id" int4 NOT NULL DEFAULT nextval('partner_reference_files_id_seq'::regclass),
    "created_by" int4,
    "created_on" timestamptz,
    "updated_by" int4,
    "updated_on" timestamptz,
    "deleted_by" int4,
    "deleted_at" timestamptz,
    "partner_id" int4 NOT NULL,
    "reference_file" text NOT NULL,
    "file_name" text NOT NULL,
    CONSTRAINT "partner_reference_files_partner_id_partners_id_foreign" FOREIGN KEY ("partner_id") REFERENCES "public"."partners"("id") ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY ("id")
);

CREATE SEQUENCE IF NOT EXISTS partner_invoices_id_seq;

CREATE TABLE "partner_invoices" (
    "invoice_number" text,
    "partner_id" int4,
    "start_date" timestamptz,
    "end_date" timestamptz,
    "amount" numeric,
    "consolidated_charges" numeric,
    "invoice_url" text,
    "invoice_statement_url" text,
    "file_reference" text,
    "statement_file_reference" text,
    "payment_status" int4,
    "paid_on" timestamptz,
    "payment_meta_data" bytea,
    "system_payment_id" int4,
    "system_payment_link" text,
    "payment_due_date" timestamptz,
    "id" int4 NOT NULL DEFAULT nextval('partner_invoices_id_seq'::regclass),
    "created_by" int4,
    "created_at" timestamptz,
    "updated_by" int4,
    "updated_on" timestamptz,
    "deleted_by" int4,
    "deleted_at" timestamptz,
    PRIMARY KEY ("id")
);

