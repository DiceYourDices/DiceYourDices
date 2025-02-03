-- CreateTable
CREATE TABLE "users" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100),
    "age" INTEGER,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Class" (
    "id" TEXT NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "hit_die" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Class_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Proficiency" (
    "id" TEXT NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "url" TEXT NOT NULL,

    CONSTRAINT "Proficiency_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SavingThrow" (
    "id" TEXT NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "classId" TEXT NOT NULL,

    CONSTRAINT "SavingThrow_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StartingEquipment" (
    "id" TEXT NOT NULL,
    "equipment" JSONB NOT NULL,
    "quantity" INTEGER NOT NULL,
    "classId" TEXT NOT NULL,

    CONSTRAINT "StartingEquipment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Spellcasting" (
    "id" TEXT NOT NULL,
    "level" INTEGER NOT NULL,
    "spellcasting_ability" JSONB NOT NULL,
    "info" JSONB NOT NULL,
    "classId" TEXT NOT NULL,

    CONSTRAINT "Spellcasting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MultiClassing" (
    "id" TEXT NOT NULL,
    "prerequisites" JSONB NOT NULL,
    "proficiencies" JSONB NOT NULL,
    "classId" TEXT NOT NULL,

    CONSTRAINT "MultiClassing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Subclass" (
    "id" TEXT NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "classId" TEXT NOT NULL,

    CONSTRAINT "Subclass_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ClassToProficiency" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_ClassToProficiency_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "Class_index_key" ON "Class"("index");

-- CreateIndex
CREATE UNIQUE INDEX "Proficiency_index_key" ON "Proficiency"("index");

-- CreateIndex
CREATE UNIQUE INDEX "SavingThrow_index_key" ON "SavingThrow"("index");

-- CreateIndex
CREATE UNIQUE INDEX "Spellcasting_classId_key" ON "Spellcasting"("classId");

-- CreateIndex
CREATE UNIQUE INDEX "MultiClassing_classId_key" ON "MultiClassing"("classId");

-- CreateIndex
CREATE UNIQUE INDEX "Subclass_index_key" ON "Subclass"("index");

-- CreateIndex
CREATE INDEX "_ClassToProficiency_B_index" ON "_ClassToProficiency"("B");

-- AddForeignKey
ALTER TABLE "SavingThrow" ADD CONSTRAINT "SavingThrow_classId_fkey" FOREIGN KEY ("classId") REFERENCES "Class"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StartingEquipment" ADD CONSTRAINT "StartingEquipment_classId_fkey" FOREIGN KEY ("classId") REFERENCES "Class"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Spellcasting" ADD CONSTRAINT "Spellcasting_classId_fkey" FOREIGN KEY ("classId") REFERENCES "Class"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MultiClassing" ADD CONSTRAINT "MultiClassing_classId_fkey" FOREIGN KEY ("classId") REFERENCES "Class"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subclass" ADD CONSTRAINT "Subclass_classId_fkey" FOREIGN KEY ("classId") REFERENCES "Class"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClassToProficiency" ADD CONSTRAINT "_ClassToProficiency_A_fkey" FOREIGN KEY ("A") REFERENCES "Class"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClassToProficiency" ADD CONSTRAINT "_ClassToProficiency_B_fkey" FOREIGN KEY ("B") REFERENCES "Proficiency"("id") ON DELETE CASCADE ON UPDATE CASCADE;
