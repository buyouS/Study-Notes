"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const createContext_1 = require("./createContext");
const dict = createContext_1.default(4).nativeStorage.builtins;


// equal computes the structural equality
// over its arguments

function equal(xs, ys) {
  return is_pair(xs)
  ? (is_pair(ys) &&
    equal(head(xs), head(ys)) &&
    equal(tail(xs), tail(ys)))
  : is_null(xs)
  ? is_null(ys)
  : is_number(xs)
  ? (is_number(ys) && xs === ys)
  : is_boolean(xs)
  ? (is_boolean(ys) && ((xs && ys) || (!xs && !ys)))
  : is_string(xs)
  ? (is_string(ys) && xs === ys)
  : is_undefined(xs)
  ? is_undefined(ys)
  : is_function(xs)
    // we know now that xs is a function,
    // but we use an if check anyway to make use of the type predicate
  ? (is_function(ys) && xs === ys)
  : false;
}


// returns the length of a given argument list
// assumes that the argument is a list

function $length(xs, acc) {
    return is_null(xs) ? acc : $length(tail(xs), acc + 1);
}
function length(xs) {
  return $length(xs, 0);
}

// map applies first arg f, assumed to be a unary function,
// to the elements of the second argument, assumed to be a list.
// f is applied element-by-element:
// map(f, list(1, 2)) results in list(f(1), f(2))

function $map(f, xs, acc) {
    return is_null(xs)
           ? reverse(acc)
           : $map(f, tail(xs), pair(f(head(xs)), acc));
}
function map(f, xs) {
    return $map(f, xs, null);
}

// build_list takes a a function fun as first argument, 
// and a nonnegative integer n as second argument,
// build_list returns a list of n elements, that results from
// applying fun to the numbers from 0 to n-1.

function $build_list(i, fun, already_built) {
    return i < 0 ? already_built : $build_list(i - 1, fun, pair(fun(i), already_built));
}

function build_list(fun, n) {
  return $build_list(n - 1, fun, null);
}

// for_each applies first arg fun, assumed to be a unary function,
// to the elements of the second argument, assumed to be a list.
// fun is applied element-by-element:
// for_each(fun, list(1, 2)) results in the calls fun(1) and fun(2).
// for_each returns true.

function for_each(fun, xs) {
  if (is_null(xs)) {
    return true;
  } else {
    fun(head(xs));
    return for_each(fun, tail(xs));
  }
}

// list_to_string returns a string that represents the argument list.
// It applies itself recursively on the elements of the given list.
// When it encounters a non-list, it applies to_string to it.

function $list_to_string(xs, cont) {
    return is_null(xs)
        ? cont("null")
        : is_pair(xs)
        ? $list_to_string(
              head(xs),
              x => $list_to_string(
                       tail(xs),
                       y => cont("[" + x + "," + y + "]")))
        : cont(stringify(xs));
}

function list_to_string(xs) {
    return $list_to_string(xs, x => x);
}

// reverse reverses the argument, assumed to be a list

function $reverse(original, reversed) {
    return is_null(original)
           ? reversed
           : $reverse(tail(original), pair(head(original), reversed));
}

function reverse(xs) {
    return $reverse(xs, null);
}

// append first argument, assumed to be a list, to the second argument.
// In the result null at the end of the first argument list
// is replaced by the second argument, regardless what the second
// argument consists of.

function $append(xs, ys, cont) {
    return is_null(xs)
           ? cont(ys)
           : $append(tail(xs), ys, zs => cont(pair(head(xs), zs)));
}

function append(xs, ys) {
    return $append(xs, ys, xs => xs);
}

// member looks for a given first-argument element in the
// second argument, assumed to be a list. It returns the first
// postfix sublist that starts with the given element. It returns null if the
// element does not occur in the list

function member(v, xs) {
  return is_null(xs)
         ? null
	 : v === head(xs)
	 ? xs
	 : member(v, tail(xs));
}

// removes the first occurrence of a given first-argument element
// in second-argument, assmed to be a list. Returns the original
// list if there is no occurrence.

function $remove(v, xs, acc) {
  // Ensure that typechecking of append and reverse are done independently
  const app = append;
  const rev = reverse;
  return is_null(xs)
         ? app(rev(acc), xs)
         : v === head(xs)
         ? app(rev(acc), tail(xs))
         : $remove(v, tail(xs), pair(head(xs), acc));
}

function remove(v, xs) {
    return $remove(v, xs, null);
}

// Similar to remove, but removes all instances of v
// instead of just the first

