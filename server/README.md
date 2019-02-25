# Demo server

Demo server using [JSON Server](https://github.com/typicode/jsonplaceholder).
The local database contains TODOs only. The apps code can be change to point to `https://jsonplaceholder.typicode.com/` if you don't want to run the server locally.

```bash
# Install json-server
npm install -g json-server

# Run the server
json-server --watch db.json
```
