//数组实现
function pair(a, b) {
    return [a, b];
}

function head(p) {
    return p[0];
}

function tail(p) {
    return p[1];
}


// function pair(x, y) {
//     function dispatch(m) {
//         return m === 0 
//                ? x
//                : m === 1 
//                ? y
//                : error(m, "argument not 0 or 1 -- pair");
//     }
//     return dispatch;	      
// }
// function head(z) { return z(0); }

// function tail(z) { return z(1); }




// const p1 = pair(3,pair(1, 2));
// console.log(head(tail(p1)));



module.exports = {pair, head, tail};