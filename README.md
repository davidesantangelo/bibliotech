# Bibliotech

this is a project created for the simple purpose of education. Bibliotech is a simple REST API that allows CRUD management of a library.

## Schema

All API access is over HTTPS, and accessed from https://biblio--tech.herokuapp.com. All data is sent and received as JSON.

Blank fields are included as null instead of being omitted.

All responses follow the [JSON:API](https://jsonapi.org/format/) guidelines:

JSON:API is a specification for how a client should request that resources be fetched or modified, and how a server should respond to those requests.

JSON:API is designed to minimize both the number of requests and the amount of data transmitted between clients and servers. This efficiency is achieved without compromising readability, flexibility, or discoverability.

```
{
  "data": {
    "type": "entry",
    "id": "1",
    "attributes": {
      // ... this entry's attributes
    },
    "relationships": {
      // ... this entry's relationships
    }
  }
}
```

## Pagination

Requests that return multiple items will be paginated to 20 items by default. You can specify further pages with the ```?page``` parameter. Pagination information is available inside **headers**. Example:

```
Current-Page: 1
Per-Page: 20
Link:<?page=1>; rel="first", <?page=24>; rel="last"
Total: 464
```

## Documentation

the endpoints that the API manages are:

books ( all operations )
authors ( create and read )
publishers ( create and read )

## Books

### Index

```sh

curl -X GET 'https://biblio--tech.herokuapp.com/books' -H 'content-type: application/json'
    
```

### Create


```sh

curl -X POST 'https://biblio--tech.herokuapp.com/books' -H 'content-type: application/json'
    
```

```json

{
	"book": {
		"title":"A Letter to Jo",
		"description":"There’s a horrible beauty in Williams’ depiction of the war experience, like isolated segments from a Bosch painting transported to the war in Europe. What A Letter To Jo accomplishes is placing that personal experience of Leonard in a wider context, the war experience as well as the romance with Sieracki’s grandmother. It is, truly, the American story of that era",
		"isbn":"978-1-60309-452-8",
		"publisher": {
			"id": "26eb9c51-ae31-40f1-b53b-75abe417a974"
		}
	}
}

```

## Limitations

* Requests are rate-limited to **200** per 5 minutes per IP address.
* There is no limit imposed on the number of records, but please **don't abuse** it since it's a service i offer free of charge. 

## Built With

- [Ruby on Rails](https://github.com/rails/rails) &mdash; Our back end API is a Rails app. It responds to requests RESTfully in JSON.
- [PostgreSQL](https://www.postgresql.org/) &mdash; Our main data store is in Postgres.
- [Redis](https://redis.io/) &mdash; We use Redis as a cache and for transient data.
- [JSON:API Serialization](https://github.com/jsonapi-serializer/jsonapi-serializer) &mdash; A fast JSON:API serializer for Ruby Objects..
- [Rack::Attack](https://github.com/kickstarter/rack-attack) &mdash; Rack middleware for blocking & throttling abusive requests.
- [Pagy](https://github.com/ddnexus/pagy) &mdash; The ultimate pagination ruby gem.