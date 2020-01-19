The UI folder is concerned only with the visual aspects of the application. 

In flutter, UI views have a top-level widget that contains other widgets, which contain other widgets and so on until you get to the leaf widget.

The UI folder contains at least four subfolders.

## pages folder: 

Since a UI is a collection of pages that the user can navigate between them, the first subfolder of the UI folder is the pages directory. 

Typically, you dedicate a folder for each page even if it has one file. The advantage of dedicating one folder for a page is to increase readability.

## widgets: 

It contains small reusable widgets that should be independent of the application. 

For example, this folder may contain your best-designed FAB, your super attractive CircularProgressBar, your awsome list tile … etc. 

By the time you constitute your custom widget library and you know where to find them if you need them in other apps.

Even if you are using widgets from external libraries, it is more convenient to adapt their interface and create your own and use yours throughout the user interface. 

Your advantage is to dissociate your user interface from the concrete implementation of external libraries, and in the future, if you change your mind and decide to use another library, you will change one place: here inside the widgets folder.

## exception folder: 

Here you handle exceptions thrown from the domain and service layer.

## common folder: 

contains common helper utilities used in the UI layer (constant, enumeration, style, util classes …).