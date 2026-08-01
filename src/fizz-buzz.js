export default function fizzBuzz(n) {
  if (typeof n !== 'number' || !Number.isInteger(n)) {
    throw new TypeError('n must be an integer');
  }

  if (n % 15 === 0) return 'FizzBuzz';
  if (n % 3 === 0) return 'Fizz';
  if (n % 5 === 0) return 'Buzz';
  return String(n);
}
