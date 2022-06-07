import { uuid } from "uuidv4";

export class User {

    public id?: string;
    public username: string;
    public name: string;
    public email: string;
    public password: string;
    public role_id: string;

    constructor(props: Omit<User, 'id'>, id?: string) {
        Object.assign(this, props)

        if (!id) {
            this.id = uuid();
        }
    }
}