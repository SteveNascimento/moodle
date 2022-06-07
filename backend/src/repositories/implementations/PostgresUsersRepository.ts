import { prismaClient } from "../../database/prismaClient";
import { User } from "../../entities/User";
import { IUsersRepository } from "../IUsersRepository";

export class PostgresUsersRepository implements IUsersRepository {
    async createUser(user: User): Promise<User> {
        return await prismaClient.user.create({
            data: {
                id: user.id,
                username: user.username,
                name: user.name,
                email: user.email,
                password: user.password,
                role_id: user.role_id,
            }
        })
    }

    async findByEmail(email: string): Promise<User> {

        return await prismaClient.user.findFirst({
            where: {
                email
            }
        })
    }
    
    async findByUsername(username: string): Promise<User> {

        return await prismaClient.user.findUnique({
            where: {
                username
            }
        })
    }
}