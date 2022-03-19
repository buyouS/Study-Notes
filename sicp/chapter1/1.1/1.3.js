function square(x) {
    return x * x;
}


function f(x,y,z) {
    return square(x) + square(y) + square(z)
            - square(x > y ? (y > z ? z : y) : (x > z ? z : x)); 
}


      

console.log(f(1,2,2));