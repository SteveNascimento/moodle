import { User } from "../entities/User";

export interface IUsersRepository {
    findByEmail(email: string): Promise<User>;
    findByUsername(username: string): Promise<User>;
    createUser(user: User): Promise<User>;
}