-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100),
    "age" INTEGER,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);
