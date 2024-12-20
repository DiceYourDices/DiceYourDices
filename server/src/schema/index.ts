import { UsersTypes, UsersMutation, UsersQuery } from "./users";

export const typeDefs = `#graphql
    type Query
    type Mutation
    ${UsersTypes}
`;

export const resolvers = {
    Query: {
        ...UsersQuery
    },

    Mutation: {
        ...UsersMutation
    }
};