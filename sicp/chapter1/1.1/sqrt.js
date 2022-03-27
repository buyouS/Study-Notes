 function square(x) {
    return x * x;
}

 function abs(x) {
    return x > 0 ? x : -x;
}

function average(x, y) {
    return (x + y) / 2;
}

function is_good_enough(x, guess) {
    return abs(square(guess) - x) < 0.001;
}

function improve(guess, x) {
    return averge(x / guess, guess);
}

function sqrt_iter(x, guess) {
    return is_good_enough(x, guess) ?
        guess
        :
        sqrt_iter(x, improve(guess, x))
}

 function sqrt(x) {
    return sqrt_iter(x, 1.0)
}

// console.log(sqrt(9))
// console.log(sqrt(2))

module.exports = {square,abs,averge,is_good_enough,improve,sqrt}


function sqrt_by_block(x) {
    function is_good_enough(guess) {
        return abs(square(guess) - x) < 0.001;
    }
    function improve(guess) {
        return average(guess, x / guess);
    }
    function sqrt_iter(guess) {
        return is_good_enough(guess)
               ? guess
               : sqrt_iter(improve(guess));
    }
    return sqrt_iter(1);
}

