import prisma from '../../prisma/client';

export const UsersQuery = {
    users: () => {
        return prisma.users.findMany();
    },
};