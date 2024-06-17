import { prisma } from "../..";

const GetUserByUsername = async (username: string) => {
  const userResponse = await prisma.users.findMany({
    where: {
      username: username,
    },
  });

  return userResponse;
};

export { GetUserByUsername };
