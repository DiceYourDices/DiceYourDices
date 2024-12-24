"use client";
import { gql } from "@/__generated__";
import { useSuspenseQuery } from "@apollo/client";

const usersQuery = gql(`
    query getUsers {
        users {
            name
            age
        }
    }
`);

export default function UsersList() {
    const { data } = useSuspenseQuery(usersQuery);

    return (
        <ol>
            {data.users?.map(item => <li key={item?.name}>{item?.name}</li>)}
        </ol>
    );
}