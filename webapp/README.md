# Dev workflow in the webapp
## Recommended extensions
* Tailwind CSS IntelliSense
## .env
```
API_URL=http://localhost:4000
```

## Useful commands
* `npm run generate`: You need the server up. It will read the schema and create types in `src/__generated__`
* `npm run dev`: For getting the server up


## File system routing
Next uses file system routing. This means that the `page.tsx` at `app/` is the page displayed at `'/'`, the `page.tsx` at `app/admin` is at `'/admin'` etc.

layout.tsx is where app wrappers are added. 

## Server side rendering with client hydration
There are two Apollo clients:
* [apolloClient.ts](./src/app/lib/apolloClient.ts): This is a plain client for the server to render
* [apolloWrapper.tsx](./src/app/ui/apolloWrapper.tsx): This is a wrapper for client components that want to make graphql requests. It also ensures that the Apollo client used is a singleton

I will explain it over this code extract
``` js
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
```

* PreloadQuery: Function that comes from the server Apollo client. It will fetch the data and cache it.
* Suspense: React component for displaying something while the data is being fetched. 
* UsersList: This component runs `usersQuery` and displays the result as a list.

``` js
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
```

The useSuspenseQuery: This function will suspend the component until the data is retrieved. Makes it easier for rendering a loading screen while the data is being fetched.

The idea here is that the useSuspenseQuery in the child component will not trigger a new network request to the API (the first time). It will instead fetch it from the cache. If it later needs to run the query again, then it will actually create a network request against the server.