function $remove_all(v, xs, acc) {
  // Ensure that typechecking of append and reverse are done independently
  const app = append;
  const rev = reverse;
  return is_null(xs)
         ? app(rev(acc), xs)
         : v === head(xs)
         ? $remove_all(v, tail(xs), acc)
         : $remove_all(v, tail(xs), pair(head(xs), acc));
}

function remove_all(v, xs) {
    return $remove_all(v, xs, null);
}

// filter returns the sublist of elements of the second argument
// (assumed to be a list), for which the given predicate function
// returns true.

function $filter(pred, xs, acc) {
  return is_null(xs)
    ? reverse(acc)
    : pred(head(xs))
    ? $filter(pred, tail(xs), pair(head(xs), acc))
    : $filter(pred, tail(xs), acc);
}

function filter(pred, xs) {
    return $filter(pred, xs, null);
}

// enumerates numbers starting from start, assumed to be a number,
// using a step size of 1, until the number exceeds end, assumed
// to be a number

function $enum_list(start, end, acc) {
  // Ensure that typechecking of reverse are done independently
  const rev = reverse;
  return start > end
         ? rev(acc)
         : $enum_list(start + 1, end, pair(start, acc));
}

function enum_list(start, end) {
    return $enum_list(start, end, null);
}

// Returns the item in xs (assumed to be a list) at index n,
// assumed to be a nonnegative integer.
// Note: the first item is at position 0

function list_ref(xs, n) {
  return n === 0
         ? head(xs)
         : list_ref(tail(xs), n - 1);
}

// accumulate applies an operation op (assumed to be a binary function)
// to elements of sequence (assumed to be a list) in a right-to-left order.
// first apply op to the last element and initial, resulting in r1, then to
// the  second-last element and r1, resulting in r2, etc, and finally
// to the first element and r_n-1, where n is the length of the
// list.
// accumulate(op, zero, list(1, 2, 3)) results in
// op(1, op(2, op(3, zero)))

function $accumulate(f, initial, xs, cont) {
    return is_null(xs)
           ? cont(initial)
           : $accumulate(f, initial, tail(xs), x => cont(f(head(xs), x)));
}

function accumulate(f, initial, xs) {
  return $accumulate(f, initial, xs, x => x);
}


// Supporting streams in the Scheme style, following
// "stream discipline"

// is_stream recurses down the stream and checks that it ends with the
// empty list null

function is_stream(xs) {
  return is_null(xs) ||
    (is_pair(xs) &&
    is_function(tail(xs)) &&
    arity(tail(xs)) === 0 &&
    is_stream(stream_tail(xs)));
}

// A stream is either null or a pair whose tail is
// a nullary function that returns a stream.

function list_to_stream(xs) {
  return is_null(xs)
    ? null
    : pair(head(xs),
      () => list_to_stream(tail(xs)));
}

// stream_to_list transforms a given stream to a list
// Lazy? No: stream_to_list needs to force the whole stream
function stream_to_list(xs) {
  return is_null(xs)
    ? null
    : pair(head(xs), stream_to_list(stream_tail(xs)));
}

// stream_length returns the length of a given argument stream
// throws an exception if the argument is not a stream
// Lazy? No: The function needs to explore the whole stream
function stream_length(xs) {
  return is_null(xs)
    ? 0
    : 1 + stream_length(stream_tail(xs));
}

// stream_map applies first arg f to the elements of the second
// argument, assumed to be a stream.
// f is applied element-by-element:
// stream_map(f,list_to_stream(list(1,2)) results in
// the same as list_to_stream(list(f(1),f(2)))
// stream_map throws an exception if the second argument is not a
// stream, and if the second argument is a nonempty stream and the
// first argument is not a function.
// Lazy? Yes: The argument stream is only explored as forced by
//            the result stream.
function stream_map(f, s) {
  return is_null(s)
    ? null
    : pair(f(head(s)),
      () => stream_map(f, stream_tail(s)));
}

// build_stream takes a function fun as first argument, 
// and a nonnegative integer n as second argument,
// build_stream returns a stream of n elements, that results from
// applying fun to the numbers from 0 to n-1.
// Lazy? Yes: The result stream forces the applications of fun
//            for the next element
function build_stream(fun, n) {
  function build(i) {
    return i >= n
      ? null
      : pair(fun(i),
        () => build(i + 1));
  }
  return build(0);
}

