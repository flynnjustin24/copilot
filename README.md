# copilot-fizz-buzz

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A small fizz-buzz utility exported as an ESM module with a tiny CLI and Jest tests.

## Installation

Install dependencies and link the CLI locally (developer setup):

npm install
npm link

Alternatively, run the CLI directly from the repository:

chmod +x bin/fizz-buzz
./bin/fizz-buzz 15

## CLI

Usage:

fizz-buzz <number>

Example:

fizz-buzz 15
# Output: FizzBuzz

## API (ESM)

Import and use the function in your project:

import fizzBuzz from './src/fizz-buzz.js';
console.log(fizzBuzz(3)); // "Fizz"

## Tests

Run tests with:

npm test

## License

This project is licensed under the MIT License. See the LICENSE file for details.
