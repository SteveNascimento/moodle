export interface ICreateUserRequestDTO {
    id?: string;
    username: string;
    name: string;
    email: string;
    password: string;
    role_id: string;
}