// stream_for_each applies first arg fun to the elements of the stream
// passed as second argument. fun is applied element-by-element:
// for_each(fun,list_to_stream(list(1, 2,null))) results in the calls fun(1)
// and fun(2).
// stream_for_each returns true.
// stream_for_each throws an exception if the second argument is not a
// stream, and if the second argument is a nonempty stream and the
// first argument is not a function.
// Lazy? No: stream_for_each forces the exploration of the entire stream
function stream_for_each(fun, xs) {
  if (is_null(xs)) {
    return true;
  } else {
    fun(head(xs));
    return stream_for_each(fun, stream_tail(xs));
  }
}

// stream_reverse reverses the argument stream
// stream_reverse throws an exception if the argument is not a stream.
// Lazy? No: stream_reverse forces the exploration of the entire stream
function stream_reverse(xs) {
  function rev(original, reversed) {
    return is_null(original)
      ? reversed
      : rev(stream_tail(original),
        pair(head(original), () => reversed));
  }
  return rev(xs, null);
}

// stream_append appends first argument stream and second argument stream.
// In the result, null at the end of the first argument stream
// is replaced by the second argument stream
// stream_append throws an exception if the first argument is not a
// stream.
// Lazy? Yes: the result stream forces the actual append operation
function stream_append(xs, ys) {
  return is_null(xs)
    ? ys
    : pair(head(xs),
      () => stream_append(stream_tail(xs), ys));
}

// stream_member looks for a given first-argument element in a given
// second argument stream. It returns the first postfix substream
// that starts with the given element. It returns null if the
// element does not occur in the stream
// Lazy? Sort-of: stream_member forces the stream only until the element is found.
function stream_member(x, s) {
  return is_null(s)
    ? null
    : head(s) === x
      ? s
      : stream_member(x, stream_tail(s));
}

// stream_remove removes the first occurrence of a given first-argument element
// in a given second-argument list. Returns the original list
// if there is no occurrence.
// Lazy? Yes: the result stream forces the construction of each next element
function stream_remove(v, xs) {
  return is_null(xs)
    ? null
    : v === head(xs)
      ? stream_tail(xs)
      : pair(head(xs),
        () => stream_remove(v, stream_tail(xs)));
}

// stream_remove_all removes all instances of v instead of just the first.
// Lazy? Yes: the result stream forces the construction of each next element
function stream_remove_all(v, xs) {
  return is_null(xs)
    ? null
    : v === head(xs)
      ? stream_remove_all(v, stream_tail(xs))
      : pair(head(xs), () => stream_remove_all(v, stream_tail(xs)));
}

// filter returns the substream of elements of given stream s
// for which the given predicate function p returns true.
// Lazy? Yes: The result stream forces the construction of
//            each next element. Of course, the construction
//            of the next element needs to go down the stream
//            until an element is found for which p holds.
function stream_filter(p, s) {
  return is_null(s)
    ? null
    : p(head(s))
      ? pair(head(s),
        () => stream_filter(p, stream_tail(s)))
      : stream_filter(p, stream_tail(s));
}

// enumerates numbers starting from start,
// using a step size of 1, until the number
// exceeds end.
// Lazy? Yes: The result stream forces the construction of
//            each next element
function enum_stream(start, end) {
  return start > end
    ? null
    : pair(start,
      () => enum_stream(start + 1, end));
}

// integers_from constructs an infinite stream of integers
// starting at a given number n
// Lazy? Yes: The result stream forces the construction of
//            each next element
function integers_from(n) {
  return pair(n,
    () => integers_from(n + 1));
}

// eval_stream constructs the list of the first n elements
// of a given stream s
// Lazy? Sort-of: eval_stream only forces the computation of
//                the first n elements, and leaves the rest of
//                the stream untouched.
function eval_stream(s, n) {
    function es(s, n) {
        return n === 1 
               ? list(head(s))
               : pair(head(s), 
                      es(stream_tail(s), n - 1));
    }
    return n === 0 
           ? null
           : es(s, n);
}

