// fizz-buzz.js
function fizzBuzz(n = 100) {
  const out = [];
  for (let i = 1; i <= n; i++) {
    let s = '';
    if (i % 3 === 0) s += 'Fizz';
    if (i % 5 === 0) s += 'Buzz';
    out.push(s || i);
  }
  return out;
}

// If run directly, print results to stdout (one per line)
if (typeof require !== 'undefined' && require.main === module) {
  const n = process.argv[2] ? Number(process.argv[2]) : 100;
  console.log(fizzBuzz(n).join('\n'));
}

// Export for tests / other modules (CommonJS)
if (typeof module !== 'undefined') module.exports = fizzBuzz;
