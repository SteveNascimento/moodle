-- CreateTable
CREATE TABLE "employees" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "roles_id" TEXT NOT NULL,
    "campus_id" TEXT NOT NULL,

    CONSTRAINT "employees_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "roles" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "campus" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "IABM" TEXT NOT NULL,
    "FABM" TEXT NOT NULL,
    "ICDM" TEXT NOT NULL,
    "FCDM" TEXT NOT NULL,
    "IABT" TEXT NOT NULL,
    "FABT" TEXT NOT NULL,
    "ICDT" TEXT NOT NULL,
    "FCDT" TEXT NOT NULL,
    "IABN" TEXT NOT NULL,
    "FABN" TEXT NOT NULL,
    "ICDN" TEXT NOT NULL,
    "FCDN" TEXT NOT NULL,

    CONSTRAINT "campus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "custom_times" (
    "id" TEXT NOT NULL,
    "inicio" TEXT NOT NULL,
    "fim" TEXT NOT NULL,
    "employee_id" TEXT NOT NULL,

    CONSTRAINT "custom_times_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "employees_username_key" ON "employees"("username");

-- AddForeignKey
ALTER TABLE "employees" ADD CONSTRAINT "employees_roles_id_fkey" FOREIGN KEY ("roles_id") REFERENCES "roles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employees" ADD CONSTRAINT "employees_campus_id_fkey" FOREIGN KEY ("campus_id") REFERENCES "campus"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "custom_times" ADD CONSTRAINT "custom_times_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employees"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
