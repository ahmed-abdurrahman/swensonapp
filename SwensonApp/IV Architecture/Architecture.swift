//
//  Architecture.swift
//  SwensonApp
//
//  Created by Ahmed Abdurrahman on 4/20/20.
//  Copyright © 2020 SwensonHe. All rights reserved.
//

/*

 Good mobile application architecture is one that will enforce assumptions and good programming patterns like SOLID, KISS, or ensuring that components have multiple responsibility layers. The architecture used meets these conditions to allow us to accelerate development and make future maintenance much easier, thus saving time and effort.

 One of the most crucial features of a good architecture is responsibility layer separation. Such a division will be key to reducing the context and extent of errors/bugs.

For an overview diagram, please check the image in the same group.

 # View Layer

         - Business logic free
         - Responsible only for styling decisions
         - Displays data as passed via presentation objects
         - 100% reusable by being totally decoupled from the underlying view controller
         - Includes UIViews, UITableViewCells, UICollectionCells, & UI Components
         - Updates the controller with user actions/events via delegation

 # Controller
 The maestro that coordinates between the different entities

         - Business logic free
         - May contain slight view configuration code/styling
         - Uses routers to present another screen/controller
         - Model-independent
         - Delegates user actions to underlying view model
         - Responds to state changes emitted by the view model

 # View Models & Manager
 
         - The business logic owner
         - The layer responsible to read/post data from/to backend APIs & local DB if any
         - UI independent
         - Unit-tests should test this layer

 # Router/App Router

        - The gateway to present/route to another screen
        - Instantiates view controller and its view model
        - Each controller should have its router for future use by other controllers

 */
