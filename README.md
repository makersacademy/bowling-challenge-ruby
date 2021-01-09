# Bowling Challenge
A small app to count and sum the scores of a bowling game for one player.

## Motivation
To focus on writing high-quality code. With particular attention to:

* Using diagramming
* TDD
* Testing behaviour rather than state
* Good git workflow
* SRP and Encapsulation
* Clear and readable code

## Build status
Build status of continuous integration i.e. travis, appveyor etc. Ex. -

[![Build Status](https://travis-ci.org/akashnimare/foco.svg?branch=master)](https://travis-ci.org/akashnimare/foco)
[![Windows Build Status](https://ci.appveyor.com/api/projects/status/github/akashnimare/foco?branch=master&svg=true)](https://ci.appveyor.com/project/akashnimare/foco/branch/master)

## Code style
If you're using any code style like xo, standard etc. That will help others while contributing to your project. Ex. -

[![js-standard-style](https://img.shields.io/badge/code%20style-standard-brightgreen.svg?style=flat)](https://github.com/feross/standard)

## Screenshots
Include logo/demo screenshot etc.

## Tech/framework used
Ex. -

<b>Built with</b>
- [Electron](https://electron.atom.io)

## Features
What makes your project stand out?

## Code Example
Show what the library does as concisely as possible, developers should be able to figure out **how** your project solves their problem by looking at the code example. Make sure the API you are showing off is obvious, and that your code is short and concise.

## Installation
Provide step by step series of examples and explanations about how to get a development env running.

## API Reference

Depending on the size of the project, if it is small and simple enough the reference docs can be added to the README. For medium size to larger projects it is important to at least provide a link to where the API reference docs live.

## Tests
### Input/Output Table
| Inputs (knocked down pins per roll array)  | Outputs (cumulative frame score array)     |
| :------------- | :------------- |
| [0]       | [0,0,0,0,0,0,0,0,0,0] |
| [0,0]       | [0,0,0,0,0,0,0,0,0,0] |
| [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] | [0,0,0,0,0,0,0,0,0,0] |
| [10,10,10,10,10,10,10,10,10,10,10,10] | [30,60,90,120,150,180,210,240,270,300]|
| [0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0] | [10,20,30,40,50,60,70,80,90,100] |
| [1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,8,6] | [5,14,29,49,60,61,77,97,117,133] |
| **Edge cases:** | |
| *anything other than an array of at least one, and up 21, integers between 1 and 10* | Error|

## How to use?
If people like your project they’ll want to learn how they can use it. To do so include step by step guide to use your project.

## Contribute

Let people know how they can contribute into your project. A [contributing guideline](https://github.com/zulip/zulip-electron/blob/master/CONTRIBUTING.md) will be a big plus.

## Credits
Give proper credits. This could be a link to any repo which inspired you to build this project, any blogposts or links to people who contrbuted in this project.

#### Anything else that seems useful

## License
A short snippet describing the license (MIT, Apache etc)

MIT © [Yourname]()
