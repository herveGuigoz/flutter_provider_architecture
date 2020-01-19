The application service layer is the client of the domain layer. 

It hides (or in technical terms “abstracts”) the details of the domain and exposes a programming interface (API) to represent the business use cases and behavior of the application. 

it is all about coordination and orchestration through delegation to domain and external services. 

The service layer must inversely depend on external services (Infrastructure and data_source) and this is done by defining a set of interfaces that should any external service implement. The set of interfaces defined is placed in the interfaces folder.

The service folder is made up of at least three subfolders.

## interfaces folder: 

contains interfaces that should any external service implement.

## exception folder: 

This folder should contain all exception classes that the services classes and external service are expected to throw. 

External services in the infrastructure and data_source layer should not throw their own defined exceptions, but their errors should be caught and custom exceptions defined in this folder should be thrown instead.

## common folder: 

contains common helper utilities shared inside the service layer (constants, enumerations, util classes …).

