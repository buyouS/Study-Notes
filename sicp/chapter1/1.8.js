
function cube(x) {
    return x * x * x;
}

function abs(x) {
    return x > 0 ? x : -x;
}

function improve(x, guess) {
    return (x / (guess * guess) + 2 * guess) / 3;
}

function is_good_enough(oldGuess, newGuess) {
    return (abs(newGuess - oldGuess) / oldGuess) < 0.01;
}

function cube_root_iter(x,guess) {
    return is_good_enough(guess,improve(x,guess)) ?
            improve(x,guess)
            :
            cube_root_iter(x,improve(x,guess));
}

function cube_root(x) {
    return cube_root_iter(x,1.0);
}

console.log(cube_root(8))