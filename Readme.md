# BiRF Engine for Actionscript 3

A general game creation framework loosely based on the MVC design pattern. Inspired by modern frameworks such as: [RobotLegs](http://www.robotlegs.org) and [PureMVC](http://puremvc.org).

## F.A.Q.

### What is a birf?

It's a abbreviation of 'burn in righteous fire' which might seem very random. And it is. :) For a game developer, my imagination is somewhat limited when it comes to names.

### Why another framework?

Mostly as a learning experience and because I can. :P I've always enjoyed rolling my own frameworks because you learn a lot from it. This is basically the culmination of my 6+ years in the actionscript/flash scene. Other than that, if anyone else finds use for it then that's great. :)

## Architecture

BiRF is divided into two seperate SWCs: Core and Extensions. The core lib (as it's name suggests) contains the fundamental parts for making BiRF applications. While the extensions lib contains more specific implementations and helper/utility code.

### Third Party Libs

The core lib has been stripped down to use as few third party libs as possible. But it still makes use of as3signals to replace flash events and swiftsuspenders to provide dependency injection.
