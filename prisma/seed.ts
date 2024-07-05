import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  for (const [index, _] of Array(10).entries()) {
    await prisma.user.create({
      data: {
        name: `${index}`,
      },
    });
  }
}

main();
