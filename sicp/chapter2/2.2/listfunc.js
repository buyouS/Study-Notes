const { is_null, printList, list, head, tail, pair  } = require('../../list.js');




function list_ref(list, n) {
    return n === 0
        ? head(list)
        : list_ref(tail(list), n - 1);
}

const test = list(1, 2, 3, 4, list(1, 2));
printList(test);
console.log();
console.log(list_ref(test, 4));

function length(list) {
    return is_null(list)
        ? 0
        : (1 + length(tail(list)));
}


console.log(length(test));

const odds = list(1,3,5,7);
const square = list(1,4,9,16);

function append(l1,l2) {
    return is_null(l1) 
        ? l2
        :pair(head(l1),append(tail(l1),l2));
}

printList(append(square,odds));







