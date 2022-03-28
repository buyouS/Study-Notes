function cont_frac_r(n, d, k) {
    function frac(i) {
        return i > k
            ? 0
            : n(i) / (d(i) + frac(i + 1));
    }

    return frac(1);
}

module.exports = cont_frac_r;