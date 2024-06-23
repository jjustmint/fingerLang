import { prisma } from "../..";

const CreateUser = async (
  username: string,
  password: string,
  defaultProfileImage: string
) => {
  try {
    const createUserResponse = await prisma.users.create({
      data: {
        username,
        password,
        image_url: defaultProfileImage,
      },
    });

    return createUserResponse;
  } catch (error) {
    throw new Error(`Error creating user: ${error}`);
  }
};

export { CreateUser };
