import { Suspense } from "react";
import { PreloadQuery } from "../lib/apolloClient";
import UsersList from "../ui/userList";
import { gql } from "@/__generated__";

const usersQuery = gql(`
    query getUsers {
        users {
            name
            age
        }
    }
`);

export default function Page() {
    return (
        <div>
            <PreloadQuery
                query={usersQuery}
            >
                <Suspense fallback={<>loading</>}>
                    <UsersList />
                </Suspense>
            </PreloadQuery>
        </div>
    );
}