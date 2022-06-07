import { Request, Response } from "express";
import { CreateUserUseCase } from "./CreateUserUseCase";

// Recebe a request do express e retorna a resposta
export class CreateUserController {

    constructor(
        private createUserUseCase: CreateUserUseCase
    ) {}

    async handle(request: Request, response: Response): Promise<Response> {
        const { username, name, email, password, role_id } = request.body;

        try {
            const newUser = await this.createUserUseCase.execute({
                username,
                name,
                email,
                password,
                role_id
            })
            return response.status(201).json(newUser);
            
        } catch (error) {
            return response.status(400).json({
                message: error.message || "Unexpected Error."
            })
        }
    }
}