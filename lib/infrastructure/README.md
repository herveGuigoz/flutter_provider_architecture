## Infrastructure folder

Applications may rely on external resources, i.e; getting persistent data, fetching web, make a call or send a message or email, using 3rd-party libraries. 

In this case, the code using API of these third-party libraries is contained in the infrastructure folder (infrastructure layer). 

The service layer must communicate with the infrastructure layer through interfaces and infrastructure must implement interfaces defined in the service layer. 

This decoupling is mandatory to ensure our app does not depend on any 3rd-party library.

It is here the right place to put all the logic that deals with communication with platform-specific services such as sending emails, checking network connection, using GPS service, camera …