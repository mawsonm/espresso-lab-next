-- CreateTable
CREATE TABLE "Bean" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "roaster" TEXT,
    "origin" TEXT,
    "region" TEXT,
    "altitude" INTEGER,
    "variety" TEXT,
    "processingMethod" TEXT,
    "roastLevel" TEXT,
    "flavorNotes" TEXT[],
    "price" DOUBLE PRECISION,
    "url" TEXT,
    "imageUrl" TEXT,
    "scrapedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Bean_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BrewSession" (
    "id" TEXT NOT NULL,
    "beanId" TEXT NOT NULL,
    "grindSize" INTEGER NOT NULL,
    "doseGrams" DOUBLE PRECISION NOT NULL,
    "yieldGrams" DOUBLE PRECISION NOT NULL,
    "timeSeconds" INTEGER NOT NULL,
    "temperatureF" INTEGER NOT NULL,
    "pressureBar" DOUBLE PRECISION,
    "rating" INTEGER NOT NULL,
    "notes" TEXT,
    "tasteNotes" TEXT[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BrewSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BeanRating" (
    "id" TEXT NOT NULL,
    "beanId" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BeanRating_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Bean_origin_idx" ON "Bean"("origin");

-- CreateIndex
CREATE INDEX "Bean_roaster_idx" ON "Bean"("roaster");

-- CreateIndex
CREATE INDEX "BrewSession_beanId_idx" ON "BrewSession"("beanId");

-- CreateIndex
CREATE INDEX "BrewSession_createdAt_idx" ON "BrewSession"("createdAt");

-- CreateIndex
CREATE INDEX "BeanRating_beanId_idx" ON "BeanRating"("beanId");

-- CreateIndex
CREATE INDEX "BeanRating_rating_idx" ON "BeanRating"("rating");

-- AddForeignKey
ALTER TABLE "BrewSession" ADD CONSTRAINT "BrewSession_beanId_fkey" FOREIGN KEY ("beanId") REFERENCES "Bean"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BeanRating" ADD CONSTRAINT "BeanRating_beanId_fkey" FOREIGN KEY ("beanId") REFERENCES "Bean"("id") ON DELETE CASCADE ON UPDATE CASCADE;
