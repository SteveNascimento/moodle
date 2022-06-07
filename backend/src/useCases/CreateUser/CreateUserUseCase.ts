import { User } from "../../entities/User";
import { IMailProvider } from "../../providers/IMailProvider";
import { IUsersRepository } from "../../repositories/IUsersRepository";
import { ICreateUserRequestDTO } from "./CreateUserDTO";

export class CreateUserUseCase {

    constructor (
        private usersRepository: IUsersRepository,
        private mailProvider: IMailProvider,
    ) {}

    async execute(data: ICreateUserRequestDTO) {
        const emailAlreadyExists = await this.usersRepository.findByEmail(data.email);
        const usernameAlreadyExists = await this.usersRepository.findByUsername(data.username);
        
        if (usernameAlreadyExists) {
            throw new Error("Username já existe no sistema!");
        }

        if (emailAlreadyExists) {
            throw new Error("Email já existe no sistema!");
        }
        

        const user = new User(data);
        

        const newUser = await this.usersRepository.createUser(user)

        await this.mailProvider.sendMail({
            from: {
                email: "from@teste.com",
                name: "Steve From"
            },
            to: {
                email: user.email,
                name: user.name
            },
            subject: "Seja bem-vindo a plataforma!",
            body: "<p>O seu cadastro na plataforma foi concluído!</p>"
        })

        return newUser
    }
}