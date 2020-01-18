The domain layer is the most independent part of the application and reflects the enterprise-wide application logic.

## Domain (or Domain Model):
It is the core of your app’s business logic, It contains all the logic pertaining to the business domain. 

By the way, if you want to switch gears again and take your programming skills to the next level, don’t waste more time and consider Domain-Driven Design (DDD). 

In the context of DDD, experts in the problem domain work with the development team to get out with what is called the analysis model. The implementation of the analysis model is the domain model and this is what this folder should contain. 

The domain folder contains at least four subfolders.

### Entities folder: 

Entities are mutable objects uniquely identified by their IDs. 

In most cases, entities are the in-memory representation of the data that was retrieved from the persistence store (data_source). 

An entity can have methods it must encapsulate all the domain logic it controls. Among the logic that should an entity have is the validation logic, which will be executed just before persisting the entity state to ensure that has the right state.

entities must be validated just before persistance

### value objects folder: 

Value objects are immutable objects which have value equality and self-validation but no IDs. 

Value objects come to the rescue if you have many primitive fields in your entities. In this case, it may be possible to move some of them with the associated behavior and validation to a new value object classes. 

Validation is performed at the time of construction so that value objects are either instantiated in the right state or an error is thrown.

Value objects are such a good concept that you do keep refactoring your code to get more of them.

value objects must be validated the time of constraction

Entities are validated just before persistence whereas value_objects are validated the time of instantiation.

### exception folder: 

This folder should contain all exception classes that entities and value objects are expected to throw.

### common folder: 

contains common helper utilities shared inside the domain (constants, enumerations, util classes …).