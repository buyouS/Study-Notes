const cont_frac_r = require('./1.37.js');

function e(k) {
    return 2 + cont_frac_r(i => 1,
        i => (i + 1) % 3 < 1 ? 2 * (i + 1) / 3 : 1,
        k);
}

console.log(e(100));