export const UsersTypes = `#graphql
  type User {
    id: ID!

    name: String!

    age: Int!

  },
  
  extend type Query {
    users: [User]
  },

  extend type Mutation {
    populate: Int!
  },
`;