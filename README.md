# README

# To execute this project

1. Clone this project locally
2. Execute bundle install inside project folder
3. Run rails s
4. Available URLs:
4.1. http://{YOUR_HOST}/suppliers                    || GET - Return all Suppliers
4.2. http://{YOUR_HOST}/suppliers/:id                || GET - Return specific Supplier
4.3. http://{YOUR_HOST}/closest_supplier?lng=X&lat=Y || GET - Return closest Supplier within its coverageArea
4.4. http://{YOUR_HOST}/suppliers                    || POST - Create new Supplier

5. POST Body Exemple
```javascript
{
  "id": 1, 
  "tradingName": "Adega da Cerveja - Pinheiros",
  "ownerName": "Zé da Silva",
  "document": "1432132123891/0001", //CNPJ
  "coverageArea": { 
    "type": "MultiPolygon", 
    "coordinates": [
      [[[30, 20], [45, 40], [10, 40], [30, 20]]], 
      [[[15, 5], [40, 10], [10, 20], [5, 10], [15, 5]]]
    ]
  }, //Área de Cobertura
  "address": { 
    "type": "Point",
    "coordinates": [-46.57421, -21.785741]
  }, // Localização do PDV
}
```


# Backend Challenge

## About the Challenge

In this [json](files/pdvs.json) you will find data about hundreds of partners with the following format:
```javascript
{
  "pdvs": [ 
    {
        "id": 1, 
        "tradingName": "Adega da Cerveja - Pinheiros",
        "ownerName": "Zé da Silva",
        "document": "1432132123891/0001", //CNPJ
        "coverageArea": { 
          "type": "MultiPolygon", 
          "coordinates": [
            [[[30, 20], [45, 40], [10, 40], [30, 20]]], 
            [[[15, 5], [40, 10], [10, 20], [5, 10], [15, 5]]]
          ]
        }, //Área de Cobertura
        "address": { 
          "type": "Point",
          "coordinates": [-46.57421, -21.785741]
        }, // Localização do PDV
    }
  ]
}
```

Below, you can give a look on how these partners might be represented in a map:

![Partners in map](files/images/pdvs.png)

Before talking about the challenge itself, let me give you some information about the partners' specification:
We have some requirements that you must pay attention:

1. The `address` is defined by the format `GeoJSON Point` (https://en.wikipedia.org/wiki/GeoJSON)
2. The `coverageArea` is defined by the format `GeoJSON MultiPolygon` (https://en.wikipedia.org/wiki/GeoJSON) 
3. The `document` must be a unique field (as it is the CNPJ)

## What we want you to do

Considering all the info we gave to you, we expect you to develop a service that provides API using REST or GraphQL and enable the following functionalities. The programming language and the database you choose to use it is entirely up to you. 

### 1. Create partner: 

All fields are required and must follow the rules set above.

### 2. Get partner by id:

Get a specific partner by its `id`.

### 3. Search partner:

Given a specific location (coordinates `lng` and `lat`), search the nearest partner considering each partner's coverage area.

### 4. Tech Requirements, Docs and Deploy:

* Your project must be **cross-platform**.
* Provide a documentation so we know how to execute your service locally and how to deploy it (*focus on simplicity, and don't forget that we should test your service on our own, without further assistance*)

## Evaluation Method

Your code will be under review of the Zx's Global Engineering team. What we will look for:
- **Performance**
- **Testing**
- **Maintanability**
- **Separation of concerns**
- **Software engineering**

## How to deliver it

Please, use Github to host your code and add @ze-engineering-code-challenge as a collaborator for it. This Github account (@ze-engineering-code-challenge) is solely used by Zé's engineers to download your code and review it

**Once you have finished the challenge, please submit your information on this amazing form:**
  https://docs.google.com/forms/d/e/1FAIpQLSePVCWxsHZHoRqJY9-XFJHuL7iOjO00sfhZksLBmDbR0KuoLg/viewform

Good luck!