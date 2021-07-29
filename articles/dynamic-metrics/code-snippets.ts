// function f(a: number): number {
// 	if (a > 0) {                    // cpx = 1 (one identifier used in one operation)
// 		return a * 2;               // cpx = 1 (one identifier used in one operation)
// // TOTAL: dyn(f) = 2


// function f(a: number): number {     // a = 2
// 	if (a > 0) {                    // As a = 2, we enter in the if
// 		return a * 2;               // a = 2 => we return 4
// 	} else if (a === 0) {
// 		return 0;
// 	} else {
// 		return -1;
// 	}çàç
// }

// function f(arr: number[]): number {     // I store the value [2, 3] for the variable arr in my memory
// 	let sum = 0;                        // I store the value 0 for the variable sum in my memory
// 	for (let element of arr) {          // I remember that arr = [2, 3], and I take its first element
// 										// => I store the value 2 for the variable element in my memory
// 		sum = sum + element;            // I remember that sum = 0, element = 2, I do the addition,
// 											// => I store the value 2 for the variable sum in my memory
// 	for (let element of arr) {          // I remember that arr = [2, 3], and I remember that
// 											// the element previously chosen was the first one
// 											// => I store the value 3 for the variable element in my memory
// 		sum = sum + element;            // I remember that sum = 2, element = 3, I do the addition
// 											// and I store the value 5 for the variable sum in my memory
// 	}
// 	return sum;                         // I remember that sum = 5 and I return it
// }

// function f(arr: number[]): number {
// 	let sum = 0;
// 	for (let element of arr) {
// 		sum = sum + element;
// 	}
// 	return sum;
// }

function g(a: number): number {
	if (a > 0) {
		return 0
	} else {
		// Do a very long and complicated stuff, and then return some value
	}
}

function u(a: number): number {
	let response = a * 2;
	return response;
}

// function v(a: number): number {
// 	let response = a * 2;
// 	response = response + 1;
// 	return response;
// }

function w(a: number): number {
	let response = a * 2;
	response = response + 1;
	response = response - 3;
	return response;
}


function v(a: number): number {
	let response = a * 2;           // cpx = 1 (there is only one identifier used in an operation: a)
	if (a > 0) {
		response = response + 1;    // cpx = 1 (there is only one identifier used in an operation: response)
	} else {
		response = response - 1;    // cpx = 0 (line not read because we chose a positive value for a)
	}
	return response;
}
// TOTAL: for a = 2, dyn(v) = 2

// function f(arr: number[]): number {     // arr = [1, 2, 4, 5, 7, 8]
// 	let sum = 0;                        // sum = 0
// 	for (let element of arr) {          // element = 1
// 		sum = sum + element;            // sum = 1
// 	for (let element of arr) {          // element = 2
// 		sum = sum + element;            // sum = 3
// 	for (let element of arr) {          // element = 4
// 		sum = sum + element;            // sum = 7
// 	for (let element of arr) {          // element = 5
// 		sum = sum + element;            // sum = 12
// 	for (let element of arr) {          // element = 7
// 		sum = sum + element;            // sum = 19
// 	for (let element of arr) {          // element = 8
// 		sum = sum + element;            // sum = 27
// 	}
// 	return sum;                         // sum = 27
// }

// function f(arr: number[]): number {
// 	let sum = 0;                        // cpx = 0 (assignment)
// 	for (let element of arr) {          // cpx = 1 (usage of arr in the operation let ... of ...)
// 		sum = sum + element;            // cpx = 2 (usage of arr and element in the operation +)
// 	for (let element of arr) {          // cpx = 1
// 		sum = sum + element;            // cpx = 2
// 	for (let element of arr) {          // cpx = 1
// 		sum = sum + element;            // cpx = 2
// 	for (let element of arr) {          // cpx = 1
// 		sum = sum + element;            // cpx = 2
// 	for (let element of arr) {          // cpx = 1
// 		sum = sum + element;            // cpx = 2
// 	for (let element of arr) {          // cpx = 1
// 		sum = sum + element;            // cpx = 2
// 	}
// 	return sum;                         // cpx = 0 (no operation)
// }
// TOTAL: dyn(f) = 18

function f(arr: number[]): number {
	let sum = 0;                        // cpx = 0 (assignment)
	for (let element of arr) {          // cpx = 1 (usage of arr in the operation let ... of ...)
		sum = sum + element;            // cpx = 2 (usage of arr and element in the operation +)
	for (let element of arr) {          // cpx = 0.5 (1 * 0.5)
		sum = sum + element;            // cpx = 1 (2 * 0.5)
	for (let element of arr) {          // cpx = 0.25 (0.5 * 0.5)
		sum = sum + element;            // cpx = 0.5 (1 * 0.5)
	for (let element of arr) {          // cpx = 0.125 (0.25 * 0.5)
		sum = sum + element;            // cpx = 0.25 (0.5 * 0.5)
	for (let element of arr) {          // cpx = 0.0625 (0.125 * 0.5)
		sum = sum + element;            // cpx = 0.125 (0.25 * 0.5)
	for (let element of arr) {          // cpx = 0.03125 (0.0625 * 0.5)
		sum = sum + element;            // cpx = 0.0625 (0.125 * 0.5)
	}
	return sum;                         // cpx = 0 (no operation)
}
// TOTAL: dyn(f) = 5.90625

// function h(a: number): number {
// 	if (a > 0) {
// 		return a * 2;
// 	} else if (a === 0) {
// 		return 0;
// 	} else {
// 		return -1;
// 	}
// }