// Returns the item in stream s at index n (the first item is at position 0)
// Lazy? Sort-of: stream_ref only forces the computation of
//                the first n elements, and leaves the rest of
//                the stream untouched.
function stream_ref(s, n) {
  return n === 0
    ? head(s)
    : stream_ref(stream_tail(s), n - 1);
}
global.equal = equal;
global.$length = $length;
global.length = length;
global.$map = $map;
global.map = map;
global.$build_list = $build_list;
global.build_list = build_list;
global.for_each = for_each;
global.$list_to_string = $list_to_string;
global.list_to_string = list_to_string;
global.$reverse = $reverse;
global.reverse = reverse;
global.$append = $append;
global.append = append;
global.member = member;
global.$remove = $remove;
global.remove = remove;
global.$remove_all = $remove_all;
global.remove_all = remove_all;
global.$filter = $filter;
global.filter = filter;
global.$enum_list = $enum_list;
global.enum_list = enum_list;
global.list_ref = list_ref;
global.$accumulate = $accumulate;
global.accumulate = accumulate;
global.is_stream = is_stream;
global.list_to_stream = list_to_stream;
global.stream_to_list = stream_to_list;
global.stream_length = stream_length;
global.stream_map = stream_map;
global.build_stream = build_stream;
global.stream_for_each = stream_for_each;
global.stream_reverse = stream_reverse;
global.stream_append = stream_append;
global.stream_member = stream_member;
global.stream_remove = stream_remove;
global.stream_remove_all = stream_remove_all;
global.stream_filter = stream_filter;
global.enum_stream = enum_stream;
global.integers_from = integers_from;
global.eval_stream = eval_stream;
global.stream_ref = stream_ref;
global.get_time = dict.get("get_time");
global.display = dict.get("display");
global.raw_display = dict.get("raw_display");
global.stringify = dict.get("stringify");
global.error = dict.get("error");
global.prompt = dict.get("prompt");
global.is_number = dict.get("is_number");
global.is_string = dict.get("is_string");
global.is_function = dict.get("is_function");
global.is_boolean = dict.get("is_boolean");
global.is_undefined = dict.get("is_undefined");
global.parse_int = dict.get("parse_int");
global.char_at = dict.get("char_at");
global.arity = dict.get("arity");
global.math_abs = dict.get("math_abs");
global.math_acos = dict.get("math_acos");
global.math_acosh = dict.get("math_acosh");
global.math_asin = dict.get("math_asin");
global.math_asinh = dict.get("math_asinh");
global.math_atan = dict.get("math_atan");
global.math_atanh = dict.get("math_atanh");
global.math_atan2 = dict.get("math_atan2");
global.math_ceil = dict.get("math_ceil");
global.math_cbrt = dict.get("math_cbrt");
global.math_expm1 = dict.get("math_expm1");
global.math_clz32 = dict.get("math_clz32");
global.math_cos = dict.get("math_cos");
global.math_cosh = dict.get("math_cosh");
global.math_exp = dict.get("math_exp");
global.math_floor = dict.get("math_floor");
global.math_fround = dict.get("math_fround");
global.math_hypot = dict.get("math_hypot");
global.math_imul = dict.get("math_imul");
global.math_log = dict.get("math_log");
global.math_log1p = dict.get("math_log1p");
global.math_log2 = dict.get("math_log2");
global.math_log10 = dict.get("math_log10");
global.math_max = dict.get("math_max");
global.math_min = dict.get("math_min");
global.math_pow = dict.get("math_pow");
global.math_random = dict.get("math_random");
global.math_round = dict.get("math_round");
global.math_sign = dict.get("math_sign");
global.math_sin = dict.get("math_sin");
global.math_sinh = dict.get("math_sinh");
global.math_sqrt = dict.get("math_sqrt");
global.math_tan = dict.get("math_tan");
global.math_tanh = dict.get("math_tanh");
global.math_trunc = dict.get("math_trunc");
global.math_E = dict.get("math_E");
global.math_LN10 = dict.get("math_LN10");
global.math_LN2 = dict.get("math_LN2");
global.math_LOG10E = dict.get("math_LOG10E");
global.math_LOG2E = dict.get("math_LOG2E");
global.math_PI = dict.get("math_PI");
global.math_SQRT1_2 = dict.get("math_SQRT1_2");
global.math_SQRT2 = dict.get("math_SQRT2");
global.pair = dict.get("pair");
global.is_pair = dict.get("is_pair");
global.head = dict.get("head");
global.tail = dict.get("tail");
global.is_null = dict.get("is_null");
global.list = dict.get("list");
global.draw_data = dict.get("draw_data");
global.display_list = dict.get("display_list");
global.is_list = dict.get("is_list");
global.set_head = dict.get("set_head");
global.set_tail = dict.get("set_tail");
global.array_length = dict.get("array_length");
global.is_array = dict.get("is_array");
global.stream_tail = dict.get("stream_tail");
global.stream = dict.get("stream");
global.list_to_stream = dict.get("list_to_stream");
global.parse = dict.get("parse");
global.tokenize = dict.get("tokenize");
global.apply_in_underlying_javascript = dict.get("apply_in_underlying_javascript");
