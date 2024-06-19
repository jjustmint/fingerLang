import * as jwt from "jsonwebtoken";

type tokenType = {
  id: number;
  username: string;
};

const VerifyToken = (token: string) => {
  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET!);
    const response: tokenType = {
      id: (decoded as any).id,
      username: (decoded as any).username,
    };
    return response;
  } catch (e) {
    return {
      id: 0,
      username: "",
    } as tokenType;
  }
};

export { VerifyToken };
