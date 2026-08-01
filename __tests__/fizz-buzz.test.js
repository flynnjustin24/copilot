test('returns number as string when not divisible by 3 or 5', async () => {
  const { default: fizzBuzz } = await import('../src/fizz-buzz.js');
  expect(fizzBuzz(1)).toBe('1');
});

test('returns Fizz for multiples of 3', async () => {
  const { default: fizzBuzz } = await import('../src/fizz-buzz.js');
  expect(fizzBuzz(3)).toBe('Fizz');
  expect(fizzBuzz(9)).toBe('Fizz');
});

test('returns Buzz for multiples of 5', async () => {
  const { default: fizzBuzz } = await import('../src/fizz-buzz.js');
  expect(fizzBuzz(5)).toBe('Buzz');
  expect(fizzBuzz(20)).toBe('Buzz');
});

test('returns FizzBuzz for multiples of 15', async () => {
  const { default: fizzBuzz } = await import('../src/fizz-buzz.js');
  expect(fizzBuzz(15)).toBe('FizzBuzz');
});

test('throws for non-integer input', async () => {
  const { default: fizzBuzz } = await import('../src/fizz-buzz.js');
  expect(() => fizzBuzz('a')).toThrow(TypeError);
});
