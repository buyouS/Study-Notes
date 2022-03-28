function avarage(x,y) {
    return (x + y) / 2;
}

const tolerance = 0.00001;

function fixde_point(f, first_guess) {
    function close_enough(v1,v2) {
        return Math.abs(v1 - v2) < tolerance;
    }
        
    function try_guess(guess) {
        const next = f(guess);
        return close_enough(guess, next) 
            ? next 
            : try_guess(next);
    }

    return try_guess(first_guess);
}

function sqrt(x) {
    return fixde_point(y => avarage(y, x / y), 1);
}
console.log(sqrt(4));