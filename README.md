# Bibliotech

this is a project created for the simple purpose of education. Bibliotech is a simple REST API that allows CRUD management of a library.

**THE API don't need authentication**

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


## Publishers

An organization that publishes books.

### Index

```sh

curl -X GET 'https://biblio--tech.herokuapp.com/publishers' -H 'content-type: application/json'
    
```

``` json
{
  "data": [
    {
      "id": "26eb9c51-ae31-40f1-b53b-75abe417a974",
      "type": "publisher",
      "attributes": {
        "name": "Davide Publisher",
        "address": "Via L. Pinto Foggia Italy",
        "phone": "3887766777"
      }
    },
    {
      "id": "75d7215d-9cbc-47cc-897a-56f7599821a4",
      "type": "publisher",
      "attributes": {
        "name": "Mayert-Schmidt",
        "address": "Apt. 759 472 Batz Field, South Robbie, FL 11650-8672",
        "phone": "(372) 642-8561 x448"
      }
    }
  ]
}
```

### Create

```sh

curl -X POST 'https://biblio--tech.herokuapp.com/publishers' -H 'content-type: application/json'

```

``` json
{
  "publisher": {
    "name":"Davide Publisher",
    "address":"Via L. Pinto Foggia Italy",
    "phone":"3887766777"
  }
}
```

## Authors

An author is the creator or originator of the book, and is also considered a writer. More broadly defined, an author is "the person who originated or gave existence to anything" and whose authorship determines responsibility for what was created.

### Index

```sh

curl -X GET 'https://biblio--tech.herokuapp.com/authors' -H 'content-type: application/json'
    
```

``` json

{
  "data": [
    {
      "id": "bf296bf3-6547-4772-9a18-4222e417e1fe",
      "type": "author",
      "attributes": {
        "name": "Davide Santangelo",
        "email": "davide.santangelo@gmail.com",
        "birthdate": "1985-05-11",
        "books_count": 1
      }
    },
    {
      "id": "9a8f7d11-039a-4cc5-aaa9-87e48e36f2da",
      "type": "author",
      "attributes": {
        "name": "Paolo Rossi",
        "email": "paolo.rossi@gmail.com",
        "birthdate": "1999-07-22",
        "books_count": 0
      }
    },
    {
      "id": "201aedb4-19d2-4092-8313-0df598dc1c8b",
      "type": "author",
      "attributes": {
        "name": "Nicolas Dietrich",
        "email": "andreas.kuvalis@kovacek.biz",
        "birthdate": "1960-04-28",
        "books_count": 5
      }
    },
    ...
  ]
}

```

### Create

```sh

curl -X POST 'https://biblio--tech.herokuapp.com/authors' -H 'content-type: application/json'
    
```

``` json

{
  "author": {
    "first_name":"Davide",
    "last_name":"Santangelo",
    "email":"davide.santangelo@gmail.com",
    "birthdate":"11-05-1985"
  }
}

```

### Show

```sh

curl -X GET 'https://biblio--tech.herokuapp.com/authors/{AUTHOR-ID}' -H 'content-type: application/json'
    
```

``` json
{
  "data": {
    "id": "bf296bf3-6547-4772-9a18-4222e417e1fe",
    "type": "author",
    "attributes": {
      "name": "Davide Santangelo",a written or printed work consisting of pages glued or sewn together along one side and bound in covers.
      "email": "davide.santangelo@gmail.com",
      "birthdate": "1985-05-11",
      "books_count": 1
    }
  }
}
```

## Books

A written or printed work consisting of pages glued or sewn together along one side and bound in covers.

### Index

```sh

curl -X GET 'https://biblio--tech.herokuapp.com/books' -H 'content-type: application/json'
    
```

or to view all the books of a particular author


```sh

curl -X GET 'https://biblio--tech.herokuapp.com/authors/{AUTHOR-ID}/books' -H 'content-type: application/json'
    
```

### Create

this endpoint depends on the author being the author's child book resource

```sh

curl -X POST 'https://biblio--tech.herokuapp.com/authors/{AUTHOR-ID}/books' -H 'content-type: application/json'
    
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

### Show

this endpoint depends on the author being the author's child book resource

```sh

curl -X GET 'https://biblio--tech.herokuapp.com/authors/{AUTHOR-ID}/books/{ID}' -H 'content-type: application/json'
    
```

### Delete

this endpoint depends on the author being the author's child book resource

```sh

curl -X DELETE 'https://biblio--tech.herokuapp.com/authors/{AUTHOR-ID}/books/{ID}' -H 'content-type: application/json'

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
