import { PrismaClient } from "@prisma/client";
import "dotenv/config";

const prisma = new PrismaClient();

console.log("Users:", (await prisma.user.findMany()).length);
console.log(process.env.HELLO_WORLD);
