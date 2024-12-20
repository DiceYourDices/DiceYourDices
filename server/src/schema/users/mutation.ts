import prisma from '../../prisma/client';

export const UsersMutation = {
    populate: async () => {
        const response = await prisma.users.createMany({
            data: [
                {
                    name: "Maria",
                    age: 11
                },
                {
                    name: "Pepe",
                    age: 88
                },
                {
                    name: "Joshua",
                    age: 50
                },
                {
                    name: "EjoseanL",
                    age: 100
                }
            ]
        });

        return response.count;
    },
};