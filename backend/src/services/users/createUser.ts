import { prisma } from "../..";

const CreateUser = async (username: string, password: string) => {
  const createUserResponse = await prisma.users.create({
    data: {
      username,
      password,
    },
  });
  return createUserResponse;
};

export { CreateUser };
