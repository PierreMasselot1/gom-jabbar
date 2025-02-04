CREATE TABLE "caribou" (
    "id" SERIAL PRIMARY KEY,
    "email" VARCHAR(255) NOT NULL UNIQUE,
    "password" VARCHAR(255) NOT NULL,
    "img" VARCHAR(255),
    "name" VARCHAR(255) NOT NULL,
    "antler_exchange_status" BOOLEAN DEFAULT false
) WITH (OIDS = FALSE);
CREATE TABLE "inbox" (
    "id" SERIAL PRIMARY KEY ,
    "user1_id" integer NOT NULL,
    "user2_id" integer NOT NULL,
    UNIQUE ("user1_id","user2_id"),
    "seen1" BOOLEAN DEFAULT false,
    "seen2" BOOLEAN DEFAULT false,
    CONSTRAINT "inbox_fk0" FOREIGN KEY ("user1_id") REFERENCES "caribou"("id"),
    CONSTRAINT "inbox_fk1" FOREIGN KEY ("user2_id") REFERENCES "caribou"("id")
) WITH (OIDS = FALSE);
CREATE TABLE "message" (
    "id" serial NOT NULL,
    "inbox_id" integer NOT NULL,
    "sender_id" integer NOT NULL,
    "receiver_id" integer NOT NULL,
    "message" VARCHAR(255) NOT NULL,
    "created_timestamp" timestamp not NULL DEFAULT current_timestamp,
    "file" VARCHAR(255),
    "meta" VARCHAR(255),
    CONSTRAINT "message_pk" PRIMARY KEY ("id"),
    CONSTRAINT "message_fk0" FOREIGN KEY ("inbox_id") REFERENCES "inbox"("id"),
    CONSTRAINT "message_fk1" FOREIGN KEY ("sender_id") REFERENCES "caribou"("id"),
    CONSTRAINT "message_fk2" FOREIGN KEY ("receiver_id") REFERENCES "caribou"("id")
) WITH (OIDS = FALSE);
CREATE TABLE "human" (
    "id" serial NOT NULL,
    "trashing_level" float NOT NULL,
    "excitment_level" float NOT NULL,
    "lat" float NOT NULL,
    "lng" float NOT NULL,
    CONSTRAINT "human_pk" PRIMARY KEY ("id")
) WITH (OIDS = FALSE);

INSERT INTO caribou ("email", "password", "name","antler_exchange_status")
VALUES (
        'georgecari@gmail.com',
        'verysecurepassword',
        'George',
        'true'
    ),
    (
        'caribou-orgcarib@ihch.com',
        'verysecurepassword',
        'Oliver',
        'true'
    ),
    (
        'humanavoider1234-carib@yahoo.com',
        'verysecurepassword',
        'Benjamin',
        'true'
    ),
    (
        'humanhunter-carib@cahaap.ca',
        'verysecurepassword',
        'Hunter',
        'true'
    ),
    (
        'chatter1carib@cahaap.ca',
        'verysecurepassword',
        'Chatter 1',
        'true'
    ),
    (
        'chatter2-carib@cahaap.ca',
        'verysecurepassword',
        'Chatter 2',
        'true'
    ),
    
    (
        'tester@gmail.com',
        'verysecurepassword',
        'Tester',
        'true'
    );
INSERT INTO human (
        "trashing_level",
        "excitment_level",
        "lat",
        "lng"
    )
VALUES (23, 34, 45.49857063606833, -73.59814206567297),
    (11, 67, 45.498100032138424, -73.59776274401594),
    (42, 54, 45.4985227782212, -73.59676512805792),
    (35, 6, 45.498982743624154, -73.59687892455503),
    (45, 78, 45.49967434412355, -73.58481542575836),
    (3, 4, 45.508042652399844, -73.58778503299945);
